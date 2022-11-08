package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
     * gym_seq를 기준으로 출력
     *
     * @param gym_seq
     * @return
     * @throws Exception
     */
    public List<ReviewDTO> printReivew(int gym_seq) throws Exception {

        String sql = "select * from review where gym_seq= ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
        ) {

            pstat.setInt(1, gym_seq);
            List<ReviewDTO> list = new ArrayList();

            try (ResultSet rs = pstat.executeQuery()) {

                while (rs.next()) {
                    list.add(new ReviewDTO(rs));
                }
                return list;

            }
        }

    }
	
    
	/**
	 * 좋아요 클릭시 리뷰 1 증가 계정당 1회
	 * 
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int add(ReviewDTO dto) throws Exception {
		String sql = "update review set review_like=review_like+1 where seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
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

	/*
	 * "select count(*) from review group by "+ review_check1 +" having" +
	 * review_check1 +"='Y'"; 이런식으로 문자열로 만들어서 넣으면 되요 review_check1대신 변수가 들어가고 그걸
	 * for문 돌리면 될듯
	 * 
	 * for문으로 해야해요 ㄴㄴㄴㄴㄴㄴㄴㄴ 데이터베이스를 간섭하는 Method들이 모인것 뿐이지 그런거 없을껄요 근데 그렇다고 sql을 5개
	 * 만들지 마시고 그 컬럼명 들어가는 부분을 변수로 비워두고 컬럼명들을 list로 만들어서 for each문 돌려서 5번 실행하면서 숫자5개
	 * 있는 lIst를 반환하면 될듯 그렇게 하면 나중에 컬럼이 추가되도 list에 추가만 하면 되서 편할것같아요
	 */
//	public List<ReviewDTO> printReivew2() throws Exception{  //test
//
//		String sql="select * from review;";
//		try(Connection con = this.getConnection();
//				PreparedStatement pstat = con.prepareStatement(sql);
//				ResultSet rs = pstat.executeQuery();
//				){
//
//
//			List<ReviewDTO> list = new ArrayList();
//
//
//
//			while(rs.next()) {
//
//				ReviewDTO dto = new ReviewDTO();
//				dto.setReview_seq(rs.getInt("review_seq"));
//				dto.setUser_seq(rs.getInt("user_seq"));
//				dto.setGym_seq(rs.getInt("gym_seq"));
//				dto.setBs_seq(rs.getInt("bs_seq"));
//				dto.setReview_writer(rs.getString("review_writer"));
//				dto.setReview_contents(rs.getString("review_contents"));
//				dto.setReveiw_like(rs.getInt("review_like"));
//				dto.setReview_writer_date(rs.getTimestamp("review_writer_date"));
//				dto.setReivew_check1(rs.getString("review_check1"));
//				dto.setReview_check2(rs.getString("review_check2"));
//				dto.setReview_check3(rs.getString("review_check3"));
//				dto.setReview_check4(rs.getString("review_check4"));
//				dto.setReview_check5(rs.getString("review_check5"));
//				list.add(dto);
//			}
//			return list;
//
//		}
//	}


    public List<HashMap<String, Object>> selectAllSortByLikes() throws Exception {
        List<HashMap<String, Object>> result = new ArrayList<>();
        String sql = "select * from (select * from review order by review_like desc) r left join gym g on r.gym_seq = g.gym_seq where rownum <= 10";
        try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                HashMap<String, Object> data = new HashMap<>();
                data.put("review", new ReviewDTO(rs));
                data.put("gym", new GymDTO(rs));
                result.add(data);
            }
            rs.close();
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
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                ReviewDTO review = new ReviewDTO(rs);
                String gymName = GymDAO.getInstance().printGym(review.getGym_seq()).getGym_name();
                review.setGym_name(gymName);
                reviews.add(review);
            }
            rs.close();

            return reviews;
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
}
