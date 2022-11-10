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

        try {
        switch (uri) {
		
        // 관리자 임시 로그인용
        case "/admin.host":
        	request.getSession().invalidate();
        	request.getSession().setAttribute("admin", true);
        	response.sendRedirect("/index.jsp");
        	break;
        
        //관리자 페이지 일반회원목록 출력
        case "/userslist.host":
        	
        	this.getUserList(request, response);
        	break;
        
        case "/userSearch.host":
        	System.out.println("검색시작");
        	this.getUserSearch(request, response);
        	break;
        case "/bsUserList.host" :
        	this.getBsUserList(request, response);
        	break;
        	
       	
        //관리자 사업자 회원 페이지 검색
        case "/bsUserSearch.host":
        	this.getBsSearch(request,response);
        	break;
        //관리자 페이지 회원 삭제
//        case "/usersDel.host":
//        	
//        	this.getUserDel(request,response);
//        	break;
        	
        case "/bsUsersDel.host":
        	break;
        
			
		

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
	
	 protected void getUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		// int capge = Integer.parseInt(request.getParameter("cpage")); //네비바 
		 //String navi=dao.getPageNavi(capge); //네비바 dao 인자

		 UserDAO dao = UserDAO.getInstance();
    		List<UserDTO> dto = dao.selectAll();
    	
    		System.out.println(dto);
    	
    		request.setAttribute("list", dto); //user
		
			request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);
	 
	 }
	 
	 protected void getBsUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		// int capge = Integer.parseInt(request.getParameter("cpage")); //네비바 
		
	
		 int cpage=1; //임시
		 
    		BsUsersDAO dao2 = BsUsersDAO.getInstance();
    		 String navi=dao2.getPageNavi(cpage); //네비바 dao 인자 cpage
    		//List<BsUsersDTO> dto2 = dao2.selectAll();
    		
    		List<BsUsersDTO> list = BsUsersDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
    		System.out.println(list);
   
			request.setAttribute("list", list); //bsuser  //네비바
			request.setAttribute("navi", navi);
			request.getRequestDispatcher("/host/host-bsuser.jsp").forward(request, response);
	 
	 }
	 
	 protected void getBsSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 	
		 	String text= request.getParameter("inputT");
			 BsUsersDAO dao = BsUsersDAO.getInstance();
	    		List<BsUsersDTO> dto = dao.search(text);
	    	
	    		System.out.println(dto);
	    	
	    		request.setAttribute("list", dto); //user
			
				request.getRequestDispatcher("/host/host-bsuser.jsp").forward(request, response);
		 
		 }
	 
//	 
//	 protected void getUserDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			String[] useq = request.getParameterValues("userseq");
//			
//			
//			System.out.println(useq);
//		 	
//		 	String text= request.getParameter("inputT");
//			 UserDAO dao = UserDAO.getInstance();
//	    		List<UserDTO> dto = dao.searchUser(text);
//	    	
//	    		System.out.println(dto);
//	    	
//	    		request.setAttribute("list", dto); //user
//			
//				request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);
//		 
//		 }
	 
	 
	 protected void getUserSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		 
		 	String text= request.getParameter("inputName");
		 	System.out.println(text);
		 	UserDAO dao = UserDAO.getInstance();
	    		List<UserDTO> dto = dao.searchUser(text);
	    	
	    		System.out.println(dto);
	    	
	    		request.setAttribute("list", dto); //user
			
				request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);
		 
		 }
}

