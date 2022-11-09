package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdDAO extends Dao{

    private AdDAO() {
        super();
    }

    public static AdDAO getInstance(){
        return (AdDAO) Dao.getInstance();
    }


    public void deleteByBsSeq(int bsSeq) throws Exception {
        String sql = "delete from ad where bs_seq = ?";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql))
        {
            statement.setInt(1, bsSeq);

            statement.executeUpdate();
            con.commit();
        }
    }
}
