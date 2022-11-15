package dto;

import java.sql.Timestamp;

public class WeightDTO {

	private int user_seq;
	private String weight;
	private Timestamp weight_date;
	
	
	public WeightDTO() {
		super();
	}
	public WeightDTO(int user_seq, String weight, Timestamp weight_date) {
		super();
		this.user_seq = user_seq;
		this.weight = weight;
		this.weight_date = weight_date;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public Timestamp getWeight_date() {
		return weight_date;
	}
	public void setWeight_date(Timestamp weight_date) {
		this.weight_date = weight_date;
	}
	
	
	
}
