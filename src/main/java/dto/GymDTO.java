package dto;

import java.sql.ResultSet;

public class GymDTO {
    private int gym_seq;
    private int bs_seq;
    private String gym_name;
    private String gym_phone;
    private String gym_location;
    private int gym_price;
    private String gym_main_sysImg;
    private String gym_main_oriImg;
    private String gym_open;
    private String gym_close;
    private String gym_x;
    private String gym_y;

    public GymDTO(int gym_seq, int bs_seq, String gym_name, String gym_phone, String gym_location, int gym_price, String gym_main_sysImg, String gym_main_oriImg, String gym_open, String gym_close, String gym_x, String gym_y) {
        this.gym_seq = gym_seq;
        this.bs_seq = bs_seq;
        this.gym_name = gym_name;
        this.gym_phone = gym_phone;
        this.gym_location = gym_location;
        this.gym_price = gym_price;
        this.gym_main_sysImg = gym_main_sysImg;
        this.gym_main_oriImg = gym_main_oriImg;
        this.gym_open = gym_open;
        this.gym_close = gym_close;
        this.gym_x = gym_x;
        this.gym_y = gym_y;
    }

    public GymDTO() {
    }

    /**
     * ResultSet -> GymDTO
     * -지훈-
     * @param resultSet
     */
    public GymDTO(ResultSet resultSet) throws Exception {
        this.gym_seq = resultSet.getInt("gym_seq");
        this.bs_seq = resultSet.getInt("bs_seq");
        this.gym_name = resultSet.getString("gym_name");
        this.gym_phone = resultSet.getString("gym_phone");
        this.gym_location = resultSet.getString("gym_location");
        this.gym_price = resultSet.getInt("gym_price");
        this.gym_main_sysImg = resultSet.getString("gym_main_sysImg");
        this.gym_main_oriImg = resultSet.getString("gym_main_oriImg");
        this.gym_open = resultSet.getString("gym_open");
        this.gym_close = resultSet.getString("gym_close");
        this.gym_x = resultSet.getString("gym_x");
        this.gym_y = resultSet.getString("gym_y");
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

    public String getGym_name() {
        return gym_name;
    }

    public void setGym_name(String gym_name) {
        this.gym_name = gym_name;
    }

    public String getGym_phone() {
        return gym_phone;
    }

    public void setGym_phone(String gym_phone) {
        this.gym_phone = gym_phone;
    }

    public String getGym_location() {
        return gym_location;
    }

    public void setGym_location(String gym_location) {
        this.gym_location = gym_location;
    }

    public int getGym_price() {
        return gym_price;
    }

    public void setGym_price(int gym_price) {
        this.gym_price = gym_price;
    }

    public String getGym_main_sysImg() {
        return gym_main_sysImg;
    }

    public void setGym_main_sysImg(String gym_main_sysImg) {
        this.gym_main_sysImg = gym_main_sysImg;
    }

    public String getGym_main_oriImg() {
        return gym_main_oriImg;
    }

    public void setGym_main_oriImg(String gym_main_oriImg) {
        this.gym_main_oriImg = gym_main_oriImg;
    }

    public String getGym_open() {
        return gym_open;
    }

    public void setGym_open(String gym_open) {
        this.gym_open = gym_open;
    }

    public String getGym_close() {
        return gym_close;
    }

    public void setGym_close(String gym_close) {
        this.gym_close = gym_close;
    }

    public String getGym_x() {
        return gym_x;
    }

    public void setGym_x(String gym_x) {
        this.gym_x = gym_x;
    }

    public String getGym_y() {
        return gym_y;
    }

    public void setGym_y(String gym_y) {
        this.gym_y = gym_y;
    }



}
