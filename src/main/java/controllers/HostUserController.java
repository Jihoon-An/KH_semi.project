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
                    this.userDel(request, response);
                    break;
                //관리자 페이지 사업자회원 삭제
                case "/bsUsersDel.host":
                    this.bsUserDel(request, response);
                    break;


                // 관리자페이지 - 리뷰목록 출력
                case "/reviewList.host":
					int cpage = Integer.parseInt(request.getParameter("cpage"));
					List<ReviewDTO> reviewList = ReviewDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
					request.setAttribute("list", reviewList);
					String reviewNavi = ReviewDAO.getInstance().getPageNavi(cpage, ReviewDAO.getInstance().getRecordCount());
					request.setAttribute("navi", reviewNavi);
					request.getRequestDispatcher("/host/host-review.jsp").forward(request, response);
					break;

                // 관리자페이지 - 리뷰관리 리뷰삭제
                case "/reviewDel.host":
                    String jsonstr = request.getParameter("review_seq");
                    Gson gson = new Gson();
                    java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
                    List<Integer> seqList = gson.fromJson(jsonstr, type);
                    for(int i = 0; i < seqList.size(); i++) {
                        ReviewDAO.getInstance().deleteByReviewSeq((seqList.get(i)));
                    }
                    break;

                // 관리자페이지 - 리뷰관리 검색기능
                case "/reviewSearch.host":
                    int cpageSearch = 1;
                    String typeSearch = request.getParameter("type");
                    String searchStr = request.getParameter("search");
                    int user_seq = UserDAO.getInstance().searchUserByUserEmail(searchStr).getSeq();
                    String reviewSearchNavi = null;
                    System.out.println("확인1");
                    System.out.println(typeSearch);
                    if (typeSearch.equals("select_email")) {
                        System.out.println("이메일 보이기");
                        List<ReviewDTO> emailList = ReviewDAO.getInstance().selectByUserSeqByRange(user_seq, cpageSearch * 10 - 9, cpageSearch * 10);
                        request.setAttribute("list", emailList);
                        reviewSearchNavi = ReviewDAO.getInstance().getPageNavi(cpageSearch, ReviewDAO.getInstance().getRecordCountByUserSeq(user_seq));
                    } else if (typeSearch.equals("select_contents")) {
                        System.out.println("컨텐츠 보이기");
                    } else if (typeSearch.equals("select_photo")) {
                        System.out.println("인증 보이기");
                    }
                    System.out.println("확인2");
                    request.setAttribute("navi", reviewSearchNavi);
                    request.getRequestDispatcher("/host/host-review.jsp").forward(request, response);
                    break;

                default:
                    break;
            }
        } catch (Exception e) {

            e.printStackTrace();
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
        String bsUsersNavi = bsDao.getPageNavi(cpage); //네비바 dao 인자 cpage


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


        String text = request.getParameter("inputT");
        BsUsersDAO bsUserDao = BsUsersDAO.getInstance();
        List<HashMap<String, Object>> bsUserDto = bsUserDao.search(text);
        System.out.println(bsUserDto);

        request.setAttribute("bsUserList", bsUserDto); //user

        request.getRequestDispatcher("/host/host-bsuser.jsp").forward(request, response);

    }


    protected void userDel(HttpServletRequest request, HttpServletResponse response) throws Exception {

        UserDAO userDao = UserDAO.getInstance();


        String jsonstr = request.getParameter("userseq");
        System.out.println(jsonstr);

        Gson gson = new Gson();
        java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();


        List<Integer> seqList = gson.fromJson(jsonstr, type);
        System.out.println(seqList);

        for (int i = 0; i < seqList.size(); i++) {
            userDao.deleteByUserSeq(seqList.get(i));
        }


    }

    protected void bsUserDel(HttpServletRequest request, HttpServletResponse response) throws Exception {

        BsUsersDAO bsUsersDAO = BsUsersDAO.getInstance();


        String jsonstr = request.getParameter("userseq");
        System.out.println(jsonstr);

        Gson gson = new Gson();
        java.lang.reflect.Type type = new TypeToken<List<Integer>>() {}.getType();
        List<Integer> seqList = gson.fromJson(jsonstr, type);
        System.out.println(seqList);

        for (int i = 0; i < seqList.size(); i++) {
            bsUsersDAO.deleteByBsSeq(seqList.get(i));
        }


    }


    protected void getUserSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {


        String text = request.getParameter("inputName");
        System.out.println(text);
        UserDAO usersDao = UserDAO.getInstance();
        List<UserDTO> userDto = usersDao.searchUser(text);

        System.out.println(userDto);

        request.setAttribute("userList", userDto); //user

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

