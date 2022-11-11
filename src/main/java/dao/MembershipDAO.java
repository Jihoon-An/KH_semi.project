package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MembershipDAO extends Dao{

    private MembershipDAO() {
        super();
    }

    private static MembershipDAO instance;

    public static MembershipDAO getInstance() {
        if (instance == null) {
            instance = new MembershipDAO();
        }
        return instance;
    }


    /**
     * 헬스장 회원 테이블에서 userSeq에 해당하는 데이터를 지움.
     * @param userSeq
     * @throws Exception
     */
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

    public void deleteByBsSeq(int bsSeq) throws Exception {
        String sql = "delete from membership where bs_seq = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setInt(1, bsSeq);
            statement.executeUpdate();
            connection.commit();
        }
    }

    public void deleteByGymSeq(int gymSeq) throws Exception {
        String sql = "delete from membership where gym_seq = ?";

        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setInt(1, gymSeq);

            statement.executeUpdate();
            connection.commit();
        }
    }
}
