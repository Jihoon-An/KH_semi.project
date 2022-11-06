package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MembershipDAO extends Dao{

    protected MembershipDAO() {
        super();
    }

    public void deleteByUserSeq(int userSeq) throws Exception{
        String sql = "delete from membership where user_seq = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setInt(1, userSeq);
            statement.executeUpdate();
            connection.commit();
        }
    }
}
