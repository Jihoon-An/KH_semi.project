package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.BsUsersDTO;
import dto.UserDTO;

public class BsUsersDAO extends Dao {
		
	private BsUsersDAO() {
		super();
	}

	private static BsUsersDAO instance;

	synchronized public static BsUsersDAO getInstance() {
		if (instance == null) {
			instance = new BsUsersDAO();
		}
		return instance;
	}
	

	/**
	 * 사업자 회원 날짜 오름차순 정렬 출력
	 * @return
	 * @throws Exception
	 */
	public List<BsUsersDTO> selectAll() throws Exception {
		List<BsUsersDTO> result = new ArrayList<>();
		String sql = "select * from bs_users order by bs_signup desc";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
		
				
				   while(rs.next()) {
					   BsUsersDTO dto = new BsUsersDTO();
					   dto.setBs_seq(rs.getInt("bs_seq"));
					   dto.setBs_number(rs.getInt("bs_number"));
					   dto.setBs_email(rs.getString("bs_email"));
					   dto.setBs_pw(rs.getString("bs_pw"));
					   dto.setBs_phone(rs.getString("bs_phone"));
					   dto.setBs_signup(rs.getTimestamp("bs_signup"));
					   
					   result.add(dto);
				   	}
				   return result;
			}
	
				
	
	}
}


