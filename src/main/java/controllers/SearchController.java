package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GymDAO;
import dto.GymDTO;

/**
 * developer : Minseop
 */

@WebServlet("*.search")
public class SearchController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
	
		String uri = request.getRequestURI();
		try {
			switch (uri) {
			// 헬스장 검색 전 초기 헬스장 리스트
			case "/main.search":
				this.getMainList(request, response);
				break;
			//
			case "/b.search":
				
				break;
			//
			case "/c.search":
				
				break;
			//
			case "/d.search":
				
				break;
			//
			case "/e.search":
				
				break;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	/**
	 * 헬스장 검색 전 초기 헬스장 리스트 메서드
	 */
	protected void getMainList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// gym 데이터 불러오기
		List<GymDTO> gymList = GymDAO.getInstance().selectAll();
		
		// gym data 담기
		request.setAttribute("gymList", gymList);
		
		// 보내기
		request.getRequestDispatcher("/gym/search.jsp").forward(request,response);
	}

}
