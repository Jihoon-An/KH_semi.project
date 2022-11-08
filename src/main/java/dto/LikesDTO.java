package dto;

public class LikesDTO {
	private int review_seq;
	private int users_seq;
	private int gym_seq;
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public int getUsers_seq() {
		return users_seq;
	}
	public void setUsers_seq(int users_seq) {
		this.users_seq = users_seq;
	}
	public int getGym_seq() {
		return gym_seq;
	}
	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}
	public LikesDTO(int review_seq, int users_seq, int gym_seq) {
		super();
		this.review_seq = review_seq;
		this.users_seq = users_seq;
		this.gym_seq = gym_seq;
	}
	
	
	
	
}
