package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import commons.Common;
import dto.GymDTO;
import dto.ReviewDTO;
import dto.UserDTO;

public class ReviewDAO extends Dao {


    private ReviewDAO() {
    }


    private static ReviewDAO instance;

    synchronized public static ReviewDAO getInstance() {
        if (instance == null) {
            instance = new ReviewDAO();
        }
        return instance;
    }


    /**
     * gym-detail 페이지 불러올때 사용자가 클릭한 리뷰 좋아요 유지를 위해 hashmap 사용
     *
     * @param gym_seq
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> printReivew(int gym_seq) throws Exception {


        String sql = "select * from review r left join (select review_seq, users_seq liked_user_seq from likes) l on r.review_seq = l.review_seq where r.gym_seq = ? order by 9 desc";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
        ) {

            pstat.setInt(1, gym_seq);
            List<HashMap<String, Object>> list = new ArrayList<>();


            try (ResultSet rs = pstat.executeQuery();) {

                while (rs.next()) {
                    HashMap<String, Object> data = new HashMap<>();
                    ReviewDTO dto = new ReviewDTO();


                    data.put("review", new ReviewDTO(rs));
                    data.put("liked", rs.getString("liked_user_seq"));
                    list.add(data);
                }

                return list;
            }
        }

    }

    /**
     * 리뷰 체크 카운트 기반으로 하여 출력
     *
     * @param gym_seq
     * @return
     * @throws Exception
     */
    public HashMap<String, Object> reviewChkCount(int gym_seq) throws Exception {

        String sql = "select gym_seq, count(review_check1) check1, count(review_check2) check2, count(review_check3) check3,\r\n"
                + "count(review_check4) check4, count(review_check5) check5 from review group by gym_seq having gym_seq = ?";

        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, gym_seq);

