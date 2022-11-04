package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GymDTO;


public class GymDAO {
	private GymDAO() {
	}

	private static GymDAO instance;

	synchronized public static GymDAO getInstance() {
		if (instance == null) {
			instance = new GymDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");

		return ds.getConnection();
		
		
	}

	public GymDTO printGym(int seq) throws Exception{
		
		String sql="select * from gym where gym_seq =? ";
		  try(Connection con = this.getConnection();
				   PreparedStatement pstat = con.prepareStatement(sql);

				){
			  
			  pstat.setInt(1, seq);
			  try(ResultSet rs = pstat.executeQuery();){
				  
				  GymDTO dto = new GymDTO();
				  rs.next(); 
					
					   dto.setGym_seq(rs.getInt("gym_seq"));
					   dto.setBs_seq(rs.getInt("bs_seq"));
					   dto.setGym_name(rs.getString("gym_name"));
					   dto.setGym_phone(rs.getString("gym_phone"));
					   dto.setGym_location(rs.getString("gym_location"));
					   dto.setGym_price(rs.getString("gym_price"));
					   dto.setManager_name(rs.getString("manager_name"));
					   dto.setManager_phone(rs.getString("manager_phone"));
					   dto.setManager_email(rs.getString("manager_email")); 
				  
			   
					return dto;
			
			   }
			  
			  }
		  }
		 
		 

//public List<GymDTO> printGym2() throws Exception{   //test
//	
//	String sql="select * from gym ";
//	  try(Connection con = this.getConnection();
//			   PreparedStatement pstat = con.prepareStatement(sql);
//			  ResultSet rs = pstat.executeQuery();
//			){
//		  
//	
//		   List<GymDTO> list = new ArrayList();
//		   
//
//			   while(rs.next()) {
//				   GymDTO dto = new GymDTO();
//				   dto.setGym_seq(rs.getInt("gym_seq"));
//				   dto.setBs_seq(rs.getInt("bs.seq"));
//				   dto.setGym_name(rs.getString("gym_name"));
//				   dto.setGym_phone(rs.getString("gym_phone"));
//				   dto.setGym_location(rs.getString("gym_location"));
//				   dto.setGym_price(rs.getInt("gym_price"));
//				   dto.setManager_name(rs.getString("manager_name"));
//				   dto.setManager_phone(rs.getString("manager_phone"));
//				   dto.setManager_email(rs.getString("manager_email"));
//				   list.add(dto);
//		 
//		   }
//			   return list;
//		
//	   }
//	  }

		
	}

