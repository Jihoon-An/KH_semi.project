package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdDAO extends Dao{

    private AdDAO() {
        super();
    }

    private static AdDAO instance;

    synchronized public static AdDAO getInstance() {
        if (instance == null) {
            instance = new AdDAO();
        }
        return instance;
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
