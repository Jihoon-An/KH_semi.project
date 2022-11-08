package dto;

public class GymFilterDTO {
	private int gym_seq;
	private String open;
	private String locker;
	private String shower;
	private String park;	
	
	public GymFilterDTO() {
		super();
	}
	public GymFilterDTO(int gym_seq, String open, String locker, String shower, String park) {
		super();
		this.gym_seq = gym_seq;
		this.open = open;
		this.locker = locker;
		this.shower = shower;
		this.park = park;
	}
	public int getGym_seq() {
		return gym_seq;
	}
	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getLocker() {
		return locker;
	}
	public void setLocker(String locker) {
		this.locker = locker;
	}
	public String getShower() {
		return shower;
	}
	public void setShower(String shower) {
		this.shower = shower;
	}
	public String getPark() {
		return park;
	}
	public void setPark(String park) {
		this.park = park;
	}
	
}
