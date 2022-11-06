package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
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
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<BsUsersDTO> selectAll() throws Exception {
		List<BsUsersDTO> result = new ArrayList<>();
		String sql = "select * from bs_users order by bs_signup desc";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();

			while (rs.next()) {
				BsUsersDTO dto = new BsUsersDTO();
				dto.setBs_seq(rs.getInt("bs_seq"));
				dto.setBs_number(rs.getString("bs_number"));
				dto.setBs_email(rs.getString("bs_email"));
				dto.setBs_pw(rs.getString("bs_pw"));
				dto.setBs_phone(rs.getString("bs_phone"));
				dto.setBs_signup(rs.getTimestamp("bs_signup"));

				result.add(dto);
			}
			return result;
		}

	}
	
	
	/**
	 * 
	 * 사업자 회원가입 창에서 이메일 중복 확인
	 * 
	 * @param email
	 * @return
	 * @throws Exception
	 */
	public boolean isBsEmailCheck(String email) throws Exception {
		String sql = "select * from bs_users where bs_email = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, email);

			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}

		}
	}
	
	/**
	 * 
	 * 사업자 회원가입시 seq 단 한번만 만들어서 시설정보에 사업자 seq 추가하기 위함
	 * 
	 * @return
	 * @throws Exception
	 */
	public int getBsSeqNextVal() throws Exception{
		String sql = "select bs_seq.nextval from dual";
		
		try(Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			rs.next();
			
			return rs.getInt(1);
		}
		
	}
	
	/**
	 * 
	 * 사업자 회원가입
	 * 
	 * @param email
	 * @param pw
	 * @param phone
	 * @return
	 * @throws Exception
	 */
	public int isBsSignUp(BsUsersDTO dto) throws Exception {

		String sql = "insert into bs_users values(?,?,?,?,?,?,sysdate)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, dto.getBs_seq());
			pstat.setString(2, dto.getBs_number());
			pstat.setString(3, dto.getBs_email());
			pstat.setString(4, dto.getBs_pw());
			pstat.setString(5, dto.getBs_name());
			pstat.setString(6, dto.getBs_phone());
			
			con.commit();
			
			return pstat.executeUpdate();
		}
	}
	
}
