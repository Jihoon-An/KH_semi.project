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

import dao.ReviewDAO;
import dto.ReviewDTO;

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
                    List<HashMap<String, Object>> list = ReviewDAO.getInstance().selectAllSortByLikes();
                    Gson g = new Gson();
                    HashMap<String, Object> data = new HashMap<>();
                    data.put("list", list);
                    response.getWriter().append(g.toJson(data));
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
}