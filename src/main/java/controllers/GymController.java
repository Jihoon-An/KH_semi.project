package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoritesDAO;
import dao.GymDAO;
import dao.ReviewDAO;
import dto.FavoritesDTO;
import dto.GymDTO;
import dto.ReviewDTO;


@WebServlet("*.gym")
public class GymController extends ControllerAbs {


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		  super.doGet(request, response);
		String uri	= request.getRequestURI();
	
		
		
		try {

		switch (uri) {
		
		case "/detail.gym":{
			//헬스장 정보(이름, 위치, 번호 가격) 리뷰, 더보기 기능
			//int gym_seq = Integer.parseInt(request.getParameter("gym_seq")); 
			//	List<ReviewDTO> dto = dao.printReivew(gym_seq);

			//String writer=(String)request.getSession().getAttribute("loginID"); //로그인 사용자
			
			ReviewDAO dao = ReviewDAO.getInstance();
			GymDAO dao2 = GymDAO.getInstance();
			List<ReviewDTO> dto = dao.printReivew(1);
			GymDTO dto2 = dao2.printGym(1);
			
			request.setAttribute("list", dto2);
			request.setAttribute("list2", dto);
			request.getRequestDispatcher("/gym/gym-detail.jsp").forward(request, response);
			
			break;
		}
		case "/favoriteadd.gym":{
			//즐겨찾기 추가
		
			//String writer=(String)request.getSession().getAttribute("loginID"); //로그인 사용자
			int gym_seq = Integer.parseInt(request.getParameter("gym_seq")); 
			
			FavoritesDAO dao = FavoritesDAO.getInstance();
			
			//사용자 id필요 임시로 1
			int result = dao.add(new FavoritesDTO(0, 1, gym_seq));

			
			break;
		}
		
		case "/favoriteremove.gym":{
			//즐겨찾기 삭제
			int gym_seq = Integer.parseInt(request.getParameter("gym_seq")); 
			
			FavoritesDAO dao = FavoritesDAO.getInstance();
			int result=dao.remove(gym_seq);
		
			break;

		}
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
			
		}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doGet(request, response);
	}

}
