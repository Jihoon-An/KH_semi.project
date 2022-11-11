package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;

public class CalendarDAO extends Dao{

    private CalendarDAO() {
        super();
    }
    private static CalendarDAO instance;

    synchronized public static CalendarDAO getInstance() {
        if (instance == null) {
            instance = new CalendarDAO();
        }
        return instance;
    }

    /**
     * user_seq로 캘린더 데이터 지우기
     */
    public void deleteByUserSeq(int userSeq) throws Exception{
        String sql = "delete from calendar where user_seq = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setInt(1, userSeq);
            statement.executeUpdate();

            connection.commit();
        }
    }

}

