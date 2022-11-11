package dao;

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
}
