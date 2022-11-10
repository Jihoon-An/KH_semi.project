package controllers;

import commons.FileControl;
import dao.*;
import dto.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("*.bsPage")
public class BsPageController extends ControllerAbs {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);

        String uri = request.getRequestURI();

        try {
            switch (uri) {
                case "/page.bsPage":
                    this.getPage(request, response);
                    request.getRequestDispatcher("/bs/bs-page.jsp").forward(request, response);
                    break;

                case "/updateProfile.bsPage":
                    this.updateProfile(request, response);
                    break;

                case "/updateCtfc.bsPage":
                    this.updateCtfc(request, response);
                    break;

                case "/updatePw.bsPage":
                    this.updatePw(request, response);
                    break;

                case "/signDown.bsPage":
                    this.signDown(request, response);
                    response.sendRedirect("/");
                    break;

                case "/toUpdateGym.bsPage":
                    this.importGym(request, response);
                    request.getRequestDispatcher("/gym/gym.modify.jsp").forward(request, response);
                    break;

                case "/deleteGym.bsPage":
                    this.deleteGym(request, response);
                    response.sendRedirect("/page.bsPage");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/");
        }

    }

    /**
     * <h2>gymSeq로 관련된 데이터를 지움</h2>
     *
     * @param request for gym_seq
     */
    private void deleteGym(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int gymSeq = Integer.parseInt(request.getParameter("gym_seq"));

        // 시설 필터 gym_filter table 지우기
        GymFilterDAO.getInstance().deleteByGymSeq(gymSeq);
        // 시설 이미지 gym_img 지우기
        GymImgDAO.getInstance().deleteByGymSeq(gymSeq);
        // 즐겨찾기 favorite table 지우기
        FavoritesDAO.getInstance().deleteByGymSeq(gymSeq);
        // 리뷰 좋아요 likes 지우기
        LikesDAO.getInstance().deleteByGymSeq(gymSeq);
        // 리뷰 review table 지우기
        ReviewDAO.getInstance().deleteByGymSeq(gymSeq);
        // 헬스장 회원 membership table 지우기
        MembershipDAO.getInstance().deleteByGymSeq(gymSeq);
        // 시설 gym table 지우기
        GymDAO.getInstance().deleteByGymSeq(gymSeq);
    }

    /**
     * <h2>gym데이터를 request에 담음</h2>
     */
    private void importGym(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int gymSeq = Integer.parseInt(request.getParameter("gym_seq"));

        GymDTO gym = GymDAO.getInstance().printGym(gymSeq);
        GymFilterDTO gymFilter = GymFilterDAO.getInstance().selectByGymSeq(gymSeq);

        request.setAttribute("gym", gym);
        request.setAttribute("gymFilter", gymFilter);
    }

    /**
     * <h2>사업자 회원 탈퇴</h2>
     */
    private void signDown(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int bsSeq = (Integer) request.getSession().getAttribute("bsSeq");
        List<GymDTO> gymList = GymDAO.getInstance().getGymByBsSeq(bsSeq);

        // 광고배너 지우기
        AdDAO.getInstance().deleteByBsSeq(bsSeq);

        // 즐겨찾기 지우기
        FavoritesDAO favDao = FavoritesDAO.getInstance();

        for (GymDTO gym : gymList) {
            favDao.deleteByGymSeq(gym.getGym_seq());
        }

        // 헬스 회원 지우기
        MembershipDAO.getInstance().deleteByBsSeq(bsSeq);

        // 리뷰 좋아요 지우기
        ReviewDAO.getInstance().deleteByBsSeq(bsSeq);

        // 사업자 등록증 지우기
        BsCtfcDAO.getInstance().deleteByBsSeq(bsSeq);

        // 시설 필터 지우기
        GymFilterDAO gymFilDao = GymFilterDAO.getInstance();

        for (GymDTO gym : gymList) {
            gymFilDao.deleteByGymSeq(gym.getGym_seq());
        }

        // 시설이미지 지우기
        FileControl file = new FileControl();
        GymImgDAO gymImgDAO = GymImgDAO.getInstance();

        for (GymDTO gym : gymList) {
            List<GymImgDTO> gymImgList = gymImgDAO.getByGymSeq(gym.getGym_seq());

            for (GymImgDTO gymImg : gymImgList) {
                file.delete(request, "/resource/gym", gymImg.getGym_sysimg());
            }

            GymImgDAO.getInstance().deleteByGymSeq(gym.getGym_seq());
        }
        //시설 지우기
        GymDAO.getInstance().deleteByBsSeq(bsSeq);
        // 비지니스 유저 지유기
        BsUsersDAO.getInstance().deleteByBsSeq(bsSeq);
    }

    /**
     * <h2>비밀번호 변경</h2>
     */
    private void updatePw(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int bsSeq = (Integer) request.getSession().getAttribute("bsSeq");
        String newPw = request.getParameter("pw");
        BsUsersDAO.getInstance().updatePw(bsSeq, newPw);
    }

    /**
     * <h1>사업자 등록증 수정</h1>
     * 기존의 사업증 이미지를 삭제하고 새로운 사업증 이미지를 생성하고 등록함.
     */
    private void updateCtfc(HttpServletRequest request, HttpServletResponse response) throws Exception {
        FileControl fileControl = new FileControl();

        int bsSeq = (Integer) request.getSession().getAttribute("bsSeq");
        String path = "/resource/ctfc";
        String oldName = BsCtfcDAO.getInstance().getByBsSeq(bsSeq).getSysName();

        // 파일 삭제
        fileControl.delete(request, path, oldName);

        // 파일 생성
        String newName = fileControl.save(request, path, "bs_ctfc_img");

        BsCtfcDTO bsCtfc = new BsCtfcDTO(bsSeq, null, newName);

        BsCtfcDAO.getInstance().updateSysName(bsCtfc);

    }

    /**
     * <h1>사업자 프로필 수정</h1>
     * bs_users, bs_ctfc 데이터 베이스 수정
     */
    private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int bsSeq = (Integer) request.getSession().getAttribute("bsSeq");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String number = request.getParameter("number");

        BsUsersDTO bsUser = new BsUsersDTO();

        bsUser.setBs_seq(bsSeq);
        bsUser.setBs_name(name);
        bsUser.setBs_phone(phone);
        bsUser.setBs_number(number);

        BsUsersDAO.getInstance().updateProfile(bsUser);
        BsCtfcDAO.getInstance().updateBsNum(new BsCtfcDTO(bsSeq, number, null));
    }

    /**
     * <h1>사업자 페이지 데이터 불러오기</h1>
     * session에 bsSeq만 필요
     */
    private void getPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getSession().setAttribute("bsSeq", 112);

        int bsSeq = (Integer) request.getSession().getAttribute("bsSeq");

        List<GymDTO> gymList = GymDAO.getInstance().getGymByBsSeq(bsSeq);
        List<GymFilterDTO> gymFilterList = new ArrayList<>();
        GymFilterDAO filterDAO = GymFilterDAO.getInstance();
        for (GymDTO gym : gymList) {
            gymFilterList.add(filterDAO.selectByGymSeq(gym.getGym_seq()));
        }

        BsUsersDTO bsUser = BsUsersDAO.getInstance().getByBsSeq(bsSeq);
        BsCtfcDTO bsCtfc = BsCtfcDAO.getInstance().getByBsSeq(bsSeq);
        request.setAttribute("bsUser", bsUser);
        request.setAttribute("bsCtfc", bsCtfc);
        request.setAttribute("gymList", gymList);
        request.setAttribute("gymFilterList", gymFilterList);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
}
