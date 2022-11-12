package commons;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class temp {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {


        Class.forName("oracle.jdbc.driver.OracleDriver");

        String url = "jdbc:oracle:thin:@13.209.138.134:1521:xe";
        String id = "fitneeds";
        String pw = "fitneeds";

        String sql = "delete from gym_filter where gym_seq=?";

        Connection con = DriverManager.getConnection(url, id, pw);
        PreparedStatement pstat = con.prepareCall(sql);

        for (int gym_seq = 84; gym_seq < 316; gym_seq++) {
            pstat.setInt(1, gym_seq);
            pstat.executeUpdate();
        }


        con.commit();
        con.close();


    }
}
