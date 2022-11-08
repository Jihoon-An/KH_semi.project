package dao;

import dto.GymDTO;
import dto.GymFilterDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GymFilterDAO extends Dao {

	private static GymFilterDAO instance;

	synchronized public static GymFilterDAO getInstance() {
		if (instance == null) {
			instance = new GymFilterDAO();
		}
		return instance;
	}
	

	/**
	 * 사업자회원 가입시 짐 필터 삽입 기능 - 기본 default 값이 false 이다.
	 * 
	 * @param gym_seq
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


	/**
	 * 해당 시설 필터값 불러오기 기능
	 *
	 * @param gym_seq
	 * @return GymFilterDTO List
	 * @throws Exception
	 */
	public GymFilterDTO selectByFilter(int gym_seq) throws Exception {
		String sql = "select * from gym_filter f join gym g on f.gym_seq = g.gym_seq where g.gym_seq = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, gym_seq);

			ResultSet rs = pstat.executeQuery();

			if(rs.next()) {
				return new GymFilterDTO(rs);
			}
			return new GymFilterDTO();
		}
	}

}
