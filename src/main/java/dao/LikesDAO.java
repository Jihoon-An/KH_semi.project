package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.LikesDTO;

public class LikesDAO extends Dao {

    private static LikesDAO instance;
	private  LikesDAO() {
		super();
	}
	
	 synchronized public static LikesDAO getInstance() {
	        if (instance == null) {
	            instance = new LikesDAO();
	        }
	        return instance;
	    }
	 /**
	  * 좋아요 클릭시 likes 테이블에 추가
	  * @param dto
	  * @return
	  * @throws Exception
	  */
	 public int add(LikesDTO dto) throws Exception{
		 String sql ="insert into Likes values(?, ?, ?)";
		 try(Connection con = this.getConnection();
				 PreparedStatement pstat = con.prepareStatement(sql);){
			 pstat.setInt(1, dto.getReview_seq());
			 pstat.setInt(2, dto.getUsers_seq());
			 pstat.setInt(3, dto.getGym_seq());
			 
			 int result = pstat.executeUpdate();
			 con.commit();
			 return result;
		 }
	 }
	 
	 /**
	  * 좋아요 클릭시 likes 테이블에 제거
	  * @param gym_seq
	  * @param users_seq
	  * @return
	  * @throws Exception
	  */
	 public int remove(int review_seq, int gym_seq, int users_seq) throws Exception{  
			String sql = "delete from likes where review_seq= ? and gym_seq = ? and users_seq = ?";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setInt(1, review_seq);
				pstat.setInt(2, gym_seq);
				pstat.setInt(3, users_seq);
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}
		}
	 
	    public boolean isLikeExist(int rseq, int useq, int gseq) throws Exception{  //id중복확인 dao
			   String sql = "select * from likes where review_seq=? and users_seq = ? and gym_seq = ?";
			   try(Connection con = this.getConnection();
						PreparedStatement pstat = con.prepareStatement(sql);
					  ){
				   pstat.setInt(1, rseq);
				   pstat.setInt(1, useq);
				   pstat.setInt(2, gseq);
				   try( ResultSet rs = pstat.executeQuery();){
					   boolean result = rs.next(); //존재하면 true
						return result;
						//return rs.next(); 가능
				   }
		

		   }
			
		   	}
	 
}
