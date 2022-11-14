package dao;

import dto.ManagerDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class ManagerDAO extends Dao{

    private ManagerDAO() {
        super();
    }

    private static ManagerDAO instance;

    public static ManagerDAO getInstance() {
        if (instance == null) {
            instance = new ManagerDAO();
        }
        return instance;
    }


    public void addManager(int userSeq, String title, Timestamp start_date, Timestamp end_date) throws Exception {
        String sql = "insert into manager values(?, ?, ?, ?)";
        try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setInt(1, userSeq);
            pstat.setString(2, title);
            pstat.setTimestamp(3, start_date);
            pstat.setTimestamp(4, end_date);
            pstat.executeUpdate();
            con.commit();
        }
    }


    public ManagerDTO selectByUserSeq(int userSeq) throws Exception {
        String sql = "select * from manager where users_seq = ?";
        try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setInt(1, userSeq);

            try (ResultSet rs = pstat.executeQuery();) {
                if (rs.next()) {
                    ManagerDTO dto = new ManagerDTO(rs);
                    return dto;
                }else {
                    return new ManagerDTO();
                }
            }
        }
    }



    public void updateByUserSeq(int userSeq) throws Exception {
        String sql = "update manager set title = ?, start_date = ?, end_date = ? where users_seq = ?";
        try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, userSeq);
            pstat.executeUpdate();
            con.commit();
        }
    }



    public void deleteByUserSeq(int userSeq) throws Exception{
        String sql = "delete from manager where users_seq = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setInt(1, userSeq);
            statement.executeUpdate();
            connection.commit();
        }
    }






}
