package dto;

public class GymDTO {
	private int gym_seq;
	private int bs_seq;
	private String gym_name;
	private String gym_phone;
	private String gym_location;
	private String gym_price;
	private String manager_name;
	private String manager_phone;
	private String manager_email;
	public int getGym_seq() {
		return gym_seq;
	}
	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}
	public int getBs_seq() {
		return bs_seq;
	}
	public void setBs_seq(int bs_seq) {
		this.bs_seq = bs_seq;
	}
	public String getGym_name() {
		return gym_name;
	}
	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}
	public String getGym_phone() {
		return gym_phone;
	}
	public void setGym_phone(String gym_phone) {
		this.gym_phone = gym_phone;
	}
	public String getGym_location() {
		return gym_location;
	}
	public void setGym_location(String gym_location) {
		this.gym_location = gym_location;
	}
	public String getGym_price() {
		return gym_price;
	}
	public void setGym_price(String gym_price) {
		this.gym_price = gym_price;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_phone() {
		return manager_phone;
	}
	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}
	public GymDTO(int gym_seq, int bs_seq, String gym_name, String gym_phone, String gym_location, String gym_price,
			String manager_name, String manager_phone, String manager_email) {
		super();
		this.gym_seq = gym_seq;
		this.bs_seq = bs_seq;
		this.gym_name = gym_name;
		this.gym_phone = gym_phone;
		this.gym_location = gym_location;
		this.gym_price = gym_price;
		this.manager_name = manager_name;
		this.manager_phone = manager_phone;
		this.manager_email = manager_email;
	}
	
	
	
	
	public GymDTO() {}
	
	
		
}
