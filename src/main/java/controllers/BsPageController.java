package controllers;

import commons.FileControl;
import dao.BsCtfcDAO;
import dao.BsUsersDAO;
import dto.BsCtfcDTO;
import dto.BsUsersDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
                case "/updateProflie.bsPage":
                    this.updateProfile(request, response);
                    break;
                case "/updateCtfc.bsPage":
                    this.updateCtfc(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/");
        }

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
     */
    private void getPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int bsSeq = (Integer) request.getSession().getAttribute("bsSeq");

        BsUsersDTO bsUser = BsUsersDAO.getInstance().getByBsSeq(bsSeq);
        BsCtfcDTO bsCtfc = BsCtfcDAO.getInstance().getByBsSeq(bsSeq);
        request.setAttribute("bsUser", bsUser);
        request.setAttribute("bsCtfc", bsCtfc);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doGet(request, response);
    }
}
