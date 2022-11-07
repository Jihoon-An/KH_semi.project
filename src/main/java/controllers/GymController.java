package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
        super.doGet(request, response);
        String uri = request.getRequestURI();


        try {

            switch (uri) {

                //헬스장 정보
                case "/detail.gym":
                    this.getDetailGym(request, response);
                    break;
                //즐겨찾기 추가
                case "/favoriteadd.gym":

                    this.getFavAdd(request, response);
                    break;

                //즐겨찾기 제거
                case "/favoriteremove.gym":

                    this.getFavDelete(request, response);

                    break;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void getDetailGym(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //헬스장 정보(이름, 위치, 번호 가격) 리뷰, 더보기 기능
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
        //	List<ReviewDTO> dto = dao.printReivew(gym_seq);

        //String writer=(String)request.getSession().getAttribute("userSeq"); //로그인 사용자
        int user_seq = (Integer) request.getSession().getAttribute("userSeq");

		ReviewDAO reviewdao = ReviewDAO.getInstance();
		GymDAO gymdao = GymDAO.getInstance();
		FavoritesDAO favdao = FavoritesDAO.getInstance();

		boolean result = false;
		if(!(user_seq==0)) {
			result = favdao.isFavExist(user_seq, gym_seq);

		}
		
	//	System.out.println(result);
		List<ReviewDTO> reviewdto = reviewdao.printReivew(gym_seq);
		GymDTO gymdto = gymdao.printGym(gym_seq);

		request.setAttribute("favresult", result);
		request.setAttribute("list", gymdto);
		request.setAttribute("list2", reviewdto);
		request.getRequestDispatcher("/gym/gym-detail.jsp").forward(request, response);
    }

    protected void getFavAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //즐겨찾기 추가


		int user_seq = Integer.parseInt(String.valueOf(request.getSession().getAttribute("userSeq"))); // 로그인 사용자
		int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
		FavoritesDAO dao = FavoritesDAO.getInstance();
		// 사용자 id필요 임시로 1
		int result = dao.add(new FavoritesDTO(0, user_seq, gym_seq));

    }

    protected void getFavDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {

    	// 즐겨찾기 삭제

		// int user_seq=Integer.parseInt(
		// String.valueOf(request.getSession().getAttribute("userSeq")));
		int user_seq = (Integer) request.getSession().getAttribute("userSeq");
		int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));

		FavoritesDAO dao = FavoritesDAO.getInstance();
		int result = dao.removeByGymSeq(gym_seq, user_seq);


    }

}
