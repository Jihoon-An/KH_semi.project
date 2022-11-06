package dto;

import java.sql.ResultSet;
import java.sql.Timestamp;

public class ExerciseDTO {
    private int exr_seq;
    private int cal_seq;
    private Timestamp cal_date;
    private int user_seq;
    private String exr_sports;
    private String exr_how;
    private String exr_intensity;

    public ExerciseDTO() {
    }

    public ExerciseDTO(ResultSet resultSet) throws Exception{
        this.exr_seq = resultSet.getInt("exr_seq");
        this.cal_seq = resultSet.getInt("cal_seq");
        this.cal_date = resultSet.getTimestamp("cal_date");
        this.user_seq = resultSet.getInt("user_seq");
        this.exr_sports = resultSet.getString("exr_sports");
        this.exr_how = resultSet.getString("exr_how");
        this.exr_intensity = resultSet.getString("exr_intensity");
    }

    public ExerciseDTO(int exr_seq, int cal_seq, Timestamp cal_date, int user_seq, String exr_sports, String exr_how, String exr_intensity) {
        this.exr_seq = exr_seq;
        this.cal_seq = cal_seq;
        this.cal_date = cal_date;
        this.user_seq = user_seq;
        this.exr_sports = exr_sports;
        this.exr_how = exr_how;
        this.exr_intensity = exr_intensity;
    }

    public int getExr_seq() {
        return exr_seq;
    }

    public void setExr_seq(int exr_seq) {
        this.exr_seq = exr_seq;
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

    public String getExr_sports() {
        return exr_sports;
    }

    public void setExr_sports(String exr_sports) {
        this.exr_sports = exr_sports;
    }

    public String getExr_how() {
        return exr_how;
    }

    public void setExr_how(String exr_how) {
        this.exr_how = exr_how;
    }

    public String getExr_intensity() {
        return exr_intensity;
    }

    public void setExr_intensity(String exr_intensity) {
        this.exr_intensity = exr_intensity;
    }
}
