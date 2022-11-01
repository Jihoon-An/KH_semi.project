package dto;

import java.sql.Timestamp;

public class UserDTO {
	public UserDTO() {
	}
	
	public UserDTO(int seq, String email, String pw, String name, String phone, String birthday, Timestamp signup) {
		this.seq = seq;
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
		this.signup = signup;
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
