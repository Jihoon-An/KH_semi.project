package controllers;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExerciseDAO;


@WebServlet("*.personal")
public class PersonalRecordController extends ControllerAbs {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();

        try {
            switch (uri) {
                case "/main.personal":
					response.sendRedirect("/personal/personal-record.jsp");
					break;

				case "/something.personal":
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

    protected void getInbodyChart(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	int exr_seq = Integer.parseInt(request.getParameter("exr_seq"));
    	
    	HashMap<String, Object> inbody = ExerciseDAO.getInstance().InbodyChartInfo(exr_seq);
    	System.out.println(inbody);
    	
    	request.setAttribute("inbodyInfo", inbody);
    	 
    }
    
}