            HashMap<String, Object> date = new HashMap<>();
            try (ResultSet rs = pstat.executeQuery();) {
                while (rs.next()) {
                    date.put("gym_seq", rs.getString("gym_seq"));
                    date.put("check1", rs.getString("check1"));
                    date.put("check2", rs.getString("check2"));
                    date.put("check3", rs.getString("check3"));
                    date.put("check4", rs.getString("check4"));
                    date.put("check5", rs.getString("check5"));
                }
                return date;
            }

        }


    }


    /**
     * 좋아요 클릭시 리뷰테이블의 review_like 1 감소
     * <p>
     * 좋아요 클릭시 리뷰 1 증가 계정당 1회
     *
     * @param
     * @return
     * @th)rows Exception
     */

    public int addReviewLike(int rseq) throws Exception {
        String sql = "update review set review_like=review_like+1 where review_seq=? ";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            //seq를 직접 넣는 이유는 파일 때문에

            pstat.setInt(1, rseq);

            int result = pstat.executeUpdate();
            con.commit();

            return result;
        }
    }

    /**
     * * 좋아요 클릭시 리뷰테이블의 review_like 1 감소
     *
     * @param rseq
     * @return
     * @throws Exception
     */
    public int delReviewLike(int rseq) throws Exception {
        String sql = "update review set review_like=review_like-1 where review_seq = ? ";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            //seq를 직접 넣는 이유는 파일 때문에

            pstat.setInt(1, rseq);

            int result = pstat.executeUpdate();
            con.commit();

            return result;
        }
    }

    public HashMap<String, Object> gymAvg(int gym_seq) throws Exception {

        String sql = "select round(avg(review_star),1) avg from review where gym_seq=?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, gym_seq);

            try (ResultSet rs = pstat.executeQuery()) {

                HashMap<String, Object> data = new HashMap<>();
                while (rs.next()) {

                    data.put("gymAvg", rs.getString("avg"));
                }
                return data;

            }


        }

    }


    public int add(ReviewDTO dto) throws Exception {
        String sql = "update review set review_like=review_like+1 where seq=?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            // seq를 직접 넣는 이유는 파일 때문에

            pstat.setInt(1, dto.getUser_seq());
            pstat.setInt(2, dto.getGym_seq());

            int result = pstat.executeUpdate();
            con.commit();

            return result;
        }
    }


    /**
     * gym table을 join 시킨 review table을 review_like가 높은 10행 만큼 조회
     *
     * @return List<HashMap < String, Object>>
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectSortByLikes() throws Exception {
        List<HashMap<String, Object>> result = new ArrayList<>();
        String sql = "select * from (select review.*, row_number() over(order by review_like desc) rn from review) r left join gym g on r.gym_seq = g.gym_seq where rn <= 10";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
             ResultSet rs = pstat.executeQuery();
        ) {
            while (rs.next()) {
                HashMap<String, Object> data = new HashMap<>();
                data.put("review", new ReviewDTO(rs));
                data.put("gym", new GymDTO(rs));
                result.add(data);
            }
        }
        return result;
    }

    /**
     * userSeq로 review를 List로 불러옴.
     *
     * @param userSeq
     * @return
     * @throws Exception
     */
    public List<ReviewDTO> getListByUser(int userSeq) throws Exception {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "select * from review where user_seq = ?";
        try (
                Connection connection = this.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setInt(1, userSeq);
            try (ResultSet rs = statement.executeQuery();) {

                while (rs.next()) {
                    ReviewDTO review = new ReviewDTO(rs);
                    String gymName = GymDAO.getInstance().printGym(review.getGym_seq()).getGym_name();
                    review.setGym_name(gymName);
                    reviews.add(review);
                }

                return reviews;
            }
        }
    }

    public void deleteByReviewSeq(int review_seq) throws Exception {
        String sql = "delete from review where review_seq = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setInt(1, review_seq);
            statement.executeUpdate();

            connection.commit();
        }
    }

    /**
     * bsSeq에 해당하는 데이터 삭제
     *
     * @param bsSeq
     * @throws Exception
     */
    public void deleteByBsSeq(int bsSeq) throws Exception {
        String sql = "delete from review where bs_seq = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setInt(1, bsSeq);
            statement.executeUpdate();

            connection.commit();
        }
    }


    /**
     * GYM 리뷰 작성 등록
     *
     * @param dto
     * @return
     * @throws Exception
     */
    public int writeReview(ReviewDTO dto) throws Exception {
        String sql = "insert into review values(REVIEW_SEQ.NEXTVAL,?,?,?,?,?,?,0,sysdate,?,?,?,?,?,?)";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, dto.getUser_seq());
            pstat.setInt(2, dto.getGym_seq());
            pstat.setInt(3, dto.getBs_seq());
            pstat.setString(4, dto.getReview_writer());
            pstat.setString(5, dto.getReview_contents());
            pstat.setInt(6, dto.getReview_star());
            pstat.setString(7, dto.getReview_check1());
            pstat.setString(8, dto.getReview_check2());
            pstat.setString(9, dto.getReview_check3());
            pstat.setString(10, dto.getReview_check4());
            pstat.setString(11, dto.getReview_check5());
            pstat.setString(12, dto.getReview_photo());

            con.commit();

            return pstat.executeUpdate();
        }
    }


    /**
     * GYM 리뷰 수정 등록
     *
     * @param dto
     * @return
     * @throws Exception
     */
    public void modifyReview(ReviewDTO dto) throws Exception {
        String sql = "update review set " +
                "review_contents = ?," +
                "review_star = ?," +
                "review_check1 = ?," +
                "review_check2 = ?," +
                "review_check3 = ?," +
                "review_check4 = ?," +
                "review_check5 = ?," +
                "review_photo = ? " +
                "where review_seq = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, dto.getReview_contents());
            statement.setInt(2, dto.getReview_star());
            statement.setString(3, dto.getReview_check1());
            statement.setString(4, dto.getReview_check2());
            statement.setString(5, dto.getReview_check3());
            statement.setString(6, dto.getReview_check4());
            statement.setString(7, dto.getReview_check5());
            statement.setString(8, dto.getReview_photo());
            statement.setInt(9, dto.getReview_seq());

            statement.executeUpdate();
            connection.commit();
        }
    }


    public List<ReviewDTO> getByGymSeq(int gymSeq) throws Exception {
        String sql = "select * from review where gym_seq = ?";
        List<ReviewDTO> reviewList = new ArrayList<>();

        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, gymSeq);

            try (ResultSet rs = statement.executeQuery();) {
                while (rs.next()) {
                    reviewList.add(new ReviewDTO(rs));
                }
                return reviewList;
            }
        }
    }

    public void deleteByGymSeq(int gymSeq) throws Exception {
        String sql = "delete from raview where gym_seq = ?";

        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, gymSeq);

            statement.executeUpdate();
            con.commit();
        }
    }


    public int delete(int seq) throws Exception {

        String sql = "delete from board where seq= ?";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setInt(1, seq);

            int result = pstat.executeUpdate();
            con.commit();

            return result;
        }
    }

    public int modifyBySeq(String title, String contents, int seq) throws Exception {
        String sql = "update board set title=?, contents=? where seq=?";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setString(1, title);
            pstat.setString(2, contents);
            pstat.setInt(3, seq);

            int result = pstat.executeUpdate();
            con.commit();

            return result;

        }
    }

    // users_email로 검색한 총 게시글의 개수를 반환하는 코드
    public int getRecordCountByUserEmail(String user_email) throws Exception {
        String sql = "select count(*) from review r join users u on r.user_seq = u.users_seq where users_email like ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, "%" + user_email + "%");
            try (ResultSet rs = pstat.executeQuery();) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }


    // review_contents로 검색한 총 게시글의 개수를 반환하는 코드
    public int getRecordCountByContents(String review_contents) throws Exception {
        String sql = "select count(*) from review where review_contents  like ? order by 1";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, "%" + review_contents + "%");
            try (ResultSet rs = pstat.executeQuery();) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }

    // 리뷰 총 게시글의 개수를 반환하는 코드
    public int getRecordCount() throws Exception {
        String sql = "select count(*) from review";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
             ResultSet rs = pstat.executeQuery()) {
            rs.next();
            return rs.getInt(1);
        }
    }


    // 페이지 전체 네비
    public String getPageNavi(int currentPage, int recordTotalCount) throws Exception {
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


    // 검색 네비
    public String getSearchPageNavi(String type, String search, int currentPage, int recordTotalCount) throws Exception {
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
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewSearch.host?cpage=" + (startNavi - 1)
                    + "'>Previous</a></li>");
        }
        for (int i = startNavi; i <= endNavi; i++) {
            if (currentPage == i) {
                sb.append("<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\" href=\"/reviewSearch.host?cpage=" + i + "&type=" + type + "&search=" + search + "\">" + i
                        + "</a></li>");
            } else {
                sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/reviewSearch.host?cpage=" + i + "&type=" + type + "&search=" + search + "\">" + i
                        + "</a></li>");
            }
        }
        if (needNext) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewSearch.host?cpage=" + (endNavi + 1) + "&type=" + type + "&search=" + search
                    + "'>Next</a></li>");
        }
        return sb.toString();
    }





    // 검색 네비 (인증)
    public String getSearchPageNaviCrtf(String type, String search, int currentPage, int recordTotalCount) throws Exception {
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
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewSearch.host?cpage=" + (startNavi - 1)
                    + "'>Previous</a></li>");
        }
        for (int i = startNavi; i <= endNavi; i++) {
            if (currentPage == i) {
                sb.append("<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\" href=\"/reviewSearch.host?cpage=" + i + "&type=" + type + "&searchCrtf=" + search + "\">" + i
                        + "</a></li>");
            } else {
                sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/reviewSearch.host?cpage=" + i + "&type=" + type + "&searchCrtf=" + search + "\">" + i
                        + "</a></li>");
            }
        }
        if (needNext) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewSearch.host?cpage=" + (endNavi + 1) + "&type=" + type + "&searchCrtf=" + search
                    + "'>Next</a></li>");
        }
        return sb.toString();
    }








    public List<ReviewDTO> selectByRange(int start, int end) throws Exception {
        String sql = "select * from (select review.*, row_number() over(order by review_seq desc) rn from review) where rn between ? and ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, start);
            pstat.setInt(2, end);

            try (ResultSet rs = pstat.executeQuery();) {
                List<ReviewDTO> list = new ArrayList<>();

                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO(rs);
                    dto.setUsers_email(UserDAO.getInstance().selectBySeq(dto.getUser_seq()).getEmail());
                    dto.setGym_name(GymDAO.getInstance().printGym(dto.getGym_seq()).getGym_name());
                    list.add(dto);
                }
                return list;
            }
        }
    }


    /**
     * 유저 email 로 검색하여 나온 페이지 목록
     *
     * @param user_email
     * @param start
     * @param end
     * @return
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectByUserEmailByRange(String user_email, int start, int end) throws Exception {
        String sql = "select * from " +
                "(select r.*, u.users_email, g.gym_name, row_number() " +
                "over(order by review_seq desc) rn " +
                "from review r " +
                "join users u on r.user_seq = u.users_seq " +
                "join gym g on r.gym_seq = g.gym_seq " +
                "where users_email like ?) " +
                "where rn between ? and ? ";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, "%" + user_email + "%");
            pstat.setInt(2, start);
            pstat.setInt(3, end);
            try (ResultSet rs = pstat.executeQuery();) {
                List<HashMap<String, Object>> list = new ArrayList<>();
                while (rs.next()) {
                    HashMap<String, Object> data = new HashMap<>();
//                    data.put("dto", new ReviewDTO(rs));
                    data.put("review_seq", rs.getInt("review_seq"));
                    data.put("review_contents", rs.getString("review_contents"));
                    data.put("review_star", rs.getInt("review_star"));
                    data.put("review_like", rs.getInt("review_like"));
                    data.put("review_writer_date", rs.getTimestamp("review_writer_date"));
                    data.put("review_check1", rs.getString("review_check1"));
                    data.put("review_check2", rs.getString("review_check2"));
                    data.put("review_check3", rs.getString("review_check3"));
                    data.put("review_check4", rs.getString("review_check4"));
                    data.put("review_check5", rs.getString("review_check5"));
                    data.put("review_photo", rs.getString("review_photo"));
                    data.put("gym_name", rs.getString("gym_name"));
                    data.put("users_email", rs.getString("users_email"));
                    list.add(data);
                }
                return list;
            }
        }
    }


    /**
     * 리뷰 내용으로 검색하여 나온 페이지 목록
     *
     * @param review_contents
     * @param start
     * @param end
     * @return
     * @throws Exception
     */
    public List<ReviewDTO> selectByContentsByRange(String review_contents, int start, int end) throws Exception {
        String sql = "select * from (select review.*, row_number() over(order by review_seq desc) rn from review where review_contents like ?) where rn between ? and ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, '%' + review_contents + '%');
            pstat.setInt(2, start);
            pstat.setInt(3, end);
            try (ResultSet rs = pstat.executeQuery();) {
                List<ReviewDTO> list = new ArrayList<>();
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO(rs);
                    dto.setUsers_email(UserDAO.getInstance().selectBySeq(dto.getUser_seq()).getEmail());
                    dto.setGym_name(GymDAO.getInstance().printGym(dto.getGym_seq()).getGym_name());
                    list.add(dto);
                }
                return list;
            }
        }
    }


    public void certifyByReviewSeq(int review_seq) throws Exception {
        String sql = "update review set review_photo = ? where review_seq = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, "인증완료");
            statement.setInt(2, review_seq);

            statement.executeUpdate();
            connection.commit();
        }
    }

    public void certifyCancleByReviewSeq(int review_seq) throws Exception {
        String sql = "update review set review_photo = ? where review_seq = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, "인증실패");
            statement.setInt(2, review_seq);

            statement.executeUpdate();
            connection.commit();
        }
    }


    public List<ReviewDTO> selectByCertifyByRange(String searchStr, int start, int end) throws Exception {
        String sql = "select * from (select review.*, row_number() over(order by review_seq desc) rn from review where review_photo like ?) where rn between ? and ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, searchStr);
            pstat.setInt(2, start);
            pstat.setInt(3, end);
            try (ResultSet rs = pstat.executeQuery();) {
                List<ReviewDTO> list = new ArrayList<>();
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO(rs);
                    dto.setUsers_email(UserDAO.getInstance().selectBySeq(dto.getUser_seq()).getEmail());
                    dto.setGym_name(GymDAO.getInstance().printGym(dto.getGym_seq()).getGym_name());
                    list.add(dto);
                }
                return list;
            }
        }
    }


    // 리뷰인증여부 검색한 총 게시글의 개수를 반환하는 코드(미인증 제외)
    public int getRecordCountByCertify(String searchStr) throws Exception {
        String sql = "select count(*) from review where review_photo like ? order by 1";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, "%" + searchStr + "%");
            try (ResultSet rs = pstat.executeQuery();) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }

    public List<ReviewDTO> selectByNotCertifyByRange(int start, int end) throws Exception {
        String sql = "select * from (select review.*, row_number() over(order by review_seq desc) rn from review where review_photo not in ('인증실패','인증완료')) where rn between ? and ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, start);
            pstat.setInt(2, end);
            try (ResultSet rs = pstat.executeQuery();) {
                List<ReviewDTO> list = new ArrayList<>();
                while (rs.next()) {
                    ReviewDTO dto = new ReviewDTO(rs);
                    dto.setUsers_email(UserDAO.getInstance().selectBySeq(dto.getUser_seq()).getEmail());
                    dto.setGym_name(GymDAO.getInstance().printGym(dto.getGym_seq()).getGym_name());
                    list.add(dto);
                }
                return list;
            }
        }
    }

    public int getRecordCountByNotCertify() throws Exception {
        String sql = "select count(*) from review where review_photo not in ('인증실패','인증완료') order by 1";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            try (ResultSet rs = pstat.executeQuery();) {
                rs.next();
                return rs.getInt(1);
            }
        }
    }


    // review_seq 로 검색해서 나온 review 테이블
    public ReviewDTO getByReviewSeq(int review_seq) throws Exception {
        String sql = "select * from review where review_seq = ?";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, review_seq);
            try (ResultSet rs = statement.executeQuery();) {
                if (rs.next()) {
                    ReviewDTO dto = new ReviewDTO(rs);
                    return dto;
                } else {
                    return new ReviewDTO();
                }
            }
        }
    }


    // 리뷰 인증 등록된 사진 파일 지울 때 seq로 name 얻어옴
    public String getFileNameByReviewSeq(int review_seq) throws Exception {
        String sql = "select review_photo from review where review_seq = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setInt(1, review_seq);
            try (ResultSet resultSet = statement.executeQuery();) {

                if (resultSet.next()) {
                    return resultSet.getString("review_photo");
                }
            }
            return "";
        }
    }


}





