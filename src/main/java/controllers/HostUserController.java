package controllers;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect.Type;
import java.util.HashMap;
import java.util.List;

import javax.naming.InterruptedNamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;


import dao.BsUsersDAO;
import dao.GymDAO;
import dao.ReviewDAO;
import dao.UserDAO;
import dto.BsUsersDTO;
import dto.GymDTO;
import dto.ReviewDTO;
import dto.UserDTO;
import oracle.net.aso.a;


@WebServlet("*.host")
public class HostUserController extends ControllerAbs {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        String uri = request.getRequestURI();

        try {
            switch (uri) {

                // 관리자 임시 로그인용
                case "/admin.host":
                    request.getSession().invalidate();
                    request.getSession().setAttribute("admin", true);
                    this.getAllList(request, response);
                    request.getRequestDispatcher("/host/host.jsp").forward(request, response);
                    break;

                //관리자 페이지 일반회원목록 출력
                case "/usersList.host":
                    this.getUserList(request, response);
                    break;

                //관리자 페이지 일반회원 검색
                case "/userSearch.host":
                    this.getUserSearch(request, response);
                    break;

                //관리자 페이지 사업자회원 출력
                case "/bsUserList.host":
                    this.getBsUserList(request, response);
                    break;

                //관리자 사업자 회원 페이지 검색
                case "/bsUserSearch.host":
                    this.getBsSearch(request, response);
                    break;

                //관리자 페이지 회원 삭제
                case "/usersDel.host":
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.delUser(request, response);
                    break;

                //관리자 페이지 사업자회원 삭제
                case "/bsUsersDel.host":
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.delBsUser(request, response);
                    break;

                // 관리자페이지 - 리뷰목록 출력
                case "/reviewList.host":
                    this.getReviewList(request, response);
					break;

                // 관리자페이지 - 리뷰관리 검색기능
                case "/reviewSearch.host":
                    this.getReviewSearchList(request, response);
                    break;

                // 관리자페이지 - 리뷰관리 리뷰삭제
                case "/reviewDel.host":
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.reviewDel(request, response);
                    break;

                // 관리자페이지 - 리뷰관리 인증완료하기
                case "/reviewCertify.host":
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.reviewCertify(request, response);
                    break;

                // 관리자페이지 - 리뷰관리 인증취소하기
                case "/reviewCertifyCancle.host":
                    if (request.getMethod().equals("GET")) {
                        response.sendRedirect("/error.jsp");
                        return;
                    }
                    this.reviewCertifyCancle(request, response);
                    break;

                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void getReviewSearchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int cpage = Integer.parseInt(request.getParameter("cpage"));
        String typeSearch = request.getParameter("type");
        String searchStr = request.getParameter("search");

        String searchCrtf = request.getParameter("searchCrtf");



        String reviewSearchNavi = null;
        if (typeSearch.equals("email")) {
            List<HashMap<String, Object>> emailList = ReviewDAO.getInstance().selectByUserEmailByRange(searchStr, cpage * 10 - 9, cpage * 10);
            request.setAttribute("list", emailList);
            reviewSearchNavi = ReviewDAO.getInstance().getSearchPageNavi(typeSearch, searchStr, cpage, ReviewDAO.getInstance().getRecordCountByUserEmail(searchStr));
        } else if (typeSearch.equals("contents")) {
            List<ReviewDTO> contentsList = ReviewDAO.getInstance().selectByContentsByRange(searchStr, cpage * 10 - 9, cpage * 10);
            request.setAttribute("list", contentsList);
            reviewSearchNavi = ReviewDAO.getInstance().getSearchPageNavi(typeSearch, searchStr, cpage, ReviewDAO.getInstance().getRecordCountByContents(searchStr));
        } else if (typeSearch.equals("certify")) {
            if (searchCrtf.equals("인증완료") || searchCrtf.equals("인증실패")) {
                // 인증완료로 텍스트 있으면 인증완료로 서치한 결과물만 보여주기
                List<ReviewDTO> contentsList = ReviewDAO.getInstance().selectByCertifyByRange(searchCrtf, cpage * 10 - 9, cpage * 10);
                request.setAttribute("list", contentsList);
                reviewSearchNavi = ReviewDAO.getInstance().getSearchPageNaviCrtf(typeSearch, searchCrtf, cpage, ReviewDAO.getInstance().getRecordCountByCertify(searchCrtf));
            } else { // 미인증 - 그 외는 null 값 아닌 애들 결과물만 전부 보여주기
                List<ReviewDTO> contentsList = ReviewDAO.getInstance().selectByNotCertifyByRange(cpage * 10 - 9, cpage * 10);
                request.setAttribute("list", contentsList);
                reviewSearchNavi = ReviewDAO.getInstance().getSearchPageNaviCrtf(typeSearch, searchCrtf, cpage, ReviewDAO.getInstance().getRecordCountByNotCertify());
            }
        }
        request.setAttribute("navi", reviewSearchNavi);
        request.setAttribute("type", typeSearch);
        request.setAttribute("search", searchStr);
        request.setAttribute("searchCrtf", searchCrtf);

        request.getRequestDispatcher("/host/host-review.jsp").forward(request, response);
    }

    private void getReviewList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int cpage = Integer.parseInt(request.getParameter("cpage"));
        List<ReviewDTO> reviewList = ReviewDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
        request.setAttribute("list", reviewList);
        String reviewNavi = ReviewDAO.getInstance().getPageNavi(cpage, ReviewDAO.getInstance().getRecordCount());
        request.setAttribute("navi", reviewNavi);
        request.getRequestDispatcher("/host/host-review.jsp").forward(request, response);
    }

