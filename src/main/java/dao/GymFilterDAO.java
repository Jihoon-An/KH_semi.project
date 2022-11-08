package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class GymFilterDAO extends Dao {

	private static GymFilterDAO instance;

	synchronized public static GymFilterDAO getInstance() {
		if (instance == null) {
			instance = new GymFilterDAO();
		}
		return instance;
	}
	

	/**
	 * 사업자회원 가입시 짐 필터 삽입 기능 - 기본 default 값이 false이다.
	 * 
	 * @param dto
	 * @return
	 * @throws Exception
	 */

	public int addGymFilter(int gym_seq) throws Exception {
		String sql = "insert into gym_filter (gym_seq) values(?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, gym_seq);
			con.commit();
			return pstat.executeUpdate();
		}
	}

}
