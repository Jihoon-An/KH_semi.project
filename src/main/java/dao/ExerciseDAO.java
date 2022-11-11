package dao;

import dto.ExerciseDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

//    public void insertRecord(ExerciseDTO dto) throws Exception {
//        String sql = "insert into exercise values(exr_seq.nextval, cal_seq.nextval, ?,null,?,null,sysdate,null,null,null)";
//
//        try (Connection con = this.getConnection();
//             PreparedStatement pstat = con.prepareStatement(sql);) {
//
//            pstat.setString(1, dto.);
//            pstat.setString(2, dto.);
//            pstat.setString(3, dto.);
//
//            int result = pstat.executeUpdate();
//            con.commit();
//        }
//    }
}
