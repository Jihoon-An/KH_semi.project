package controllers;

import com.google.gson.Gson;
import commons.FileControl;
import dao.*;
import dto.FavoritesDTO;
import dto.GymDTO;
import dto.ReviewDTO;
import dto.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * developer : Jihoon
 */

@WebServlet("*.userMyPage")
public class UserMyPageController extends ControllerAbs {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);

        String uri = request.getRequestURI();
        try {
            switch (uri) {
                // 페이지 띄우기
                case "/page.userMyPage":
                    this.getPage(request, response);
                    request.getRequestDispatcher("/user/users-mypage.jsp").forward(request, response);
                    break;
                // 프로필 수정
                case "/fixProfile.userMyPage":
                    //ajax
                    this.updateProfile(request, response);
                    break;
                //비밀번호 변경
                case "/pw.userMyPage":
                    this.updatePw(request, response);
                    this.getPage(request, response);
                    request.getRequestDispatcher("/user/users-mypage.jsp").forward(request, response);
                    break;
                //회원 탈퇴
                case "/signDown.userMyPage":
                    this.signDown(request, response);
                    // 로그아웃
                    request.getSession().removeAttribute("userSeq");
                    response.sendRedirect("/");
                    break;
                //즐겨찾기 삭제
                case "/delHeart.userMyPage":
                    FavoritesDAO.getInstance().deleteByFavoriteSeq(Integer.parseInt(request.getParameter("fav_seq")));
                    break;
                //즐겨찾기 다시 추가
                case "/addHeart.userMyPage":
                    this.addHeart(request, response);
                    break;
                //리뷰 삭제
                case "/delReview.userMyPage":
                    int reviewSeq = Integer.parseInt(request.getParameter("review_seq"));
                    ReviewDAO.getInstance().deleteByReviewSeq(reviewSeq);
                    break;
                //프로필 이미지(PI) 수정
                case "/modifyPI.userMyPage":
                    this.updatePI(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }

    /**
     * <h2>즐겨찾기 추가</h2>
     */
    private void addHeart(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int favSeq = Integer.parseInt(request.getParameter("fav_seq"));
        int gymSeq = Integer.parseInt(request.getParameter("gym_seq"));
        int userSeq = (Integer) request.getSession().getAttribute("userSeq");
        FavoritesDTO favDTO = new FavoritesDTO(favSeq, userSeq, gymSeq);

        FavoritesDAO.getInstance().addCus(favDTO);
    }

    /**
     * <h2>페이지를 띄우는 기본 메서드</h2>
     */
    protected void getPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //test용 login seq 발행
//        request.getSession().setAttribute("userSeq", 1);

        int userSeq = (Integer) request.getSession().getAttribute("userSeq");
        // user 데이터 불러오기
        UserDTO user = UserDAO.getInstance().selectBySeq(userSeq);

        List<Integer> gymsSeq = FavoritesDAO.getInstance().getGymListByUser(userSeq);
        // 즐겨찾기 한 데이터
        List<GymDTO> gyms = new ArrayList<>();
        GymDAO gymDAO = GymDAO.getInstance();
        List<Integer> favs = new ArrayList<>();

        for (int gymSeq : gymsSeq) {
            gyms.add(gymDAO.printGym(gymSeq));
            favs.add(FavoritesDAO.getInstance().getFavSeqByUserAndGym(userSeq, gymSeq));
        }
        // reivew 데이터
        List<ReviewDTO> reviews = ReviewDAO.getInstance().getListByUser(userSeq);

        //data 담기
        request.setAttribute("user", user);
        request.setAttribute("favs", favs);
        request.setAttribute("gyms", gyms);
        request.setAttribute("reviews", reviews);

    }

    /**
     * <h1>프로필 수정</h1>
     * <h2>사진은 제외</h2>
     */
    protected void updateProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserDTO user = new UserDTO();
        Gson gson = new Gson();
        user.setSeq(Integer.parseInt(request.getParameter("userSeq")));
        user.setName(request.getParameter("name"));
        user.setSex(request.getParameter("sex"));
        user.setPhone(request.getParameter("phone"));
        user.setBirthday(request.getParameter("birthday"));
        user.setInterest(gson.toJson(request.getParameter("interest")));

        UserDAO.getInstance().updateProfileInfo(user);
    }

    /**
     * <h1>>비밀번호 변경</h1
     */
    protected void updatePw(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String pw = request.getParameter("pw");
        int userSeq = Integer.parseInt(request.getParameter("userSeq"));
        UserDAO.getInstance().updatePw(userSeq, pw);
    }

    /**
     * <h1>회원탈퇴를 위한 데이터 삭제</h1>
     */
    protected void signDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // userSeq 받아오기
        int userSeq = (Integer) request.getSession().getAttribute("userSeq");
        // 프사지우기
        String path = "/resource/profile"; //런타임 webapp 폴더를 불러옴.
        String delFileName = UserDAO.getInstance().getPiNameByUserSeq(userSeq);
        new FileControl().delete(request, path, delFileName);
        // 유저 테이블 삭제
        UserDAO.getInstance().deleteByUserSeq(userSeq);
        // 즐겨찾기 테이블 삭제
        FavoritesDAO.getInstance().deleteByUserSeq(userSeq);
        // 헬스장 회원 테이블 삭제
        ManagerDAO.getInstance().deleteByUserSeq(userSeq);
        // 캘린더 테이블 삭제
        CalendarDAO.getInstance().deleteByUserSeq(userSeq);
        // 운동기록 테이블 삭제
        ExerciseDAO.getInstance().deleteByUserSeq(userSeq);
    }

    /**
     * <h1>insert profile image to DB</h1>
     */
    protected void updatePI(HttpServletRequest request, HttpServletResponse response) throws Exception {

        FileControl fileControl = new FileControl();
        String path = "/resource/profileImg";
        String sysName = fileControl.save(request, path, "user_img_in");

        int userSeq = (Integer) request.getSession().getAttribute("userSeq");

        // 기존 파일 지우기
        String beforePiName = UserDAO.getInstance().getPiNameByUserSeq(userSeq);
        fileControl.delete(request, path, beforePiName);

        // 새로 생성한 파일 커밋
        UserDAO.getInstance().updatePi(userSeq, sysName);
    }
}
