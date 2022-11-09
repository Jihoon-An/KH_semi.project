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
     * gym-detail 페이지 불러올때 사용자가 클릭한 리뷰 좋아요 유지를 위해 hashmap 사용
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
            HashMap<String, Object> data = new HashMap<>();
            try (ResultSet rs = pstat.executeQuery();) {

                while (rs.next()) {
                    data.put("review", new ReviewDTO(rs));
                    data.put("liked", rs.getString("liked_user_seq"));
                	list.add(data);
                }
                return list;

            }
        }

    }
    

	
    
	/**

	 * 좋아요 클릭시 리뷰테이블의 review_like 1 감소

	 * 좋아요 클릭시 리뷰 1 증가 계정당 1회
	 * 

	 * @param dto
	 * @return
	 * @throws Exception
	 */

	public int addReviewLike(int rseq) throws Exception{
		String sql="update review set review_like=review_like+1 where review_seq=? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){   
			//seq를 직접 넣는 이유는 파일 때문에

			pstat.setInt(1,rseq);
			
	
			
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	/**
	 *  * 좋아요 클릭시 리뷰테이블의 review_like 1 감소
	 * @param rseq
	 * @return
	 * @throws Exception
	 */
	public int delReviewLike(int rseq) throws Exception{
		String sql="update review set review_like=review_like-1 where review_seq = ? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){   
			//seq를 직접 넣는 이유는 파일 때문에

			pstat.setInt(1,rseq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	
	}
			

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


    /**
     * gym table을 join 시킨 review table을 review_like가 높은 10행 만큼 조회
     * @return List<HashMap<String, Object>>
     * @throws Exception
     */
    public List<HashMap<String, Object>> selectSortByLikes() throws Exception {
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