    private void reviewDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String jsonstr = request.getParameter("review_seq");
        Gson gson = new Gson();
        java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
        List<Integer> seqList = gson.fromJson(jsonstr, type);
        for(int i = 0; i < seqList.size(); i++) {
            ReviewDAO.getInstance().deleteByReviewSeq((seqList.get(i)));
        }
    }

    private void reviewCertify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String jsonstr = request.getParameter("review_seq");
        Gson gson = new Gson();
        java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
        List<Integer> seqList = gson.fromJson(jsonstr, type);
        for(int i = 0; i < seqList.size(); i++) {
            ReviewDAO.getInstance().certifyByReviewSeq((seqList.get(i)));
        }
    }

    private void reviewCertifyCancle(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String jsonstr = request.getParameter("review_seq");
        Gson gson = new Gson();
        java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
        List<Integer> seqList = gson.fromJson(jsonstr, type);
        for(int i = 0; i < seqList.size(); i++) {
            ReviewDAO.getInstance().certifyCancleByReviewSeq((seqList.get(i)));
        }
    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void getUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int cpage = Integer.parseInt(request.getParameter("cpage")); //네비바


        UserDAO usersdao = UserDAO.getInstance();
        String userNavi = usersdao.getPageNavi(cpage); //네비바 dao 인자 cpage
        List<UserDTO> userList = UserDAO.getInstance().selectByRange(cpage * 10 - 9, cpage * 10);


        request.setAttribute("userList", userList); //user
        request.setAttribute("userNavi", userNavi);//네비
        request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);

    }

    protected void getBsUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int cpage = Integer.parseInt(request.getParameter("cpage")); //네비바


        BsUsersDAO bsDao = BsUsersDAO.getInstance();
        String bsUsersNavi = bsDao.getPageNavi(cpage, BsUsersDAO.getInstance().getRecordCount()); //네비바 dao 인자 cpage


       // List<BsUsersDTO> bsUserList = BsUsersDAO.getInstance().selectByRange(cpage * 10 - 9, cpage * 10);
       List<HashMap<String, Object>> bsUserList = bsDao.selectByRange(cpage * 10 - 9, cpage * 10);
        // List<HashMap<String, Object>> countGym =bsDao.countGymByseq();
      //  System.out.println(countGym);
        
       // request.setAttribute("countGym", countGym);
        request.setAttribute("bsUserList", bsUserList);
        request.setAttribute("bsUserNavi", bsUsersNavi); //네비바
        request.getRequestDispatcher("/host/host-bsuser.jsp").forward(request, response);

    }

    protected void getBsSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int cpage = Integer.parseInt(request.getParameter("cpage"));
        String text = request.getParameter("inputT");
        BsUsersDAO bsUserDao = BsUsersDAO.getInstance();
        List<HashMap<String, Object>> bsUserDto = bsUserDao.search(text);
        request.setAttribute("bsUserList", bsUserDto);

        String bsUsersNavi = BsUsersDAO.getInstance().getPageNaviByNameSearch(text, cpage, BsUsersDAO.getInstance().getRecordCountByBsUsersName(text));
        request.setAttribute("bsUserNavi", bsUsersNavi);

        request.setAttribute("searchText", text);
        request.getRequestDispatcher("/host/host-bsuser.jsp").forward(request, response);
    }


    protected void delUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

        UserDAO userDao = UserDAO.getInstance();


        String jsonstr = request.getParameter("userseq");
//        System.out.println(jsonstr);

        Gson gson = new Gson();
        java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();


        List<Integer> seqList = gson.fromJson(jsonstr, type);
//        System.out.println(seqList);

        for (int i = 0; i < seqList.size(); i++) {
            userDao.deleteByUserSeq(seqList.get(i));
        }


    }

    protected void delBsUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

        BsUsersDAO bsUsersDAO = BsUsersDAO.getInstance();


        String jsonstr = request.getParameter("userseq");
//        System.out.println(jsonstr);

        Gson gson = new Gson();
        java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
        List<Integer> seqList = gson.fromJson(jsonstr, type);
//        System.out.println(seqList);

        for (int i = 0; i < seqList.size(); i++) {
            bsUsersDAO.deleteByBsSeq(seqList.get(i));
        }


    }


    protected void getUserSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int cpage = Integer.parseInt(request.getParameter("cpage"));
        String text = request.getParameter("inputName");
        UserDAO usersDao = UserDAO.getInstance();
        List<UserDTO> userDto = usersDao.searchUser(text);
        request.setAttribute("userList", userDto); //user
        String userNavi = UserDAO.getInstance().getPageNaviByNameSearch(text, cpage, UserDAO.getInstance().getRecordCountByUsersName(text));
        request.setAttribute("userNavi", userNavi);

        request.setAttribute("searchText", text);
        request.getRequestDispatcher("/host/host-user.jsp").forward(request, response);
    }

    /**
     *<h1>호스트용 신규 요소 리스트 메서드</h1>
     */
    protected void getAllList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<UserDTO> newUsersList = UserDAO.getInstance().selectByRange(1, 5);
        List<BsUsersDTO> newBsUsersList = BsUsersDAO.getInstance().SelectByRangeForHost(1, 5);
        List<GymDTO> newGymList = GymDAO.getInstance().SelectByRange(1, 5);
        List<ReviewDTO> newReviewList = ReviewDAO.getInstance().selectByRange(1, 5);

        request.setAttribute("users", newUsersList);
        request.setAttribute("bsUsers", newBsUsersList);
        request.setAttribute("gym", newGymList);
        request.setAttribute("review", newReviewList); 
    }

}

