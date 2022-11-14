package controllers;

import java.io.IOException;
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
					
				case "/infoinbody.personal":
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
    	
    	List<ExerciseDTO> inbody = ExerciseDAO.getInstance().inbodyChartInfo(exr_seq);    	
    
    	request.setAttribute("inbody", inbody);
    	request.getRequestDispatcher("personal/personal-record.jsp").forward(request, response);
    	 
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

        request.setAttribute("manager", ManagerDAO.getInstance().selectByUserSeq(userSeq));

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

}
