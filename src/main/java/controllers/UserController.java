package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.Common;
import dao.UserDAO;
import dto.UserDTO;

/**
 * Servlet implementation class HeaderController
 */
@WebServlet("*.user")
public class UserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Common.setUtf8(request, response);
		String uri = request.getRequestURI();
		try {
			switch (uri) {

			// 로그인 요청
			case "/login.user":
				// GET 요청 시 에러페이지로 넘김
				if (request.getMethod().equals("GET")) {
					response.sendRedirect("/error.jsp");
					return;
				}
				response.getWriter().append(String.valueOf(this.isLogin(request, response)));
				break;

			// 아이디 찾기 요청
//			case "/searchId.user":
//				List<UserDTO> list = UserDAO.getInstance().selectByOption("users_phone", request.getParameter("phone"));
//				response.getWriter().append(!list.isEmpty() ? list.get(0).getEmail() : null);
//				break;

			// 비밀번호 찾기 요청
			case "/searchPw.user":
				response.getWriter().append(String.valueOf(this.hasUserData(request, response)));
				break;

			// 로그아웃 요청
			case "/logout.user":
				request.getSession().invalidate();
				break;

			// 회원가입 요청
			case "/sign.user":
				// GET 요청 시 에러페이지로 넘김
				if (request.getMethod().equals("GET")) {
					response.sendRedirect("/error.jsp");
					return;
				}
				response.getWriter().append(String.valueOf(this.isUserSignUp(request, response)));
				break;

			// 아이디 중복체크 요청
			case "/duplCheck.user":
				response.getWriter().append(String.valueOf(this.isUserDuplCheck(request, response)));
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}

	protected boolean isLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("login_id");
		String req_pw = request.getParameter("login_pw");
		List<UserDTO> list = UserDAO.getInstance().selectByOption("users_email", req_email);
		if (!list.isEmpty()) {
			if (Common.getSHA512(req_pw).equals(list.get(0).getPw())) {
				// 로그인 성공
				request.getSession().setAttribute("userSeq", list.get(0).getSeq());
				return true;
			} else {
				// 비밀번호 오류
			}
		} else {
			// 등록되지 않은 ID
		}
		return false;
	}
	protected boolean hasUserData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("email");
		String req_phone = request.getParameter("phone");
		return UserDAO.getInstance().searchPw(req_email, req_phone);
	}
	
	protected boolean isUserDuplCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("users_email");
		return UserDAO.getInstance().isUserEmailCheck(req_email);
	}
	
	protected int isUserSignUp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("users_email");
		String req_pw = request.getParameter("users_pw_re");
		String req_phone = request.getParameter("users_phone");
		return UserDAO.getInstance().isUserSignUp(req_email, Common.getSHA512(req_pw), req_phone);
	}
}
