package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BsUsersDAO;
import dao.UserDAO;
import dto.BsUsersDTO;
import dto.UserDTO;


@WebServlet("*.host")
public class HostUserController extends ControllerAbs {
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 super.doGet(request, response);
        String uri = request.getRequestURI();

        try {
        switch (uri) {
		
        //관리자 페이지 회원목록 출려
        case "/userslist.host":{
        		UserDAO dao = UserDAO.getInstance();
        		List<UserDTO> dto = dao.selectAll();
        		BsUsersDAO dao2 = BsUsersDAO.getInstance();
        		List<BsUsersDTO> dto2 = dao2.selectAll();
        		
        		request.setAttribute("list", dto);
    			request.setAttribute("list2", dto2);
    			request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);
        	break;
        }
        
        //관리자 페이지 회원 삭제
        case "usersDel/.host":{
        	break;
        }
			
		

		default:
			break;
		}
        }catch (Exception e) {
			e.printStackTrace();
		}
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		this.doGet(request, response);
	}

}
