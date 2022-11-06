package dto;

import java.sql.ResultSet;
import java.sql.Timestamp;

public class MembershipDTO {
    private int mem_seq;
    private int gym_seq;
    private int bs_seq;
    private int user_seq;
    private Timestamp mem_date;
    private Timestamp mem_end;
    private String mem_note;

    public MembershipDTO() {}

    public MembershipDTO(ResultSet resultSet) throws Exception {
        this.mem_seq = resultSet.getInt("mem_seq");
        this.gym_seq = resultSet.getInt("gym_seq");
        this.bs_seq = resultSet.getInt("bs_seq");
        this.user_seq = resultSet.getInt("user_seq");
        this.mem_date = resultSet.getTimestamp("mem_date");
        this.mem_end = resultSet.getTimestamp("mem_end");
        this.mem_note = resultSet.getString("mem_note");
    }

    public MembershipDTO(int mem_seq, int gym_seq, int bs_seq, int user_seq, Timestamp mem_date, Timestamp mem_end, String mem_note) {
        this.mem_seq = mem_seq;
        this.gym_seq = gym_seq;
        this.bs_seq = bs_seq;
        this.user_seq = user_seq;
        this.mem_date = mem_date;
        this.mem_end = mem_end;
        this.mem_note = mem_note;
    }

    public int getMem_seq() {
        return mem_seq;
    }

    public void setMem_seq(int mem_seq) {
        this.mem_seq = mem_seq;
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

    public int getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(int user_seq) {
        this.user_seq = user_seq;
    }

    public Timestamp getMem_date() {
        return mem_date;
    }

    public void setMem_date(Timestamp mem_date) {
        this.mem_date = mem_date;
    }

    public Timestamp getMem_end() {
        return mem_end;
    }

    public void setMem_end(Timestamp mem_end) {
        this.mem_end = mem_end;
    }

    public String getMem_note() {
        return mem_note;
    }

    public void setMem_note(String mem_note) {
        this.mem_note = mem_note;
    }
}
