package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReviewDTO {

	private int review_seq;
	private int user_seq;
	private int gym_seq;
	private int bs_seq;
	private String review_writer;
	private String review_contents;
	private int reveiw_like;
	private Timestamp review_writer_date;
	private String reivew_check1;
	private String review_check2;
	private String review_check3;
	private String review_check4;
	private String review_check5;
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
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
	public int getBs_seq() {
		return bs_seq;
	}
	public void setBs_seq(int bs_seq) {
		this.bs_seq = bs_seq;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public int getReveiw_like() {
		return reveiw_like;
	}
	public void setReveiw_like(int reveiw_like) {
		this.reveiw_like = reveiw_like;
	}
	public Timestamp getReview_writer_date() {
		return review_writer_date;
	}
	public void setReview_writer_date(Timestamp review_writer_date) {
		this.review_writer_date = review_writer_date;
	}
	public String getReivew_check1() {
		return reivew_check1;
	}
	public void setReivew_check1(String reivew_check1) {
		this.reivew_check1 = reivew_check1;
	}
	public String getReview_check2() {
		return review_check2;
	}
	public void setReview_check2(String review_check2) {
		this.review_check2 = review_check2;
	}
	public String getReview_check3() {
		return review_check3;
	}
	public void setReview_check3(String review_check3) {
		this.review_check3 = review_check3;
	}
	public String getReview_check4() {
		return review_check4;
	}
	public void setReview_check4(String review_check4) {
		this.review_check4 = review_check4;
	}
	public String getReview_check5() {
		return review_check5;
	}
	public void setReview_check5(String review_checkS) {
		this.review_check5 = review_checkS;
	}
	
	
	public ReviewDTO(int review_seq, int user_seq, int gym_seq, int bs_seq, String review_writer,
			String review_contents, int reveiw_like, Timestamp review_writer_date, String reivew_check1,
			String review_check2, String review_check3, String review_check4, String review_check5) {
		super();
		this.review_seq = review_seq;
		this.user_seq = user_seq;
		this.gym_seq = gym_seq;
		this.bs_seq = bs_seq;
		this.review_writer = review_writer;
		this.review_contents = review_contents;
		this.reveiw_like = reveiw_like;
		this.review_writer_date = review_writer_date;
		this.reivew_check1 = reivew_check1;
		this.review_check2 = review_check2;
		this.review_check3 = review_check3;
		this.review_check4 = review_check4;
		this.review_check5 = review_check5;
	}
	
	
public String getFormDate() {
		
		long writeTime = this.review_writer_date.getTime();
		long currentTime = System.currentTimeMillis();
		
		//System.currentTimeMillis()
		//1970년 1월 1일부터 경과한 시간을 long값으로 리턴 1/1000 초값을리턴
		long timeGap = currentTime - writeTime;
//		System.out.println(timeGap);
		
		if(timeGap<60*1000) {
			return "1분 이내";
		}else if(timeGap <300*1000) {
			return "5분 이내";
		}else if(timeGap <3600*1000) {
			return "1시간 이내";
		}else if(timeGap < 86400*1000) {
			return "24시간 이내";
		}else {
			SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시");
			//SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시mm분");
			return sdf.format(writeTime);
		}
	

	}
	
	public ReviewDTO() {}
	
	
	
	
}
