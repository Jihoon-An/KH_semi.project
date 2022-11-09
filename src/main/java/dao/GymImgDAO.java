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

    public static GymImgDAO getInstance() {
        return (GymImgDAO) Dao.getInstance();
    }

    /**
     * GymSeq에 해당하는 GymImgDTO를 List로 불러옴
     * @param gymSeq
     * @throws Exception
     */
    public List<GymImgDTO> getByGymSeq(int gymSeq) throws Exception {
        List<GymImgDTO> gymImgList = new ArrayList<>();
        String sql = "select * from gym_img where gym_seq = ?";

        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, gymSeq);

            try(ResultSet rs = statement.executeQuery();) {
                while (rs.next()) {
                    gymImgList.add(new GymImgDTO(rs));
                }
                return gymImgList;
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
}
