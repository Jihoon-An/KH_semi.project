package controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.FavoritesDAO;
import dao.ReviewDAO;

/**
 * Servlet implementation class HeaderController
 */
@WebServlet("*.index")
public class IndexController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        response.setContentType("text/html;charset=utf8");
        String uri = request.getRequestURI();
        try {
            switch (uri) {

                // 리뷰 정보 요청
                case "/review.index":
                    response.getWriter().append(new Gson().toJson(getReviewData(request, response)));
                    break;

                // 시설 정보 요청
                case "/gym.index":
                    response.getWriter().append(new Gson().toJson(getGymData(request, response)));
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }

    protected HashMap<String, Object> getReviewData(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Object> result = new HashMap<>();
        result.put("reviewList", ReviewDAO.getInstance().selectSortByLikes());
        return result;
    }
    protected HashMap<String, Object> getGymData(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Object> result = new HashMap<>();
        result.put("gymList", FavoritesDAO.getInstance().selectSortByFavorites());
        return result;
    }
}