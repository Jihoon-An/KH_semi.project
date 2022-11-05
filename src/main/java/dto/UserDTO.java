package dto;

import java.sql.ResultSet;
import java.sql.Timestamp;

public class UserDTO {
	public UserDTO(ResultSet resultSet) throws Exception {
		this.seq = resultSet.getInt("users_seq");
		this.email = resultSet.getString("users_email");
		this.pw = resultSet.getString("users_pw");
		this.name = resultSet.getString("users_name");
		this.phone = resultSet.getString("users_phone");
		this.birthday = resultSet.getString("users_birthday");
		this.signup = resultSet.getTimestamp("users_signup");
	}

	public UserDTO() {
	}
	
	private int seq;
	private String email;
	private String pw;
	private String name;
	private String phone;
	private String birthday;
	private Timestamp signup;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Timestamp getSignup() {
		return signup;
	}
	public void setSignup(Timestamp signup) {
		this.signup = signup;
	}
}
