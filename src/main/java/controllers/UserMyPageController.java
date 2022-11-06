package controllers;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.*;
import dto.GymDTO;
import dto.ReviewDTO;
import dto.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
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
                    response.sendRedirect("/");
                    break;
                //즐겨찾기 삭제
                case "/delHeart.userMyPage":
                    break;
                //즐겨찾기 다시 추가
                case "/addHeart.userMyPage":
                    break;
                //리뷰 삭제
                case "/delReview.userMyPage":
                    break;
                //프로필 이미지(PI) 수정
                case "/modifyPI.userMyPage":
                    this.insertPI(request, response);
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
     * 페이지를 띄우는 기본 메서드
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

        for (int gymSeq : gymsSeq) {
            gyms.add(gymDAO.printGym(gymSeq));
        }
        // reivew 데이터
        List<ReviewDTO> reviews = ReviewDAO.getInstance().selectByUser(userSeq);

        //data 담기
        request.setAttribute("user", user);
        request.setAttribute("gyms", gyms);
        request.setAttribute("reviews", reviews);

    }

    /**
     * 프로필 수정,
     * 사진은 제외
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
     * 비밀번호 변경
     */
    protected void updatePw(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String pw = request.getParameter("pw");
        int userSeq = Integer.parseInt(request.getParameter("userSeq"));
        UserDAO.getInstance().updatePw(userSeq, pw);
    }

    protected void signDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // userSeq 받아오기
        int userSeq = (Integer) request.getSession().getAttribute("userSeq");
        // 로그아웃
        request.getSession().removeAttribute("userSeq");
        // 유저 테이블 삭제
        UserDAO.getInstance().deleteByUserSeq(userSeq);
        // 즐겨찾기 테이블 삭제
        FavoritesDAO.getInstance().deleteByUserSeq(userSeq);
        // 헬스장 회원 테이블 삭제
        MembershipDAO.getInstance().deleteByUserSeq(userSeq);
        // 캘린더 테이블 삭제
        CalendarDAO.getInstance().deleteByUserSeq(userSeq);
        // 운동기록 테이블 삭제
        ExerciseDAO.getInstance().deleteByUserSeq(userSeq);
    }

    protected void insertPI(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 최대 파일 크기
        int maxSize = 1024 * 1024 * 10;

        //경로 저장
        String savePath = request.getServletContext().getRealPath("/resource/profileImg"); //런타임 webapp 폴더를 불러옴.
        File fileSavePath = new File(savePath);

        // 폴더 생성
        if (!fileSavePath.exists()) { //find directory
            fileSavePath.mkdir();//make directory
        }
        // 파일 생성
        MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());
        String sysName = multi.getFilesystemName("user_img_in");

        int userSeq = (Integer) request.getSession().getAttribute("userSeq");

        // 기존 파일 지우기
        String beforePiName = UserDAO.getInstance().getPiNameByUserSeq(userSeq);
        File beforeFile = new File(savePath+"/"+beforePiName);
        if(beforeFile.exists()){
            beforeFile.delete();
        }
        // 새로 생성한 파일 커밋
        UserDAO.getInstance().insertPi(userSeq, sysName);
    }
}
