package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.UserDTO;


@WebServlet("*.host")
public class HostUserController extends ControllerAbs {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        String uri = request.getRequestURI();

        try{
            switch (uri) {

                //관리자 페이지 회원목록 출려
                case "userslist/.host": {
                    UserDAO dao = UserDAO.getInstance();
                    List<UserDTO> dtos = dao.selectAll();
                    break;
                }

                //관리자 페이지 회원 삭제
                case "usersDel/.host": {
                    break;
                }


                default:
                    break;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

}
