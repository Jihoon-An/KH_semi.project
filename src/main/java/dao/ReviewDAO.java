package dao;

import java.nio.channels.SelectableChannel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.print.attribute.standard.JobMessageFromOperator;
import javax.sql.DataSource;

import dto.GymDTO;
import dto.ReviewDTO;
import dto.UserDTO;
import oracle.net.aso.f;

public class ReviewDAO extends Dao{


	private ReviewDAO() {
	}

	private static ReviewDAO instance;

	synchronized public static ReviewDAO getInstance() {
		if (instance == null) {
			instance = new ReviewDAO();
		}
		return instance;
	}

	

	public List<ReviewDTO> printReivew(int gym_seq) throws Exception{

		String sql="select * from review where gym_seq= ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){

			pstat.setInt(1, gym_seq);
			List<ReviewDTO> list = new ArrayList();

			try( ResultSet rs = pstat.executeQuery()){

				while(rs.next()) {
					ReviewDTO dto = new ReviewDTO();
					dto.setReview_seq(rs.getInt("review_seq"));
					dto.setUser_seq(rs.getInt("user_seq"));
					dto.setGym_seq(rs.getInt("gym_seq"));
					dto.setBs_seq(rs.getInt("bs_seq"));
					dto.setReview_writer(rs.getString("review_writer"));
					dto.setReview_contents(rs.getString("review_contents"));
					dto.setReveiw_like(rs.getInt("review_like"));
					dto.setReview_writer_date(rs.getTimestamp("review_writer_date"));
					dto.setReivew_check1(rs.getString("review_check1"));
					dto.setReview_check2(rs.getString("review_check2"));
					dto.setReview_check3(rs.getString("review_check3"));
					dto.setReview_check4(rs.getString("review_check4"));
					dto.setReview_check5(rs.getString("review_check5"));
					list.add(dto);

				}
				return list;

			}
		}

	}
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

	
	public List<ReviewDTO> selectAllSortByLikes() throws Exception{
		List<ReviewDTO> result = new ArrayList<>();
		String sql="select * from (select * from review order by review_like desc) where rownum <= 10";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setReview_seq(rs.getInt("review_seq"));
				dto.setUser_seq(rs.getInt("user_seq"));
				dto.setGym_seq(rs.getInt("gym_seq"));
				dto.setBs_seq(rs.getInt("bs_seq"));
				dto.setReview_writer(rs.getString("review_writer"));
				dto.setReview_contents(rs.getString("review_contents"));
				dto.setReveiw_like(rs.getInt("review_like"));
				dto.setReview_writer_date(rs.getTimestamp("review_writer_date"));
				dto.setReivew_check1(rs.getString("review_check1"));
				dto.setReview_check2(rs.getString("review_check2"));
				dto.setReview_check3(rs.getString("review_check3"));
				dto.setReview_check4(rs.getString("review_check4"));
				dto.setReview_check5(rs.getString("review_check5"));
				result.add(dto);
			}
		}
		return result;
	}
}

