package controllers;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import commons.FileControl;
import dao.GymDAO;
import dao.GymFilterDAO;
import dao.GymImgDAO;
import dto.GymDTO;
import dto.GymFilterDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("*.addGym")
public class AddGymController extends ControllerAbs{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);

        String uri = request.getRequestURI();

        try {
            switch (uri) {
                case "/add.addGym":
//                    this.addGym(request, response);
                    request.getRequestDispatcher("/gym/gym-add.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/");
        }


    }

    private void addGym(HttpServletRequest request, HttpServletResponse response) throws Exception {
        FileControl file = new FileControl();
        MultipartRequest multi = file.getMulti();
        int gymSeq = GymDAO.getInstance().getGymSeqNextVal();

        Gson gson = new Gson();

        // gymImg data
        List<String> newImgList = file.saves(request, "/resource/gym");
        String json = gson.toJson(newImgList);

        // gymFilter data
        String open = multi.getParameter("open_result");
        String locker = multi.getParameter("locker_result");
        String shower = multi.getParameter("shower_result");
        String park = multi.getParameter("park_result");

        GymFilterDTO gymFilterDTO = new GymFilterDTO(gymSeq, open, locker, shower, park);

        // gym data
        GymDTO gymDTO = new GymDTO(file);
        if (multi.getParameter("address1") == null) {
            GymDTO beforeGym = GymDAO.getInstance().printGym(gymDTO.getGym_seq());
            gymDTO.setGym_location(beforeGym.getGym_location());
        }
        gymDTO.setGym_seq(gymSeq);


        // insert
        GymImgDAO.getInstance().insert(gymSeq, json);
        GymDAO.getInstance().addGym(gymDTO);
        GymFilterDAO.getInstance().add(gymFilterDTO);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
}
