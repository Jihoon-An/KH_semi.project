package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.UserDTO;

public class UserDAO extends Dao {

	private UserDAO() {
		super();
	}

	private static UserDAO instance;

	synchronized public static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}

	/**
	 * users 테이블의 모든 컬럼 조회
	 * 
	 * @return List<UserDTO>
	 * @throws Exception
	 */
	public List<UserDTO> selectAll() throws Exception {
		List<UserDTO> result = new ArrayList<>();
		String sql = "select * from users";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				result.add(new UserDTO(rs.getInt("user_seq"), rs.getString("user_email"), rs.getString("user_pw"),
						rs.getString("user_name"), rs.getString("user_phone"), rs.getString("user_birthday"),
						rs.getTimestamp("user_signup")));

			}
			return result;
		}
	}

	/**
	 * users 테이블에서 입력받은 name과 phone이 일치하는 row 조회
	 * 
	 * @param name
	 * @param phone
	 * @return String / null
	 * @throws Exception
	 */
	public String searchId(String name, String phone) throws Exception {
		String sql = "select users_email from users where users_name = ? and users_phone = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, name);
			pstat.setString(2, phone);
			ResultSet rs = pstat.executeQuery();
			return rs.next() ? rs.getString("user_email") : null;
		}
	}

	/**
	 * users 테이블에서 입력받은 email과 phone이 일치하는 row 조회
	 * 
	 * @param email
	 * @param phone
	 * @return boolean
	 * @throws Exception
	 */
	public boolean searchPw(String email, String phone) throws Exception {
		String sql = "select user_email from users where user_email = ? and user_phone = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			pstat.setString(2, phone);
			ResultSet rs = pstat.executeQuery();
			return rs.next();
		}
	}

	/**
	 * users 테이블에서 option의 value가 일치하는 모든 컬럼을 조회
	 * 
	 * @param option
	 * @param value
	 * @return List<UserDTO>
	 * @throws Exception
	 */
	public List<UserDTO> searchAll(String option, String value) throws Exception {
		List<UserDTO> result = new ArrayList<>();
		String sql = "select * from users where " + option + " = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, value);
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				result.add(new UserDTO(rs.getInt("user_seq"), rs.getString("user_email"), rs.getString("user_pw"),
						rs.getString("user_name"), rs.getString("user_phone"), rs.getString("user_birthday"),
						rs.getTimestamp("user_signup")));
			}
			return result;
		}
	}
	
	
/**
 * 
 * 유저 회원가입 아이디 중복 확인
 * 
 * @param email
 * @return
 * @throws Exception
 */
	public boolean isUserEmailCheck(String email) throws Exception {
		String sql = "select * from users where users_email = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) { 
			
			pstat.setString(1, email);
			
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
			
		}
	}
	
}
