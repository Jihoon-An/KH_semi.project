package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import commons.Common;
import dto.BsUsersDTO;
import dto.GymDTO;
import dto.UserDTO;

public class UserDAO extends Dao {

    private UserDAO() {
        super();
    }

    private static UserDAO instance;

    synchronized public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    /**
     * users 테이블의 모든 컬럼 조회
     *
     * @return List<UserDTO>
     * @throws Exception
     */
    public List<UserDTO> selectAll() throws Exception {
        List<UserDTO> result = new ArrayList<>();
        String sql = "select * from users";
        try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            try(ResultSet rs = pstat.executeQuery();) {
                while (rs.next()) {
                    result.add(new UserDTO(rs));
                }
                return result;
            }
        }
    }

    /**
     * 일반 user의 seq로 해당 user의 모든 데이터를 불러옵니다. 데이터가 null exception이 나오면 문의해주세요
     * - 지훈 -
     *
     * @param seq users_seq
     * @return
     * @throws Exception
     */
    public UserDTO selectBySeq(int seq) throws Exception {
        String sql = "select * from users where users_seq = ?";
        try (Connection con = getConnection(); PreparedStatement prepareStatement = con.prepareStatement(sql);) {
            prepareStatement.setInt(1, seq);
            try (ResultSet resultSet = prepareStatement.executeQuery();) {
                if (resultSet.next()) {
                    UserDTO result = new UserDTO(resultSet);
                    return result;
                } else {
                    return new UserDTO();
                }
            }
        }
    }

    /**
     * users 테이블에서 입력받은 email과 phone이 일치하는 row 조회
     *
     * @param email
     * @param phone
     * @return boolean
     * @throws Exception
     */
    public boolean searchPw(String email, String phone) throws Exception {
        String sql = "select users_email from users where users_email = ? and users_phone = ?";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, email);
            pstat.setString(2, phone);
            try(ResultSet rs = pstat.executeQuery();) {
                return rs.next();
            }
        }
    }

    /**
     * users 테이블에서 option의 value가 일치하는 모든 컬럼을 조회
     *
     * @param option
     * @param value
     * @return List<UserDTO>
     * @throws Exception
     */
    public List<UserDTO> selectByOption(String option, String value) throws Exception {
        List<UserDTO> result = new ArrayList<>();
        String sql = "select * from users where " + option + " = ?";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);)
        {
            pstat.setString(1, value);
            try(ResultSet rs = pstat.executeQuery();) {
                while (rs.next()) {
                    result.add(new UserDTO(rs));
                }
                return result;
            }
        }
    }

    /**
     * 유저 회원가입 이메일 중복 확인
     *
     * @param email
     * @return
     * @throws Exception
     */
    public boolean isUserEmailCheck(String email) throws Exception {
        String sql = "select * from users where users_email = ?";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setString(1, email);

            try (ResultSet rs = pstat.executeQuery();) {
                return rs.next();
            }
        }
    }


    /**
     * <h1>유저 회원가입</h1>
     * 
     * @param email
     * @param pw
     * @param phone
     * @return
     * @throws Exception
     */
    public int isUserSignUp(String email, String pw, String phone) throws Exception {

        String sql = "insert into users values(users_seq.nextval,?,?,null,?,null,sysdate,null,null,null)";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setString(1, email);
            pstat.setString(2, pw);
            pstat.setString(3, phone);

            int result = pstat.executeUpdate();
            con.commit();

            return result;
        }
    }

    /**
     * 관리자 페이지 회원검색
     *
     * @param name
     * @return
     * @throws Exception
     */
    public List<UserDTO> searchUser(String name) throws Exception {
        String sql = "select * from users where users_name like ? order by 1";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
        ) {
            pstat.setString(1, "%" + name + "%");

            try (ResultSet rs = pstat.executeQuery();) {
                List<UserDTO> list = new ArrayList<>();

                while (rs.next()) {
					list.add(new UserDTO(rs));
                }

                return list;
            }
        }
    }
    
   
  


    /**
     * 프로필 수정
     * 수정목록 : 이름, 생일, 전화번호, 성별, 관심사
     *
     * @param user
     * @throws Exception
     */
    public void updateProfileInfo(UserDTO user) throws Exception {
        String sql = "update users set " +
                "users_name = ?," +
                "users_birthday = ?," +
                "users_phone = ?," +
                "sex = ?," +
                "interest = ? " +
                "where users_seq = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getBirthday());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getSex());
            statement.setString(5, user.getInterest());
            statement.setInt(6, user.getSeq());

            statement.executeUpdate();
            connection.commit();
        }
    }

    /**
     * 비밀번호 변경
     *
     * @param userSeq
     * @param pw      암호화 전의 PW
     * @throws Exception
     */
    public void updatePw(int userSeq, String pw) throws Exception {
        String sql = "update users set users_pw = ? where users_seq = ?";
        String password = Common.getSHA512(pw);

        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, password);
            statement.setInt(2, userSeq);

            statement.executeUpdate();
            connection.commit();
        }
    }

    public void deleteByUserSeq(int userSeq) throws Exception {
        String sql = "delete from users where users_seq = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setInt(1, userSeq);
            statement.executeUpdate();

            connection.commit();
        }
    }

    public void updatePi(int userSeq, String sysFile) throws Exception {
        String sql = "update users set users_PI = ? where users_seq = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, sysFile);
            statement.setInt(2, userSeq);
            statement.executeUpdate();

            connection.commit();
        }
    }

    public String getPiNameByUserSeq(int userSeq) throws Exception {
        String sql = "select users_pi from users where users_seq = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setInt(1, userSeq);
            try (ResultSet resultSet = statement.executeQuery();) {

                if (resultSet.next()) {
                    return resultSet.getString("users_pi");
                }
            }
            return "";
        }
    }
    
    
  
    // 아래로 네비바 로직
    public List<UserDTO> selectByRange(int start, int end) throws Exception { // 한페이지에 출력
        String sql = "select  * from (select users.*, row_number() over(order by users_signup desc) rn from users) where rn between ? and ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setInt(1, start);
            pstat.setInt(2, end);

            try (ResultSet rs = pstat.executeQuery();) {

                List<UserDTO> list = new ArrayList<UserDTO>();

                while (rs.next()) {

                    // 하나의 dto만 나오기떄문에 while문 필요x

                    list.add(new UserDTO(rs));
                }
                	return list;
            }
        }
    }

    public int getRecordCount() throws Exception { // 게시글 갯수반환
        String sql = "select count(*) from users";

        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
             ResultSet rs = pstat.executeQuery()) {
            if(rs.next()) {
                return rs.getInt(1); // 한줄 뽑겠다
            }
            return 0;
        }
    }



    public String getPageNavi(int currentPage) throws Exception { // 페이지 네비
        // 총 몇개의 글

        int recordTotalCount = this.getRecordCount(); // board 테이블에 총 144개의 글이 있다고 가정
        int recordCountPerPage = 10; // 한페이지당 몇개의 글을 보여줄것인가
        int naviCountPerpage = 10; // 게시판 하단의 page vaigator 가 한번에 몇개씩 보여질지저장

        // recordCountPerPage
        // naviCountPerpage 는 dao의 지역변수로 쓰면 안되고 따로 클래스를 만들어 static으로 사용해야함

        int pageTotalCount = 0; // 총페이지 갯수

        if (recordTotalCount % recordCountPerPage > 0) { // 총게시글/ 한페이지 몇개의 글 나머지가 0보다 크면 +1 아니면 그대로 //페이지 총 갯수

            pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
        } else {
            pageTotalCount = (recordTotalCount / recordCountPerPage);
        } // 전체페이지갯수

        // int currentPage =12; //현재 페이지가 12 // 매개변수로존재해야함
        // 7 : 1~10
        // 15 : 11 ~20
        // 28 : 21~30
        // 현재 페이지부터 시작 페이지를 얻어서 +9 // 1의 자리를 날리고 1을 끼워넣으면 시작페이지

        if (currentPage < 1) { // 현재 페이지가 1보다 작다그러면 현재 페이지는 1
            currentPage = 1;
        } else if (currentPage > pageTotalCount) { // 현재 페이지가 토탈페이지갯수보다 크면 현재페이지=토탈
            currentPage = pageTotalCount;
        } // 보안코드

        int startNavi = (currentPage - 1) / naviCountPerpage * naviCountPerpage + 1;
        int endNavi = startNavi + naviCountPerpage - 1;
        // 7 : 1~10
        // 15 : 11 ~20
        // 28 : 21~30
        // int startNavi=(currentPage-1)/10 *10 +1;
        // 1의 자리를 날리고 1을 끼워넣으면 시작페이지 //10의 배수일떈 성립이 안되어서 currentPage-1
        // 10페이지를 본다는 기준하에

        if (endNavi > pageTotalCount) {
            endNavi = pageTotalCount; // 네비게이터끝이 토탈 페이지 보다 크면 둘은 같다
        }

//		System.out.println("현재 페이지" +currentPage);
//		System.out.println("네비게이터 시작:" + startNavi);
//		System.out.println("네비게이터 끝"+endNavi);

        boolean needPrev = true;
        boolean needNext = true;

        if (startNavi == 1) {
            needPrev = false; // 스타트
        }
        if (endNavi == pageTotalCount) {
            needNext = false;
        }

        StringBuilder sb = new StringBuilder();

        if (needPrev) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/usersList.host?cpage=" + (startNavi - 1)
                    + "'>Previous</a></li>");
        }
        for (int i = startNavi; i <= endNavi; i++) {
            if (currentPage == i) {
                sb.append("<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\" href=\"/usersList.host?cpage=" + i + "\">" + i
                        + "</a></li>");
            } else {
                sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/usersList.host?cpage=" + i + "\">" + i
                        + "</a></li>");
            }
        }
        if (needNext) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/usersList.host?cpage=" + (endNavi + 1)
                    + "'>Next</a></li>");
        }

        return sb.toString();
        /*
         * int pageTotalCount= (recordTotalCount+9) / recordCountPerPage; 수정전
         * recordCountPerPage = 10일때만 해당될겁니다간단하게 페이지당 2페이지보이게하면 저걸로하면 페이지 엄청불어남
         *
         * 수정후 int pageTotalCount= (recordTotalCount+(recordCountPerPage-1)) /
         * recordCountPerPage;
         *
         *
         */
        // 게시글의 갯수 / 한페이지당 보여줄게시글+1=전체페에지 갯수

    }


    /**
     * 유저이메일 일부만 검색해서 유저테이블 내용 찾기
     *
     * @param users_email
     * @return
     * @throws Exception
     */
    public UserDTO searchUserByUserEmail(String users_email) throws Exception {
        String sql = "select * from users where users_email like ? order by 1";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, "%" + users_email + "%");
            try (ResultSet rs = pstat.executeQuery();) {
                if (rs.next()) {
                    UserDTO dto = new UserDTO(rs);
                    return dto;
                } else {
                    return new UserDTO();
                }
            }
        }
    }





    // Users 이름으로 검색한 총 게시글의 개수를 반환하는 코드
    public int getRecordCountByUsersName(String text) throws Exception {
        String sql = "select count(*) from users where users_name  like ? order by 1";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, "%" + text + "%");
            try (ResultSet rs = pstat.executeQuery();) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }




    // 페이지 네비
    public String getPageNavi2(int currentPage, int recordTotalCount) throws Exception {
        int recordCountPerPage = 10;
        int naviCountPerPage = 10;
        int pageTotalCount = 0;
        if (recordTotalCount % recordCountPerPage > 0) {
            pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
        } else {
            pageTotalCount = (recordTotalCount / recordCountPerPage);
        }
        if (currentPage < 1) {
            currentPage = 1;
        }
        if (currentPage > pageTotalCount) {
            currentPage = pageTotalCount;
        }
        int startNavi = (currentPage - 1) / recordCountPerPage * recordCountPerPage + 1;
        int endNavi = startNavi + naviCountPerPage - 1;
        if (endNavi > pageTotalCount) {
            endNavi = pageTotalCount;
        }
        boolean needPrev = true;
        boolean needNext = true;
        if (startNavi == 1) {
            needPrev = false;
        }
        if (endNavi == pageTotalCount) {
            needNext = false;
        }
        StringBuilder sb = new StringBuilder();
        if (needPrev) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewList.host?cpage=" + (startNavi - 1)
                    + "'>Previous</a></li>");
        }
        for (int i = startNavi; i <= endNavi; i++) {
            if (currentPage == i) {
                sb.append("<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\" href=\"/reviewList.host?cpage=" + i + "\">" + i
                        + "</a></li>");
            } else {
                sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/reviewList.host?cpage=" + i + "\">" + i
                        + "</a></li>");
            }
        }
        if (needNext) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewList.host?cpage=" + (endNavi + 1)
                    + "'>Next</a></li>");
        }
        return sb.toString();
    }










}
