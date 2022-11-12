package dao;

import dto.GymImgDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GymImgDAO extends Dao {

    private GymImgDAO() {
        super();
    }

    private static GymImgDAO instance;

    public static GymImgDAO getInstance() {
        if (instance == null) {
            instance = new GymImgDAO();
        }
        return instance;
    }

    /**
     * GymSeq에 해당하는 GymImgDTO를 List로 불러옴
     * @param gymSeq
     * @throws Exception
     */
    public GymImgDTO getByGymSeq(int gymSeq) throws Exception {
        String sql = "select * from gym_img where gym_seq = ?";

        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, gymSeq);

            try(ResultSet rs = statement.executeQuery();) {
                if (rs.next()) {
                    return new GymImgDTO(rs);
                }
                return new GymImgDTO();
            }
        }
    }

    /**
     * GymSeq에 해당하는 정보 지우기
     * @param gym_seq
     */
    public void deleteByGymSeq(int gymSeq) throws Exception {
        String sql = "delete from gym_img where gym_seq = ?";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, gymSeq);
            statement.executeUpdate();

            con.commit();
        }
    }

    public void update(int gymSeq, String gymImg) throws Exception {
        String sql = "update gym_img set gym_sysimg = ? where gym_seq = ?";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setString(1, gymImg);
            statement.setInt(2, gymSeq);

            con.commit();
        }
    }

    public void insert(int gymSeq, String gymImg) throws Exception {
        String sql = "insert into gym_img values(?, ?)";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, gymSeq);
            statement.setString(2, gymImg);

            con.commit();
        }
    }

    public void newTable(int gymSeqNextVal) throws Exception {
        String sql = "insert into gym_img values(?, null)";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, gymSeqNextVal);

            con.commit();
        }
    }
}
