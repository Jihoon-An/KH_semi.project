package controllers;

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

        switch (uri) {
            // 페이지 띄우기
            case "/page.userMyPage":
                //user 데이터 불러오기



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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
}
