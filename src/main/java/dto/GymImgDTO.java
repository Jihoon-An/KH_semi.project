package dto;

import java.sql.ResultSet;

public class GymImgDTO {
    private int gym_seq;
    private String gym_sysimg;

    public GymImgDTO() {
    }

    public GymImgDTO(int gym_seq, String gym_sysimg) {
        this.gym_seq = gym_seq;
        this.gym_sysimg = gym_sysimg;
    }

    public GymImgDTO(ResultSet rs) throws Exception{
        this.gym_seq = rs.getInt("gym_seq");
        this.gym_sysimg = rs.getString("gym_sysimg");
    }


    public int getGym_seq() {
        return gym_seq;
    }

    public void setGym_seq(int gym_seq) {
        this.gym_seq = gym_seq;
    }

    public String getGym_sysimg() {
        return gym_sysimg;
    }

    public void setGym_sysimg(String gym_sysimg) {
        this.gym_sysimg = gym_sysimg;
    }
}
