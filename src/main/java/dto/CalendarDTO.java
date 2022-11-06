package dto;

import java.sql.ResultSet;
import java.sql.Timestamp;

public class CalendarDTO {

    private int cal_seq;
    private Timestamp cal_date;
    private int user_seq;

    public CalendarDTO(ResultSet resultSet) throws Exception{
        this.cal_seq = resultSet.getInt("cal_seq");
        this.cal_date = resultSet.getTimestamp("cal_date");
        this.user_seq = resultSet.getInt("user_seq");
    }

    public CalendarDTO() {
    }

    public CalendarDTO(int cal_seq, Timestamp cal_date, int user_seq) {
        this.cal_seq = cal_seq;
        this.cal_date = cal_date;
        this.user_seq = user_seq;
    }

    public int getCal_seq() {
        return cal_seq;
    }

    public void setCal_seq(int cal_seq) {
        this.cal_seq = cal_seq;
    }

    public Timestamp getCal_date() {
        return cal_date;
    }

    public void setCal_date(Timestamp cal_date) {
        this.cal_date = cal_date;
    }

    public int getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(int user_seq) {
        this.user_seq = user_seq;
    }
}
