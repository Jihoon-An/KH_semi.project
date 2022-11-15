package dto;

import java.sql.ResultSet;
import java.sql.Timestamp;

public class ManagerDTO {
    private int users_seq;
    private String title;
    private Timestamp start_date;
    private Timestamp end_date;

    public ManagerDTO() {}

    public ManagerDTO(ResultSet resultSet) throws Exception {
        this.users_seq = resultSet.getInt("users_seq");
        this.title = resultSet.getString("title");
        this.start_date = resultSet.getTimestamp("start_date");
        this.end_date = resultSet.getTimestamp("end_date");
    }

    public ManagerDTO(int users_seq, String title, Timestamp start_date, Timestamp end_date) {
        this.users_seq = users_seq;
        this.title = title;
        this.start_date = start_date;
        this.end_date = end_date;
    }


    public int getUsers_seq() {
        return users_seq;
    }

    public void setUsers_seq(int users_seq) {
        this.users_seq = users_seq;
    }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public Timestamp getStart_date() { return start_date; }

    public void setStart_date(Timestamp start_date) { this.start_date = start_date; }

    public Timestamp getEnd_date() { return end_date; }

    public void setEnd_date(Timestamp end_date) { this.end_date = end_date; }

}
