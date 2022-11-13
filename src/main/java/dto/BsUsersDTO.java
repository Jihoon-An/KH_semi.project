package dto;

import java.sql.ResultSet;
import java.sql.Timestamp;

public class BsUsersDTO {

	private int bs_seq;
	private String bs_number;
	private String bs_email;
	private String bs_pw;
	private String bs_name;
	private String bs_phone;
	private Timestamp bs_signup;



	private int gym_count;

	public int getBs_seq() {
		return bs_seq;
	}

	public void setBs_seq(int bs_seq) {
		this.bs_seq = bs_seq;
	}

	public String getBs_number() {
		return bs_number;
	}

	public void setBs_number(String bs_number) {
		this.bs_number = bs_number;
	}

	public String getBs_email() {
		return bs_email;
	}

	public void setBs_email(String bs_email) {
		this.bs_email = bs_email;
	}

	public String getBs_pw() {
		return bs_pw;
	}

	public void setBs_pw(String bs_pw) {
		this.bs_pw = bs_pw;
	}

	public String getBs_name() {
		return bs_name;
	}

	public void setBs_name(String bs_name) {
		this.bs_name = bs_name;
	}

	public String getBs_phone() {
		return bs_phone;
	}

	public void setBs_phone(String bs_phone) {
		this.bs_phone = bs_phone;
	}

	public Timestamp getBs_signup() {
		return bs_signup;
	}

	public void setBs_signup(Timestamp bs_signup) {
		this.bs_signup = bs_signup;
	}

	public BsUsersDTO(int bs_seq, String bs_number, String bs_email, String bs_pw, String bs_name, String bs_phone,
			Timestamp bs_signup) {
		super();
		this.bs_seq = bs_seq;
		this.bs_number = bs_number;
		this.bs_email = bs_email;
		this.bs_pw = bs_pw;
		this.bs_name = bs_name;
		this.bs_phone = bs_phone;
		this.bs_signup = bs_signup;
	}

	public BsUsersDTO(ResultSet resultSet) throws Exception {
		this.bs_seq = resultSet.getInt("bs_seq");
		this.bs_number = resultSet.getString("bs_number");
		this.bs_email = resultSet.getString("bs_email");
		this.bs_pw = resultSet.getString("bs_pw");
		this.bs_name = resultSet.getString("bs_name");
		this.bs_phone = resultSet.getString("bs_phone");
		this.bs_signup = resultSet.getTimestamp("bs_signup");
	}

	public BsUsersDTO() {
	}

	public void setGym_count(int gym_count) {
		this.gym_count = gym_count;
	}

	public int getGym_count() {
		return gym_count;
	}
}
