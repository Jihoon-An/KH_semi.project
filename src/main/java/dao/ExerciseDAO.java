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
