package controllers;

import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import commons.Common;
import dao.ExerciseDAO;
import dao.ManagerDAO;
import dto.ExerciseDTO;
import dto.WeightDTO;
import dto.ManagerDTO;



@WebServlet("*.personal")
public class PersonalRecordController extends ControllerAbs {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	super.doGet(request, response);


        Common.setUtf8(request, response);

        String uri = request.getRequestURI();

        try {
            switch (uri) {

				case "/main.personal":
                    this.getPage(request, response);
					break;
					
				case "/record.personal":
                    this.sendRecord(request, response);
					break;

                case "/datepick.personal":
                    response.getWriter().append(new Gson().toJson(this.getRecordData(request, response)));
                    break;

                case "/delRecord.personal":
                    ExerciseDAO.getInstance().deleteByDate(String.valueOf(request.getSession().getAttribute("userSeq")), request.getParameter("date"));
                    break;
                    
                case "/weight.personal":
                	this.getWeightData(request, response);
                    break;

                case "/add_manager.personal":
                    // GET 요청 시 에러페이지로 넘김
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.addManager(request, response);
                    response.sendRedirect("/main.personal");
                    break;

                case "/del_manager.personal":
                    // GET 요청 시 에러페이지로 넘김
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.delManager(request, response);
                    response.sendRedirect("/main.personal");
                    break;

                case "/update_manager.personal":
                    // GET 요청 시 에러페이지로 넘김
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.updateManager(request, response);
                    response.sendRedirect("/main.personal");
                    break;
            }
        } catch (Exception e) {
			e.printStackTrace();
            response.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }
    
    protected void sendWeight (HttpServletRequest request, HttpServletResponse response) throws Exception{
    	WeightDTO wet = new WeightDTO();
    	wet.setUser_seq((Integer)request.getSession().getAttribute("user_seq"));
    	wet.setWeight(request.getParameter("weight"));
    	wet.setWeight_date(Timestamp.valueOf(request.getParameter("date")));
    	ExerciseDAO.getInstance().insertWeight(wet);
    }
    
    protected void getWeightData (HttpServletRequest request, HttpServletResponse response) throws Exception{
    	String userSeq = (String) request.getSession().getAttribute("userSeq");
    	String weight = request.getParameter("weight");
    	String weight_date = request.getParameter("weight_date");
    	
    	request.setAttribute("weight", weight);
    	request.setAttribute("weight_date", weight_date);
    
    	
    }
    
    protected void sendRecord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ExerciseDTO exr = new ExerciseDTO();
        exr.setExr_date(Timestamp.valueOf(request.getParameter("date")));
        exr.setUser_seq((Integer) request.getSession().getAttribute("userSeq"));
        exr.setExr_memo(request.getParameter("memo"));
        exr.setExr_how(Integer.parseInt(request.getParameter("how")));
        exr.setExr_intensity(request.getParameter("intens"));
        exr.setInbody_weight(request.getParameter("weight"));
        exr.setInbody_bfm(request.getParameter("fat"));
        exr.setInbody_bmi(request.getParameter("bmi"));
        exr.setInbody_sm(request.getParameter("muscle"));
        ExerciseDAO.getInstance().insertRecord(exr);
    }
    protected void getPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userSeq = String.valueOf(request.getSession().getAttribute("userSeq"));
        userSeq = userSeq.equals("null") ? "-1" : userSeq;
        request.setAttribute("recordList", ExerciseDAO.getInstance().selectByOption("user_seq", userSeq));
        request.setAttribute("record", ExerciseDAO.getInstance().selectByDate(userSeq, sdf.format(new Date())));
        request.setAttribute("recentRecord", ExerciseDAO.getInstance().selectRecentByDate(userSeq, sdf.format(new Date())));

        int user_seq = (int) request.getSession().getAttribute("userSeq");
        request.setAttribute("manager", ManagerDAO.getInstance().selectByUserSeq(user_seq));
        request.getRequestDispatcher("/personal/personal-record.jsp").forward(request, response);
    }

    protected HashMap<String, Object> getRecordData(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Object> data = new HashMap<>();
        String userSeq = String.valueOf(request.getSession().getAttribute("userSeq"));
        userSeq = userSeq.equals("null") ? "-1" : userSeq;
        data.put("recordList", ExerciseDAO.getInstance().selectByOption("user_seq", userSeq));
        data.put("record", ExerciseDAO.getInstance().selectByDate(userSeq, request.getParameter("date")));
        data.put("recentRecord", ExerciseDAO.getInstance().selectRecentByDate(userSeq, request.getParameter("date")));

        return data;
    }

    protected void addManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int user_seq = (int) request.getSession().getAttribute("userSeq");
        String inputTitle = request.getParameter("m_title_input");
        String inputStart = request.getParameter("m_start_input") + " 00:00:00.0";
        java.sql.Timestamp startTime = java.sql.Timestamp.valueOf(inputStart);
        String inputEnd = request.getParameter("m_end_input") + " 00:00:00.0";
        java.sql.Timestamp endTime = java.sql.Timestamp.valueOf(inputEnd);

        ManagerDAO.getInstance().addManager(user_seq, inputTitle, startTime, endTime);
    }

    protected void delManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int user_seq = (int) request.getSession().getAttribute("userSeq");
        ManagerDAO.getInstance().deleteByUserSeq(user_seq);
    }

    protected void updateManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int user_seq = (int) request.getSession().getAttribute("userSeq");
        String inputTitle = request.getParameter("mu_title_input");
        String inputStart = request.getParameter("mu_start_input") + " 00:00:00.0";
        java.sql.Timestamp startTime = java.sql.Timestamp.valueOf(inputStart);
        String inputEnd = request.getParameter("mu_end_input") + " 00:00:00.0";
        java.sql.Timestamp endTime = java.sql.Timestamp.valueOf(inputEnd);

        ManagerDAO.getInstance().updateByUserSeq(user_seq, inputTitle, startTime, endTime);
    }

}
