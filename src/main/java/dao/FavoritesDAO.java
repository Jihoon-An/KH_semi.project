package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import dto.FavoritesDTO;


public class FavoritesDAO extends Dao {

	
	private static FavoritesDAO instance;
	
	synchronized public static FavoritesDAO getInstance() {
		if (instance == null) {
			instance = new FavoritesDAO();
		}
		return instance;
	}

	private  FavoritesDAO() {} 

	
	

	   public int add(FavoritesDTO dto) throws Exception{ //즐찾 추가
			String sql = "insert into favorites values(fav_seq.nextval, ?, ?)";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){   
				//seq를 직접 넣는 이유는 파일 때문에
	
				pstat.setInt(1, dto.getUser_seq());
				pstat.setInt(2, dto.getGym_seq());
		
				
				
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}
		}
	   
	   /**
	    *  즐겨찾기 삭제
	    * @param gym_seq  gym_seq 기준으로 , user 기능도 추
	    * @return
	    * @throws Exception
	    */
		public int remove(int gym_seq) throws Exception{  // 즐찾 삭제
			String sql = "delete from favorites where gym_seq = ?";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setInt(1, gym_seq);
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}
		}
	   
	   
}
