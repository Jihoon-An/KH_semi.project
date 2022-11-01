package controllers;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.UserDTO;

@WebServlet("*.user")
public class UserController extends ControllerAbs {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		super.doGet(request, response);
		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri);
		System.out.println("요청 메소드 : " + request.getMethod());

		try {
			if (uri.equals("/login.user")) {
				if (request.getMethod().equals("GET")) {
					response.sendRedirect("/error.jsp");
					return;
				}
				String req_email = request.getParameter("user_id");
				String req_pw = request.getParameter("user_pw");
				System.out.println("입력 ID : " + req_email);
				System.out.println("입력 패스워드 : " + req_pw);
				List<UserDTO> list = UserDAO.getInstance().searchAll("id", req_email);
				if (!list.isEmpty()) {
					if (getSHA512(req_pw).equals(list.get(0).getPw())) {
						request.getSession().setAttribute("user", UserDAO.getInstance().searchAll("user_email", req_email).get(0));
						System.out.println("로그인 성공");
						System.out.println("세션 로그인 ID : " + request.getSession().getAttribute("user.email"));
						response.getWriter().append("true");
						return;
					} else {
						System.out.println("비밀번호 오류");
					}
				} else {
					System.out.println("등록되지 않은 ID");
				}
				response.getWriter().append("false");
			}

			if (uri.equals("/searchId.user")) {
				String req_name = request.getParameter("searchId_name");
				String req_phone = request.getParameter("searchId_phone");
				System.out.println("입력 이름 : " + req_name);
				System.out.println("입력 폰번호 : " + req_phone);
				response.getWriter().append(UserDAO.getInstance().searchId(req_name, req_phone));
			}
			
			if (uri.equals("/searchPw.user")) {
				String req_email = request.getParameter("searchPw_email");
				String req_phone = request.getParameter("searchPw_phone");
				System.out.println("입력 이메일 : " + req_email);
				System.out.println("입력 폰번호 : " + req_phone);
				response.getWriter().append(UserDAO.getInstance().searchPw(req_email, req_phone).toString());
			}
			
			if (uri.equals("/logout.user")) {
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getSHA512(String input) {

		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toReturn;
	}
}
