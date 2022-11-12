package dao;

import java.io.DataInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dto.FavoritesDTO;
import dto.GymDTO;
import dto.ReviewDTO;

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

        String sql = "select * from review r left join (select review_seq, users_seq liked_user_seq from likes) l on r.review_seq = l.review_seq where r.gym_seq = ? order by 1";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
        ) {

            pstat.setInt(1, gym_seq);
            List<HashMap<String, Object>> list = new ArrayList<>();


            try (ResultSet rs = pstat.executeQuery();) {

                while (rs.next()) {
                    HashMap<String, Object> data = new HashMap<>();
                    ReviewDTO dto = new ReviewDTO();
//					dto.setReview_seq(rs.getInt("review_seq"));
//					dto.setUser_seq(rs.getInt("user_seq"));
//					dto.setGym_seq(rs.getInt("gym_seq"));
//					dto.setBs_seq(rs.getInt("bs_seq"));
//					dto.setReview_writer(rs.getString("review_writer"));
//					dto.setReview_contents(rs.getString("review_contents"));
//					dto.setReview_like(rs.getInt("review_like")); 
//					dto.setReview_star(rs.getInt("review_star"));
//					dto.setReview_writer_date(rs.getTimestamp("review_writer_date"));
//					dto.setReview_check1(rs.getString("review_check1"));
//					dto.setReview_check2(rs.getString("review_check2"));
//					dto.setReview_check3(rs.getString("review_check3"));
//					dto.setReview_check4(rs.getString("review_check4"));
//					dto.setReview_check5(rs.getString("review_check5"));
//					dto.setReview_photo(rs.getString("review_photo"));

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
     * @param dto
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

    public int addViewCount(int seq) throws Exception { // 조회수 증가
        String sql = "update board set view_count=view_count+1 where seq=?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, seq);
            int reuslt = pstat.executeUpdate();
            con.commit();

            return reuslt;
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
        String sql = "select * from (select * from review order by review_like desc) r left join gym g on r.gym_seq = g.gym_seq where rownum <= 10";
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

//
//    public int delete(int seq) throws Exception {
//
//        String sql = "delete from board where seq= ?";
//
//        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//
//            pstat.setInt(1, seq);
//
//            int result = pstat.executeUpdate();
//            con.commit();
//
//            return result;
//        }
//    }

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


    public String getPageNavi(int currentPage) throws Exception {

        int recordTotalCount = this.getRecordCount();

        int recordCountPerPage = 10; // 게시판 한 페이지당 10개의 글씩 보여주기로 설정
        int naviCountPerPage = 10; // 게시판 하단의 Page Navigator 가 한번에 몇 개씩 보여질지 설정

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

        System.out.println("현재 페이지 : " + currentPage);
        System.out.println("네비게이터 시작 : " + startNavi);
        System.out.println("네비게이터 끝 : " + endNavi);

        boolean needPrev = true;
        boolean needNext = true;

        if (startNavi == 1) {
            needPrev = false;
        }

        if (endNavi == pageTotalCount) {
            needNext = false;
        }


        StringBuilder sb = new StringBuilder(); // 문자열 연결해주는 용도로 사용하는 클래스이다.

        if (needPrev) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/list.board?cpage=" + (startNavi - 1)
                    + "'>Previous</a></li>");
        }

        for (int i = startNavi; i <= endNavi; i++) {

            if (currentPage == i) {
                sb.append("<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\" href=\"/list.board?cpage=" + i + "\">" + i
                        + "</a></li>");
            } else {
                sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/list.board?cpage=" + i + "\">" + i
                        + "</a></li>");
            }

        }

        if (needNext) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/list.board?cpage=" + (endNavi + 1)
                    + "'>Next</a></li>");
        }


        return sb.toString();

    }

    // 게시글의 개수를 반환하는 코드 짜기
    private int getRecordCount() throws Exception {
        String sql = "select count(*) from board";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
             ResultSet rs = pstat.executeQuery()) {
            rs.next();
            return rs.getInt(1);
        }
    }


    public List<ReviewDTO> selectByRange(int start, int end) throws Exception {
        // int start, int end 는 행번호이다. seq 번호가 아니다.


        String sql = "select * from (select board.*, row_number() over(order by seq desc) rn from board) where rn between ? and ?";

        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setInt(1, start);
            pstat.setInt(2, end);

            try (ResultSet rs = pstat.executeQuery();) {

                List<ReviewDTO> list = new ArrayList<>();

                while (rs.next()) {

                    ReviewDTO dto = new ReviewDTO();

//                    dto.setSeq(rs.getInt("seq"));
//                    dto.setWriter(rs.getString("writer"));
//                    dto.setTitle(rs.getString("title"));
//                    dto.setContents(rs.getString("contents"));
//                    dto.setWrite_date(rs.getTimestamp("write_date"));
//                    dto.setView_count(rs.getInt("view_count"));
                    list.add(dto);

                }

                return list;
            }
        }
    }
}
