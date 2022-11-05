package controllers;

import dao.FavoritesDAO;
import dao.GymDAO;
import dao.ReviewDAO;
import dao.UserDAO;
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
                    break;
                // 프로필 수정
                case "/fixProfile.userMyPage":

                    break;
                //비밀번호 변경
                case "/pw.userMyPage":

                    break;
                //회원 탈퇴
                case "/signDown.userMyPage":

                    break;
                //즐겨찾기 삭제
                case "/delHeart.userMyPage":

                    break;
                //리뷰 삭제
                case "/delReview.userMyPage":

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
        request.getSession().setAttribute("userSeq", 1);
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
        //보내기
        request.getRequestDispatcher("/user/users-mypage.jsp").forward(request,response);
    }
}
