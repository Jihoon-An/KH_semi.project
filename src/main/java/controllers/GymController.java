package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GymDAO;
import dao.ReviewDAO;
import dto.GymDTO;
import dto.ReviewDTO;


@WebServlet("*.gym")
public class GymController extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri	= request.getRequestURI();
		
		
		try {
			//int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
			ReviewDAO dao = ReviewDAO.getInstance();
			GymDAO dao2 = GymDAO.getInstance();
		//	List<ReviewDTO> dto = dao.printReivew(gym_seq);
			List<ReviewDTO> dto = dao.printReivew(1);
			GymDTO dto2 = dao2.printGym(1);
			
			request.setAttribute("list", dto2);
			request.setAttribute("list2", dto);
			request.getRequestDispatcher("/gym/gym-detail.jsp").forward(request, response);
			
			System.out.println(dto);
			System.out.println(dto2);
//		if(uri.equals("detail.gym")) {
////			ReviewDAO dao = ReviewDAO.getInstance();
////			GymDAO dao2 = GymDAO.getInstance();
////			List<ReviewDTO> dto = dao.printReivew();
////			GymDTO dto2 = dao2.printGym(1);
			//	request.setAttribute("list", dto2);
////			request.setAttribute("list2", dto);
////			request.getRequestDispatcher("/gym/gym-detail.jsp").forward(request, response);
//		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
