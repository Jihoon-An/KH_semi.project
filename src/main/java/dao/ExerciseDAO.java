package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dto.ExerciseDTO;

public class ExerciseDAO extends Dao{

    private ExerciseDAO() {
        super();
    }

    public static ExerciseDAO getInstance(){
        return (ExerciseDAO) Dao.getInstance();
    }

    /**
     * Exr_seq로 Exercise 테이블 불러오기
     * @param exr_seq
     * @return ExerciseDTO
     * @throws Exception
     */
    public List<ExerciseDTO> selectAll(int exr_seq) throws Exception{
    	String sql = "select * from exercise where exr_seq = ?";
    	try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
    		pstat.setInt(1, exr_seq);
    		
    		ResultSet rs = pstat.executeQuery();
    		List<ExerciseDTO> list = new ArrayList<>();
    		while(rs.next()) {
    			ExerciseDTO dto = new ExerciseDTO();
    			dto.setExr_seq(rs.getInt("exr_seq"));
    			dto.setCal_seq(rs.getInt("cal_seq"));
    			dto.setCal_date(rs.getTimestamp("cal_date"));
    			dto.setUser_seq(rs.getInt("user_seq"));
    			dto.setExr_memo(rs.getString("exr_memo"));
    			dto.setExr_how(rs.getInt("exr_how"));
    			dto.setExr_intensity(rs.getString("exr_intensity"));
    			dto.setInbody_weight(rs.getString("inbody_weight"));
    			dto.setInbody_bfm(rs.getString("inbody_bfm"));
    			dto.setInbody_bmi(rs.getString("inbody_bmi"));
    			dto.setInbody_sm(rs.getString("inbody_sm"));
    			list.add(dto);
    		}
    		return list;
    	}
    }
    /**
     * 입력한 inbody데이터 차트로 변환
     * @param exr_seq
     * @return
     * @throws Exception
     */
    public HashMap<String, Object>InbodyChartInfo(int exr_seq)throws Exception{
    	String sql = "select inbody_weight, inbody_bfm, inbody_bmi, inbody_sm from exercise where exr_seq = ?;";
    
    	try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
    			){
    		pstat.setInt(1, exr_seq);
    		
    		HashMap<String, Object> date = new HashMap<>();
    		ResultSet rs = pstat.executeQuery();
    		while(rs.next()) {
    			date.put("exr_seq", rs.getString("exr_seq"));
    			date.put("weight",rs.getString("inbody_weight"));
    			date.put("bfm",rs.getString("inbody_bfm"));
    			date.put("bmi",rs.getString("inbody_bmi"));
    			date.put("sm",rs.getString("inbody_sm"));
    			
    		}
    		return date;
    	}
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
