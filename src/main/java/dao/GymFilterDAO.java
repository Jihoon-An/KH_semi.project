package dao;

import dto.GymFilterDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		String sql = "select * from gym_filter where gym_seq = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, gym_seq);

			try(ResultSet rs = pstat.executeQuery();) {

				if (rs.next()) {
					return new GymFilterDTO(rs);
				}
				return new GymFilterDTO();
			}
		}
	}

	public void deleteByGymSeq(int gymSeq) throws Exception{
		String sql = "delete from gym_filter where gym_seq = ?";

		try (Connection con = this.getConnection();
			 PreparedStatement statement = con.prepareStatement(sql)) {

			statement.setInt(1, gymSeq);
			statement.executeUpdate();

			con.commit();
		}
	}


	/**
	 * Gym Filter 시설 필터 수정
	 *
	 * @param gymFilterDTO
	 * @throws Exception
	 */
	public void updateGymFilter(GymFilterDTO gymFilterDTO) throws Exception {
		String sql = "update gym_filter set open = ?, locker = ?, shower = ?, park =? where gym_seq = ?";

		try (Connection con = this.getConnection();
			 PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, gymFilterDTO.getOpen());
			pstat.setString(2, gymFilterDTO.getLocker());
			pstat.setString(3, gymFilterDTO.getShower());
			pstat.setString(4, gymFilterDTO.getPark());
			pstat.setInt(5, gymFilterDTO.getGym_seq());

			pstat.executeUpdate();
			con.commit();
		}
	}





}
