package controllers;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.*;
import dto.*;
import org.apache.el.parser.Token;

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
44
                // 리뷰쓰기로 페이지 이동
                case "/reviewWrite.gym":
                    this.moveWrite(request, response);
                    break;

                //리뷰쓰기
                case "/reviewWriting.gym":
                    // GET 요청 시 에러페이지로 넘김
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.write(request, response);
                    break;

                // 리뷰쓰기로 페이지 이동
                case "/reviewModify.gym":
                    this.moveModify(request, response);
                    break;


                // 리뷰 수정
                case "/reviewModifing.gym":
                    // GET 요청 시 에러페이지로 넘김
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.modify(request, response);
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


        //리뷰, 좋아요
        ReviewDAO reviewDao = ReviewDAO.getInstance();
        //시설 테이블
        GymDAO gymDao = GymDAO.getInstance();
        //즐겨찾기 테이블
        FavoritesDAO favDao = FavoritesDAO.getInstance();
        //시설 필터 출력
        GymFilterDAO filterDao = GymFilterDAO.getInstance();


        HashMap<String, Object> avg = reviewDao.gymAvg(gym_seq);
        System.out.println(avg);
        HashMap<String, Object> check = reviewDao.reviewChkCount(gym_seq);

        // 리뷰


        //사진이미지
        GymImgDAO gymImgDao = GymImgDAO.getInstance();

        GymImgDTO gymImgDTO = gymImgDao.getByGymSeq(gym_seq);

        Gson gson = new Gson();
        Type listString = new TypeToken<List<String>>() {
        }.getType();
        List<String> gymImgList = gson.fromJson(gymImgDTO.getGym_sysimg(), listString);


        List<HashMap<String, Object>> reviewDto = reviewDao.printReivew(gym_seq);


        GymFilterDTO gymFilterDtO = filterDao.selectByGymSeq(gym_seq);

        GymDTO gymDto = gymDao.printGym(gym_seq);


        if (request.getSession().getAttribute("userSeq") == null) {//로그아웃 상태라면 건너뒤기
            request.setAttribute("favresult", "chk");
        } else {
            boolean result = favDao.isFavExist((Integer) request.getSession().getAttribute("userSeq"), gym_seq);
            request.setAttribute("favresult", result);
        }

        request.setAttribute("gymAvg", avg);

        request.setAttribute("gymImgList", gymImgList);

        request.setAttribute("checkList", check);
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
    protected void moveWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int gym_seq = Integer.parseInt(request.getParameter("gym_seq"));
        request.setAttribute("gym_seq", gym_seq);
        request.setAttribute("gym_name", GymDAO.getInstance().printGym(gym_seq).getGym_name());
        request.getRequestDispatcher("/gym/review-write.jsp").forward(request, response);
    }


    // 리뷰 글쓰기 후 Gym Detail Page로 다시 가기
    protected void write(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ReviewDTO review = new ReviewDTO(request);
        ReviewDAO.getInstance().writeReview(review);
        int gymSeq = review.getGym_seq();
        response.sendRedirect("/detail.gym?gym_seq=" + gymSeq);
    }


    // 리뷰 수정페이지로 가기
    private void moveModify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int review_seq = Integer.parseInt(request.getParameter("review_seq"));
        ReviewDTO review = ReviewDAO.getInstance().getByReviewSeq(review_seq);
        int gym_seq = ReviewDAO.getInstance().getByReviewSeq(review_seq).getGym_seq();

        request.setAttribute("gym_name", GymDAO.getInstance().printGym(gym_seq).getGym_name());
        request.setAttribute("gym_seq", gym_seq);
        request.setAttribute("review", review);
        request.getRequestDispatcher("/gym/review-modify.jsp").forward(request, response);
    }

    // 리뷰 글쓰기 후 Gym Detail Page로 다시 가기
    private void modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("확인1");
        ReviewDTO review = new ReviewDTO(request);
        System.out.println("확인2");
        ReviewDAO.getInstance().modifyReview(review);
        int gymSeq = review.getGym_seq();
        response.sendRedirect("/detail.gym?gym_seq=" + gymSeq);
    }


}