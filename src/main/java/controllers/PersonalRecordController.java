package controllers;

import com.google.gson.Gson;
import dao.ExerciseDAO;
import dto.ExerciseDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("*.personal")
public class PersonalRecordController extends ControllerAbs {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();


        try {
            switch (uri) {
                case "/main.personal":
                    this.getPage(request, response);
					break;

				case "/record.personal":
                    this.sendRecord(request, response);
                    response.getWriter().append(new Gson().toJson(ExerciseDAO.getInstance().selectByDate(String.valueOf(request.getSession().getAttribute("userSeq")) , request.getParameter("date"))));
					break;

                case "/date.personal":
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
        request.setAttribute("recordList", ExerciseDAO.getInstance().selectByOption("user_seq", String.valueOf(request.getSession().getAttribute("userSeq"))));
        request.setAttribute("recordByDay", ExerciseDAO.getInstance().selectByDate(String.valueOf(request.getSession().getAttribute("userSeq")), sdf.format(new Date())));
        request.getRequestDispatcher("/personal/personal-record.jsp").forward(request, response);
    }
}
