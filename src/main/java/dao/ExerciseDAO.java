package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ExerciseDAO extends Dao{

    protected ExerciseDAO() {
        super();
    }

    public static ExerciseDAO getInstance(){
        return (ExerciseDAO) Dao.getInstance();
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
