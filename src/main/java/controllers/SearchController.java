package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			case "main.search":
				
				break;
			//
			case "b.search":
				
				break;
			//
			case "c.search":
				
				break;
			//
			case "d.search":
				
				break;
			//
			case "e.search":
				
				break;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void getList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
	}

}
