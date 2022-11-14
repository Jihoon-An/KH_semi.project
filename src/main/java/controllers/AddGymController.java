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
                case "/toAdd.addGym":
                    request.getRequestDispatcher("/gym/gym-add.jsp").forward(request, response);
                    break;
                case "/add.addGym":
                    this.addGym(request, response);
                    response.sendRedirect("/page.bsPage");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/");
        }


    }

    private void addGym(HttpServletRequest request, HttpServletResponse response) throws Exception {
        FileControl file = new FileControl();
        List<String> newImgList = file.saves(request, "/resource/gym");

        MultipartRequest multi = file.getMulti();
        int gymSeq = GymDAO.getInstance().getGymSeqNextVal();

        Gson gson = new Gson();

        // gymImg data
        String json = gson.toJson(newImgList);

        // gymFilter data
        String open = multi.getParameter("open_result");
        String locker = multi.getParameter("locker_result");
        String shower = multi.getParameter("shower_result");
        String park = multi.getParameter("park_result");

        GymFilterDTO gymFilterDTO = new GymFilterDTO(gymSeq, open, locker, shower, park);

        // gym data
        String gym_address1 = multi.getParameter("gym_address1");
        String gym_address2 = multi.getParameter("gym_address2");
        String gym_location = gym_address1 + " " + gym_address2;

        GymDTO gymDTO = new GymDTO();
        gymDTO.setGym_seq(gymSeq);
        gymDTO.setBs_seq( (Integer) request.getSession().getAttribute("bsSeq"));
        gymDTO.setGym_name(multi.getParameter("gym_name"));
        gymDTO.setGym_phone(multi.getParameter("gym_phone"));
        gymDTO.setGym_location(gym_location);
        gymDTO.setGym_price(multi.getParameter("gym_price"));
        if (newImgList.size() != 0) {
            gymDTO.setGym_main_sysImg(newImgList.get(0));
        } else {
            gymDTO.setGym_main_sysImg("");
        }
        gymDTO.setGym_open(multi.getParameter("gym_open"));
        gymDTO.setGym_close(multi.getParameter("gym_close"));
        gymDTO.setGym_x(multi.getParameter("gym_x"));
        gymDTO.setGym_y(multi.getParameter("gym_y"));



        // insert
        GymImgDAO.getInstance().insert(gymSeq, json);
        GymDAO.getInstance().addGym(gymDTO);
//        GymFilterDAO.getInstance().add(gymFilterDTO);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
}
