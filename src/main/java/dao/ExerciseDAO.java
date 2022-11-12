package dao;

import dto.ExerciseDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ExerciseDAO extends Dao{

    private ExerciseDAO() {
        super();
    }

    private static ExerciseDAO instance;

    synchronized public static ExerciseDAO getInstance() {
        if (instance == null) {
            instance = new ExerciseDAO();
        }
        return instance;
    }

    /**
     * UserSeq로 Exercise 테이블 데이터 지우기
     * @param userSeq
     * @throws Exception
     */
    public void deleteByUserSeq(int userSeq) throws Exception{
        String sql = "delete from exercise where user_seq = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setInt(1, userSeq);
            statement.executeUpdate();

            connection.commit();
        }
    }

    public void insertRecord(ExerciseDTO exr) throws Exception {
        String sql = "insert into exercise values(exr_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setTimestamp(1, exr.getExr_date());
            pstat.setInt(2, exr.getUser_seq());
            pstat.setString(3, exr.getExr_memo());
            pstat.setInt(4, exr.getExr_how());
            pstat.setString(5, exr.getExr_intensity());
            pstat.setString(6, exr.getInbody_weight());
            pstat.setString(7, exr.getInbody_bfm());
            pstat.setString(8, exr.getInbody_bmi());
            pstat.setString(9, exr.getInbody_sm());

            int result = pstat.executeUpdate();
            con.commit();
        }
    }

    public List<ExerciseDTO> selectByOption(String option, String value) throws Exception {
        List<ExerciseDTO> result = new ArrayList<>();
        String sql = "select * from exercise where " + option + " = ?";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);)
        {
            pstat.setString(1, value);
            try(ResultSet rs = pstat.executeQuery();) {
                while (rs.next()) {
                    result.add(new ExerciseDTO(rs));
                }
                return result;
            }
        }
    }

    public ExerciseDTO selectByDate(String userSeq, String date) throws Exception {
        String sql = "select * from exercise where user_seq = ? and exr_date = ?";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);)
        {
            pstat.setString(1, userSeq);
            pstat.setString(2, date);
            try(ResultSet rs = pstat.executeQuery();) {
                return rs.next() ? new ExerciseDTO(rs) : null;
            }
        }
    }
}
