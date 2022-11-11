package controllers;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect.Type;
import java.util.List;

import javax.naming.InterruptedNamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;


import dao.BsUsersDAO;
import dao.UserDAO;
import dto.BsUsersDTO;
import dto.UserDTO;
import oracle.net.aso.a;



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
        case "/usersList.host":
        	
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
        case "/usersDel.host":
        	
        	this.userDel(request,response);
        	break;
        //관리자 페이지 사업자회원 삭제
        case "/bsUsersDel.host":
        	this.bsUserDel(request,response);
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
			
		 int cpage = Integer.parseInt(request.getParameter("cpage")); //네비바
		

		 UserDAO usersdao = UserDAO.getInstance();
		 String userNavi=usersdao.getPageNavi(cpage); //네비바 dao 인자 cpage
		 List<UserDTO> userList = UserDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
    	

    	
    		request.setAttribute("userList", userList); //user
    		request.setAttribute("userNavi", userNavi);//네비
			request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);
	 
	 }
	 
	 protected void getBsUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		 int cpage = Integer.parseInt(request.getParameter("cpage")); //네비바 
		
	
		
		 
    		BsUsersDAO bsDao = BsUsersDAO.getInstance();
    		 String bsUsersNavi=bsDao.getPageNavi(cpage); //네비바 dao 인자 cpage
    	
    		
    		List<BsUsersDTO> bsUserList = BsUsersDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
    		
   
			request.setAttribute("bsUserList",  bsUserList); 
			request.setAttribute("bsUserNavi", bsUsersNavi); //네비바
			request.getRequestDispatcher("/host/host-bsuser.jsp").forward(request, response);
	 
	 }
	 
	 protected void getBsSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 	
		 	String text= request.getParameter("inputT");
			 BsUsersDAO bsUserDao = BsUsersDAO.getInstance();
	    		List<BsUsersDTO> bsUserDto = bsUserDao.search(text);
	    	
	    		System.out.println(bsUserDto);
	    	
	    		request.setAttribute("bsUserList", bsUserDto); //user
			
				request.getRequestDispatcher("/host/host-bsuser.jsp").forward(request, response);
		 
		 }
	 
//	 
	 protected void userDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 UserDAO userDao = UserDAO.getInstance();
		 
		 
		String jsonstr = request.getParameter("userseq");
		System.out.println(jsonstr);
			
		Gson gson = new Gson();
		java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
	
	
		List<Integer>  seqList = gson.fromJson(jsonstr, type);
		System.out.println(seqList);

		for(int i = 0; i<seqList.size(); i++) {
				userDao.deleteByUserSeq(seqList.get(i));
		}

		
		 }
	 
	 protected void bsUserDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		BsUsersDAO bsUsersDAO= BsUsersDAO.getInstance();
		 
		 
		String jsonstr = request.getParameter("userseq");
		System.out.println(jsonstr);
			
		Gson gson = new Gson();
		java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
		List<Integer>  seqList = gson.fromJson(jsonstr, type);
		System.out.println(seqList);

		for(int i = 0; i<seqList.size(); i++) {
				bsUsersDAO.deleteByBsSeq(seqList.get(i));
		}

		
		 }
	 
	 
	 protected void getUserSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		 
		 	String text= request.getParameter("inputName");
		 	System.out.println(text);
		 	UserDAO usersDao = UserDAO.getInstance();
	    		List<UserDTO> userDto = usersDao.searchUser(text);
	    	
	    		System.out.println(userDto);
	    	
	    		request.setAttribute("userList", userDto); //user
			
				request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);
		 
		 }
}

