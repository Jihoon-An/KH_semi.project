package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

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
import dao.GymDAO;
import dao.GymFilterDAO;
import dto.BsCtfcDTO;
import dto.BsUsersDTO;
import dto.GymDTO;

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
				// GET 요청 시 에러페이지로 넘김
				if (request.getMethod().equals("GET")) {
					return;
				}
				response.getWriter().append(String.valueOf(this.isBsLogin(request, response)));
				break;

			// 비밀번호 찾기 요청
			case "/searchPw.bs":
				response.getWriter().append(String.valueOf(this.hasBsData(request, response)));
				break;

			// 회원가입 페이지 이동
			case "/sign.bs":
				request.getRequestDispatcher("/bs/bs-signup.jsp").forward(request,response);
				break;
				
			// 회원가입 요청
			case "/signUp.bs":
				// GET 요청 시 에러페이지로 넘김
				if (request.getMethod().equals("GET")) {
					response.sendRedirect("/error.jsp");
					return;
				}
				this.bsSignUp(request, response);
				request.setAttribute("start", "login");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
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

	protected boolean isBsLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("login_id");
		String req_pw = request.getParameter("login_pw");
		List<BsUsersDTO> list = BsUsersDAO.getInstance().searchAll("bs_email", req_email);
		if (!list.isEmpty()) {
			if (Common.getSHA512(req_pw).equals(list.get(0).getBs_pw())) {
				// 로그인 성공
				request.getSession().setAttribute("bsSeq", list.get(0).getBs_seq());
				return true;
			} else {
				// 비밀번호 오류
			}
		} else {
			// 등록되지 않은 ID
		}
		return false;
	}

	protected boolean hasBsData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("email");
		String req_phone = request.getParameter("phone");
		return BsUsersDAO.getInstance().searchBsPw(req_email, req_phone);
	}

	/**
	 *	<h2>중복확인</h2>
	 */
	protected boolean isBsDuplCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String req_email = request.getParameter("bs_email");
		return BsUsersDAO.getInstance().isBsEmailCheck(req_email);
	}

	protected void bsSignUp(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int maxSize = 1024 * 1024 * 10;
		String savePath = request.getServletContext().getRealPath("/files");
		System.out.println(savePath);

		File fileSavePath = new File(savePath);
		if (!fileSavePath.exists()) {
			fileSavePath.mkdir();
		}

		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		String req_email = multi.getParameter("bs_email");
		String req_pw = multi.getParameter("bs_pw_re");
		String req_name = multi.getParameter("bs_name");
		String req_phone = multi.getParameter("bs_phone");
		String req_number = multi.getParameter("bs_number");

		// bsSeqNextVal
		int bsSeqNextVal = BsUsersDAO.getInstance().getBsSeqNextVal();

		String[] gym_name = multi.getParameterValues("gym_name");
		String[] gym_phone = multi.getParameterValues("gym_phone");
		String[] gym_address1 = multi.getParameterValues("gym_address1");
		String[] gym_address2 = multi.getParameterValues("gym_address2");
		String[] gym_x = multi.getParameterValues("gym_x");
		String[] gym_y = multi.getParameterValues("gym_y");

		// 시설추가
		for (int i = 0; i < gym_name.length; i++) {

			// gymSeqNextVal
			int gymSeqNextVal = GymDAO.getInstance().getGymSeqNextVal();

			String gym_location = gym_address1[i] + " " + gym_address2[i];
			GymDAO.getInstance().addGym(new GymDTO(gymSeqNextVal, bsSeqNextVal, gym_name[i], gym_phone[i], gym_location,
					null, null, null, null, gym_x[i], gym_y[i]));
			// 필터추가
			GymFilterDAO.getInstance().addGymFilter(gymSeqNextVal);
		}

		// 사업자등록증 업로드
		Enumeration<String> e = multi.getFileNames();

		while (e.hasMoreElements()) { // 하나만 받아서 이거 필요없긴함..
			String name = e.nextElement();
			String sysName = multi.getFilesystemName(name);

			if (name != null) { // 프론트에서 onsubmit 만나면 서브밋 안되게 값 삭제하기
				if (sysName == null) {
					continue;
				};
				BsCtfcDAO.getInstance().uploadBsCtfc(new BsCtfcDTO(bsSeqNextVal, req_number, sysName));
			}
		}

		// 회원가입
		BsUsersDAO.getInstance().isBsSignUp(new BsUsersDTO(bsSeqNextVal, req_number, req_email,
				Common.getSHA512(req_pw), req_name, req_phone, null));

	}

}
