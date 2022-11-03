package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import dto.FavoritesDTO;


public class FavoritesDAO {

	
	private static FavoritesDAO instance;
	
	
	public static FavoritesDAO getInstance() throws Exception{
		if(instance == null) {
			instance = new FavoritesDAO();
		}
		return instance;
	}

	private  FavoritesDAO() {} 

	
	
	   private Connection getConnection() throws Exception {
		      Context ctx = new InitialContext(); // tomcat 환경 찾아서 요구하는 코드, //우클릭 했을때 메뉴 상황에 따라 다르게 나오는걸 컨텍스트메뉴
		      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); // java:comp/env/ 고정값,  jdbc 찾아달라고 요청
		      
		      return ds.getConnection();
		   }
	   public int Favoriteadd(FavoritesDTO dto) throws Exception{ //즐찾 추가
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
	   
		public int favoriteremove(int gym_seq) throws Exception{  // 즐찾 삭제
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
