package controllers;

import dao.ReviewDAO;
import dao.UserDAO;
import dto.ReviewDTO;
import dto.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
                    //페이지에서 데이터 불러오기
                    int userId = (Integer) request.getSession().getAttribute("userId");
                    // user 데이터 불러오기
                    UserDTO userDTO = UserDAO.getInstance().selectSeq(userId);
                    // reivew 데이터 불러오기
//                    ReviewDTO reviewDTO = ReviewDAO.getInstance().printReivew();

                    //userdata 담기
                    //보내기
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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
}
