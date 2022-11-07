package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.bsPage")
public class BsPageController extends ControllerAbs{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);

        String uri = request.getRequestURI();

        try {
            switch (uri){
                case "/page.bsPage":
                    response.sendRedirect("/bs/bs-page.jsp");
                    break;
            }
        }catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("/");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
}
