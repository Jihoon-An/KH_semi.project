package controllers;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.UserDTO;

/**
 * Servlet implementation class HeaderController
 */
@WebServlet("*.user")
public class UserController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
        response.setContentType("text/html;charset=utf8");
		String uri = request.getRequestURI();
		System.out.println("요청 URI : " + uri);
		System.out.println("요청 메소드 : " + request.getMethod());

		try {
			switch(uri) {
			
			// 로그인 요청
			case "/login.user":
				// GET 요청 시 에러페이지로 넘김
				if (request.getMethod().equals("GET")) {
					response.sendRedirect("/error.jsp");
					return;
				}
				String req_email = request.getParameter("login_id");
				String req_pw = request.getParameter("login_pw");
				boolean req_bs = request.getParameter("login_bs").equals("true") ? true : false;
				System.out.println("입력 ID : " + req_email);
				System.out.println("입력 패스워드 : " + req_pw);
				System.out.println("운영자 로그인 여부 : " + req_bs);
				List<UserDTO> list = UserDAO.getInstance().searchAll("user_email", req_email);
				if (!list.isEmpty()) {
//					if (getSHA512(req_pw).equals(list.get(0).getPw())) {
					if (req_pw.equals(list.get(0).getPw())) {
						request.getSession().setAttribute("userId", list.get(0).getEmail());
						System.out.println("로그인 성공");
						System.out.println("세션 로그인 ID : " + request.getSession().getAttribute("userId"));
						response.getWriter().append("true");
						return;
					} else {
						System.out.println("비밀번호 오류");
					}
				} else {
					System.out.println("등록되지 않은 ID");
				}
				response.getWriter().append("false");
				break;
				
			// 아이디 찾기 요청
			case "/searchId.user":
				String req_name = request.getParameter("name");
				String req_phone = request.getParameter("phone");
				System.out.println("입력 이름 : " + req_name);
				System.out.println("입력 폰번호 : " + req_phone);
				response.getWriter().append(UserDAO.getInstance().searchId(req_name, req_phone));
				break;
				
			// 비밀번호 찾기 요청
			case "/searchPw.user":
				req_email = request.getParameter("email");
				req_phone = request.getParameter("phone");
				System.out.println("입력 이메일 : " + req_email);
				System.out.println("입력 폰번호 : " + req_phone);
				response.getWriter().append(String.valueOf(UserDAO.getInstance().searchPw(req_email, req_phone)));
				break;
			
			// 로그아웃 요청
			case "/logout.user":
				request.getSession().invalidate();
				break;
			
			// 회원가입 요청
			case "/sign.user":
				break;
			
			// 사업자 회원가입 요청
			case "/bsSign.user":
				break;

			// 아이디 중복체크 요청
			case "/duplCheck.user":
				req_email = request.getParameter("user_email");
				response.getWriter().append(String.valueOf(UserDAO.getInstance().isUserEmailCheck(req_email)));
				
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
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
