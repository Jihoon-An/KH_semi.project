package dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReviewDTO {

    private int review_seq;
    private int user_seq;
    private int gym_seq;
    private String gym_name;


    private int bs_seq;
    private String review_writer;
    private String review_contents;
    private int review_like;
    private Timestamp review_writer_date;
    private String review_check1;
    private String review_check2;
    private String review_check3;
    private String review_check4;
    private String review_check5;
    private int review_star;

    public int getReview_star() {
        return review_star;
    }

    public void setReview_star(int review_star) {
        this.review_star = review_star;
    }

    public String getGym_name() {
        return gym_name;
    }

    public void setGym_name(String gym_name) {
        this.gym_name = gym_name;
    }

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

    public int getReview_like() {
        return review_like;
    }

    public void setReview_like(int review_like) {
        this.review_like = review_like;
    }

    public Timestamp getReview_writer_date() {
        return review_writer_date;
    }

    public void setReview_writer_date(Timestamp review_writer_date) {
        this.review_writer_date = review_writer_date;
    }

    public String getReview_check1() {
        return review_check1;
    }

    public void setReview_check1(String review_check1) {
        this.review_check1 = review_check1;
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



    public String getFormDate() {

        long writeTime = this.review_writer_date.getTime();
        long currentTime = System.currentTimeMillis();

        //System.currentTimeMillis()
        //1970년 1월 1일부터 경과한 시간을 long값으로 리턴 1/1000 초값을리턴
        long timeGap = currentTime - writeTime;
//		System.out.println(timeGap);

        if (timeGap < 60 * 1000) {
            return "1분 이내";
        } else if (timeGap < 300 * 1000) {
            return "5분 이내";
        } else if (timeGap < 3600 * 1000) {
            return "1시간 이내";
        } else if (timeGap < 86400 * 1000) {
            return "24시간 이내";
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시");
            //SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시mm분");
            return sdf.format(writeTime);
        }
    }

    public ReviewDTO() {
    }

    public ReviewDTO(ResultSet resultSet) throws SQLException {
        this.review_seq = resultSet.getInt("review_seq");
        this.user_seq = resultSet.getInt("user_seq");
        this.gym_seq = resultSet.getInt("gym_seq");
        this.bs_seq = resultSet.getInt("bs_seq");
        this.review_writer = resultSet.getString("review_writer");
        this.review_contents = resultSet.getString("review_contents");
        this.review_like = resultSet.getInt("review_like");
        this.review_writer_date = resultSet.getTimestamp("review_writer_date");
        this.review_check1 = resultSet.getString("review_check1");
        this.review_check2 = resultSet.getString("review_check2");
        this.review_check3 = resultSet.getString("review_check3");
        this.review_check4 = resultSet.getString("review_check4");
        this.review_check5 = resultSet.getString("review_check5");
        this.review_star = resultSet.getInt("review_star");

    }

	public ReviewDTO(int review_seq) {
	
		this.review_seq = review_seq;
	
	}
    
    

}
