package controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import dto.*;

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
                    this.reLikeAdd(request, response);
                    break;

                case "/reviewLikeDel.gym":
                    this.reLikeDel(request, response);
                    break;

                //즐겨찾기 추가
                case "/favoriteadd.gym":
                    this.favAdd(request, response);
                    break;

                //즐겨찾기 제거
                case "/favoriteremove.gym":
                    this.favDelete(request, response);
                    break;

                // 리뷰쓰기로 페이지 이동
                case "/reviewWrite.gym":
                    this.goGymDetail(request, response);
                    break;

                //리뷰쓰기
                case "/reviewWriteCmplt.gym":
                    this.write(request, response);
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


        ReviewDAO reviewDao = ReviewDAO.getInstance();
        GymDAO gymDao = GymDAO.getInstance();
        FavoritesDAO favDao = FavoritesDAO.getInstance();
        GymFilterDAO filterDAO = new GymFilterDAO().getInstance();


        List<HashMap<String, Object>> reviewDto = reviewDao.printReivew(gym_seq);

        GymFilterDTO gymFilterDtO = filterDAO.selectByFilter(gym_seq);

        GymDTO gymDto = gymDao.printGym(gym_seq);


        if (request.getSession().getAttribute("userSeq") == null) {//로그아웃 상태라면 건너뒤기
            request.setAttribute("favresult", "check");
        } else {
            boolean result = favDao.isFavExist((Integer) request.getSession().getAttribute("userSeq"), gym_seq);
            request.setAttribute("favresult", result);
        }


        request.setAttribute("gymFilter", gymFilterDtO);
        request.setAttribute("gymList", gymDto);
        request.setAttribute("reviewList", reviewDto);
        request.getRequestDispatcher("/gym/gym-detail.jsp").forward(request, response);
    }


    protected void favAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //즐겨찾기 추가
        int user_seq = Integer.parseInt(String.valueOf(request.getSession().getAttribute("userSeq"))); // 로그인 사용자
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
        FavoritesDAO dao = FavoritesDAO.getInstance();
        // 사용자 id필요 임시로 1
        int result = dao.add(new FavoritesDTO(0, user_seq, gym_seq));

    }

    protected void favDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 즐겨찾기 삭제
        int user_seq = (Integer) request.getSession().getAttribute("userSeq");
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));

        FavoritesDAO dao = FavoritesDAO.getInstance();

        int result = dao.removeByGymSeq(gym_seq, user_seq);
    }

    //좋아요 추가
    private void reLikeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //
        int userSeq = (Integer) request.getSession().getAttribute("userSeq"); // 로그인 사용자
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
        int review_like = Integer.parseInt(request.getParameter("review_like"));
        int review_seq = Integer.parseInt(request.getParameter("review_seq"));

        System.out.println(userSeq);
        System.out.println(gym_seq);

        System.out.println(review_seq);
        LikesDAO likesDao = LikesDAO.getInstance();
        ReviewDAO reviewDAO = ReviewDAO.getInstance();


        reviewDAO.addReviewLike(review_seq);
        int result = likesDao.add(new LikesDTO(review_seq, userSeq, gym_seq));
        System.out.println("좋아요  성공");

    }

    //좋아요 삭제
    private void reLikeDel(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int userSeq = (Integer) request.getSession().getAttribute("userSeq"); // 로그인 사용자
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
        int review_like = Integer.parseInt(request.getParameter("review_like"));
        int review_seq = Integer.parseInt(request.getParameter("review_seq"));

        LikesDAO likesDao = LikesDAO.getInstance();
        ReviewDAO reviewDAO = ReviewDAO.getInstance();


        reviewDAO.delReviewLike(review_seq);
        int result = likesDao.remove(review_seq, gym_seq, userSeq);
        System.out.println("좋아요 취소 성공");

    }

    // 리뷰 글쓰기 페이지로 이동
    protected void write(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
        ReviewDAO.getInstance().writeReview(new ReviewDTO(request));
        response.sendRedirect("/gym/gym-detail.jsp?gym_seq="+GymDAO.getInstance().printGym(gym_seq).getGym_name());
    }

    // 리뷰 글쓰기 후 Gym Detail Page로 다시 가기
    protected void goGymDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
        request.setAttribute("gym_seq", gym_seq);
        request.setAttribute("gym_name", GymDAO.getInstance().printGym(gym_seq).getGym_name());
        request.getRequestDispatcher("/gym/review-write.jsp").forward(request, response);
    }


}