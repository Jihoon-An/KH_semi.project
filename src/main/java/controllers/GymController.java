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
public class GymController extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri	= request.getRequestURI();
		
		
		try {

	
		if(uri.equals("/detail.gym")) {    //헬스장 정보(이름, 위치, 번호 가격) 리뷰, 더보기 기능
			//int gym_seq = Integer.parseInt(request.getParameter("gym_seq")); 
			//	List<ReviewDTO> dto = dao.printReivew(gym_seq);
			ReviewDAO dao = ReviewDAO.getInstance();
			GymDAO dao2 = GymDAO.getInstance();
			List<ReviewDTO> dto = dao.printReivew(1);
			GymDTO dto2 = dao2.printGym(1);
			
			request.setAttribute("list", dto2);
			request.setAttribute("list2", dto);
			request.getRequestDispatcher("/gym/gym-detail.jsp").forward(request, response);

	}if(uri.equals("/favoriteadd.gym")){
		
		int gym_seq = Integer.parseInt(request.getParameter("gym_seq")); 
		System.out.println(gym_seq);
		FavoritesDAO dao = FavoritesDAO.getInstance();
		
		//사용자 id필요 임시로 1
		int result = dao.Favoriteadd(new FavoritesDTO(0, 1, gym_seq));
		System.out.println(result+"즐겨찾기 추가 성공");
		
		
		
	}if(uri.equals("/favoriteremove.gym")){
		int gym_seq = Integer.parseInt(request.getParameter("gym_seq")); 
		
		FavoritesDAO dao = FavoritesDAO.getInstance();
		int result=dao.favoriteremove(gym_seq);
		System.out.println(result+"즐겨찾기 삭제 성공");
	}
			
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
