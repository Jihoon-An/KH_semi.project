package controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoritesDAO;
import dao.GymDAO;
import dao.LikesDAO;
import dao.ReviewDAO;
import dto.FavoritesDTO;
import dto.GymDTO;
import dto.LikesDTO;
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
				
			//좋아요 추가
			case "/reviewLikeAdd.gym":
				this.getReLikeAdd(request, response);
			break;
			
			case "/reviewLikeDel.gym":
				this.getReLikeDel(request, response);
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
		//int review_seq = Integer.parseInt(request.getParameter("review_seq"));

		ReviewDAO reviewdao = ReviewDAO.getInstance();
		GymDAO gymdao = GymDAO.getInstance();
		FavoritesDAO favdao = FavoritesDAO.getInstance();
		LikesDAO likesDAO = LikesDAO.getInstance();

		List<ReviewDTO> reviewdto = reviewdao.printReivew(gym_seq);
		
		//reviewdao.printReviewSeq();
		//System.out.println(reviewdto.get(2).getReview_seq());
		
		
		
		
		GymDTO gymdto = gymdao.printGym(gym_seq);
		
		
		
		if ( request.getSession().getAttribute("userSeq") == null ) {//로그아웃 상태라면 건너뒤기

		} else {
			boolean result = favdao.isFavExist((Integer) request.getSession().getAttribute("userSeq"), gym_seq);
			request.setAttribute("favresult", result);
		}
		
//		if ( request.getSession().getAttribute("userSeq") == null ) {//로그아웃 상태라면 건너뒤기
//
//		} else {
//			boolean result = likesDAO.isLikeExist(r, (Integer) request.getSession().getAttribute("userSeq"), gym_seq);
//			request.setAttribute("likeresult", result);
//		}

		request.setAttribute("gymList", gymdto);
		request.setAttribute("reviewList", reviewdto);
		request.setAttribute("likedUserList", reviewdao.selectLikedUser(gym_seq));
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
	
	//좋아요 추가
	private void getReLikeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//
		int userSeq = (Integer) request.getSession().getAttribute("userSeq"); // 로그인 사용자
		int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
		int review_like = Integer.parseInt(request.getParameter("review_like"));
		int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	
			System.out.println(userSeq);
			System.out.println(gym_seq);
			System.out.println(review_like);
			System.out.println(review_seq);
		LikesDAO likesDao = LikesDAO.getInstance();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
	

		reviewDAO.addReviewLike(review_seq);
		int result = likesDao.add(new LikesDTO(review_seq, userSeq, gym_seq));
		System.out.println("좋아요  성공");
		
	}
	//좋아요 삭제
	private void getReLikeDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int userSeq = (Integer) request.getSession().getAttribute("userSeq"); // 로그인 사용자
		int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
		int review_like = Integer.parseInt(request.getParameter("review_like"));
		int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	//
		LikesDAO likesDao = LikesDAO.getInstance();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		
	
		reviewDAO.delReviewLike(review_seq);
		int result = likesDao.remove(review_seq,gym_seq, userSeq);
		System.out.println("좋아요 취소 성공");
	
	}


}
