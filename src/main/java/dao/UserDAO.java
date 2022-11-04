package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.UserDTO;

public class UserDAO {
	
	private UserDAO() {
	}

	private static UserDAO instance;

	synchronized public static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");

		return ds.getConnection();
	}
	
	public List<UserDTO> selectAll() throws Exception {
		List<UserDTO> result = new ArrayList<>();
		String sql = "select * from users";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				result.add(new UserDTO(rs.getInt("user_seq"), rs.getString("user_email"), rs.getString("user_pw"),
						rs.getString("user_name"), rs.getString("user_phone"), rs.getString("user_birthday"), rs.getTimestamp("user_signup")));
			}
			return result;
		}
	}

	public UserDTO selectSeq(int seq) throws Exception{
		String sql = "select * from users where users_seq = ?";
		try (
				Connection con = getConnection();
				PreparedStatement prepareStatement = con.prepareStatement(sql);
		){
			prepareStatement.setInt(1, seq);
			try (ResultSet resultSet = prepareStatement.executeQuery();){

			}
		}
	}

	public String searchId(String name, String phone) throws Exception {
		String sql = "select user_email from users where user_name = ? and user_phone = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, name);
			pstat.setString(2, phone);
			ResultSet rs = pstat.executeQuery();
			return rs.next() ? rs.getString("user_email") : null; 
		}
	}
	
	public Boolean searchPw(String email, String phone) throws Exception {
		String sql = "select user_email from users where user_email = ? and user_phone = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			pstat.setString(2, phone);
			ResultSet rs = pstat.executeQuery();
			return rs.next();
		}
	}
	
	public List<UserDTO> searchAll(String option, String value) throws Exception {
		List<UserDTO> result = new ArrayList<>();
		String sql = "select * from users where " + option + " = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, value);
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				result.add(new UserDTO(rs.getInt("user_seq"), rs.getString("user_email"), rs.getString("user_pw"),
						rs.getString("user_name"), rs.getString("user_phone"), rs.getString("user_birthday"), rs.getTimestamp("user_signup")));
			}
			return result;
		}
	}
}
