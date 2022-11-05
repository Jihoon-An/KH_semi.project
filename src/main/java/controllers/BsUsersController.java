package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.Common;
import dao.BsCtfcDAO;
import dao.BsUsersDAO;
import dto.BsCtfcDTO;
import dto.BsUsersDTO;

/**
 * Servlet implementation class BsController
 */
@WebServlet("*.bs")
public class BsUsersController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Common.setUtf8(request, response);
		String uri = request.getRequestURI();

		try {
			switch (uri) {

			// 로그인 요청
			case "/login.bs":

			// 회원가입 요청
			case "/sign.bs":
				// GET 요청 시 에러페이지로 넘김
				if (request.getMethod().equals("GET")) {
					response.sendRedirect("/error.jsp");
					return;
				}
				response.getWriter().append(String.valueOf(this.isBsSignUp(request, response)));
				break;

			// 아이디 중복체크 요청
			case "/duplCheck.bs":
				response.getWriter().append(String.valueOf(this.isBsDuplCheck(request, response)));
				break;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected boolean isBsDuplCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("bs_email");
		return BsUsersDAO.getInstance().isBsEmailCheck(req_email);
	}

	protected int isBsSignUp(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int maxSize = 1024 * 1024 * 10;
		String savePath = request.getServletContext().getRealPath("/files");
		System.out.println(savePath);

		File fileSavePath = new File(savePath);
		if (!fileSavePath.exists()) {
			fileSavePath.mkdir();
		}
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		System.out.println("Posted content type isn't multipart/form-data 에러 발생");
		
		String req_email = multi.getParameter("bs_email");
		String req_pw = multi.getParameter("bs_pw_re");
		String req_name = multi.getParameter("bs_name");
		String req_phone = multi.getParameter("bs_phone");
		String req_number = multi.getParameter("bs_number");
		
		int bsSeqNextVal = BsUsersDAO.getInstance().getBsSeqNextVal();
				
		Enumeration<String> e = multi.getFileNames();
		
		while(e.hasMoreElements()) { // 하나만 받아서 이거 필요없긴함..
			String name = e.nextElement();
			System.out.println(name);
			
			String oriName = multi.getOriginalFileName(name);
			String sysName = multi.getFilesystemName(name);
			
			if(name != null) { // 널값을 만나면 컨티뉴 되게 하기 // 프론트에서 onsubmit 만나면 서브밋 안되게 값 삭제하기 
				if(oriName == null) { continue; };
				BsCtfcDAO.getInstance().uploadBsCtfc(new BsCtfcDTO(bsSeqNextVal, req_number, oriName, sysName));
			}
		}
		
		
		// json으로 받아서 쪼개기
		//JSON 읽어와서 쿼리에 담기위한 사전작업
		
		String gym_name = multi.getParameter("gym_name");
		String gym_phone = multi.getParameter("gym_phone");
		String gym_address1 = multi.getParameter("gym_address1");
		String gym_address2 = multi.getParameter("gym_address2");
		String gym_x = multi.getParameter("gym_x");
		String gym_y = multi.getParameter("gym_y");
		
		String gym_location = gym_address1 + " " + gym_address2;

		System.out.println(gym_name);
		System.out.println(gym_phone);
		System.out.println(gym_location);
		System.out.println(gym_x);
		System.out.println(gym_y);
		
//		String[] gym_name = multi.getParameterValues("gym_name");
//		String[] gym_phone = multi.getParameterValues("gym_phone");
//		String[] gym_address1 = multi.getParameterValues("gym_address1");
//		String[] gym_address2 = multi.getParameterValues("gym_address2");
//		String[] gym_x = multi.getParameterValues("gym_x");
//		String[] gym_y = multi.getParameterValues("gym_y");
//		
//		String gym_location = " ";
//		
//		for(int i=0;i<gym_name.length;i++) {
//			
//		}
		
		

//		String gym_location = " ";
//		
//		List<String> gymNameList = new ArrayList<String>(); 
//		List<String> gymPhoneList = new ArrayList<String>(); 
//		List<String> gymAddress1List = new ArrayList<String>(); 
//		List<String> gymAddress2List = new ArrayList<String>(); 
//		List<String> gymXList = new ArrayList<String>(); 
//		List<String> gymYList = new ArrayList<String>(); 
//		
//		Enumeration<String> names = request.getParameterNames();
//		
//		do {
//		  String name = names.nextElement();
//		  String value = request.getParameter(name);  
//
//		  if(name.startsWith("gym_name")) {
//			  gymNameList.add(value);
//		  } else if(name.startsWith("gym_phone")) {
//			  gymPhoneList.add(value);
//		  } else if(name.startsWith("gym_phone")) {
//			  gymAddress1List.add(value);
//		  } else if(name.startsWith("gym_address1")) {
//			  gymAddress2List.add(value);
//		  } else if(name.startsWith("gym_x")) {
//			  gymXList.add(value);
//		  } else if(name.startsWith("gym_y")) {
//			  gymYList.add(value);
//		  }
//
//		} while (names.hasMoreElements());
		
		
		
//		GymDAO.getInstance().addGYM(new GymDTO(bsSeqNextVal,0,gym_name,gym_phone,gym_location,null,null,null,null,null,gym_x,gym_y));
		
		int result = BsUsersDAO.getInstance().isBsSignUp(new BsUsersDTO(bsSeqNextVal,req_email,Common.getSHA512(req_pw),req_name,req_phone,req_number,null));

		
		return result;
		
	}
	
	
	
	
	
	
	
}
