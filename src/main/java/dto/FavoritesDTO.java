package dto;

public class FavoritesDTO {
	private int fav_seq;
	private int user_seq;
	private int gym_seq;
	public int getFav_seq() {
		return fav_seq;
	}
	public void setFav_seq(int fav_seq) {
		this.fav_seq = fav_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getGym_seq() {
		return gym_seq;
	}
	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}
	public FavoritesDTO(int fav_seq, int user_seq, int gym_seq) {
		super();
		this.fav_seq = fav_seq;
		this.user_seq = user_seq;
		this.gym_seq = gym_seq;
	}
	
	
	
}
