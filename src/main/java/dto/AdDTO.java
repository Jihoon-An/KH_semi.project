package dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdDTO {
    private int ad_seq;
    private int bs_seq;
    private String ad_name;
    private String ad_link;
    private String ad_sys;


    public AdDTO() {
    }

    public AdDTO(ResultSet rs) throws SQLException {
        this.ad_seq = rs.getInt("ad_seq");
        this.bs_seq = rs.getInt("bs_seq");
        this.ad_name = rs.getString("ad_name");
        this.ad_link = rs.getString("ad_link");
        this.ad_sys = rs.getString("ad_sys");
    }

    public AdDTO(int ad_seq, int bs_seq, String ad_name, String ad_link, String ad_sys) {
        this.ad_seq = ad_seq;
        this.bs_seq = bs_seq;
        this.ad_name = ad_name;
        this.ad_link = ad_link;
        this.ad_sys = ad_sys;
    }

    public int getAd_seq() {
        return ad_seq;
    }

    public void setAd_seq(int ad_seq) {
        this.ad_seq = ad_seq;
    }

    public int getBs_seq() {
        return bs_seq;
    }

    public void setBs_seq(int bs_seq) {
        this.bs_seq = bs_seq;
    }

    public String getAd_name() {
        return ad_name;
    }

    public void setAd_name(String ad_name) {
        this.ad_name = ad_name;
    }

    public String getAd_link() {
        return ad_link;
    }

    public void setAd_link(String ad_link) {
        this.ad_link = ad_link;
    }

    public String getAd_sys() {
        return ad_sys;
    }

    public void setAd_sys(String ad_sys) {
        this.ad_sys = ad_sys;
    }
}
