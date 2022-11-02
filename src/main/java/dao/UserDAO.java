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
				result.add(new UserDTO(rs.getInt("users_seq"), rs.getString("users_email"), rs.getString("users_pw"),
						rs.getString("users_name"), rs.getString("users_phone"), rs.getString("users_birthday"), rs.getTimestamp("users_signup")));
			}
			return result;
		}
	}
	
	public String searchId(String name, String phone) throws Exception {
		String sql = "select users_email from users where users_name = ? and users_phone = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, name);
			pstat.setString(2, phone);
			ResultSet rs = pstat.executeQuery();
			return rs.next() ? rs.getString("users_email") : null; 
		}
	}
	
	public Boolean searchPw(String email, String phone) throws Exception {
		String sql = "select users_email from users where users_email = ? and users_phone = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			pstat.setString(2, phone);
			ResultSet rs = pstat.executeQuery();
			return rs.next();
		}
	}
	
	public List<UserDTO> searchAll(String option, String value, boolean bs) throws Exception {
		List<UserDTO> result = new ArrayList<>();
		String type = bs ? "business_user" : "users";
		String sql = "select * from "+ type +" where " + option + " = ?";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, value);
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				result.add(new UserDTO(rs.getInt("users_seq"), rs.getString("users_email"), rs.getString("users_pw"),
						rs.getString("users_name"), rs.getString("users_phone"), rs.getString("users_birthday"), rs.getTimestamp("users_signup")));
			}
			return result;
		}
	}
}
