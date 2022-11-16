package dao;

import dto.ExerciseDTO;
import dto.WeightDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class ExerciseDAO extends Dao{

    private ExerciseDAO() {
        super();
    }

    private static ExerciseDAO instance;

    synchronized public static ExerciseDAO getInstance() {
        if (instance == null) {
            instance = new ExerciseDAO();
        }
        return instance;
    }

    /**
     * 입력한 inbody데이터 차트로 변환
     * @param exr_seq
     * @return
     * @throws Exception
     */
    public List<ExerciseDTO> inbodyChartInfo(int userSeq)throws Exception{
    	String sql = "select inbody_weight, inbody_bfm, inbody_bmi, inbody_sm from exercise where user_seq = ?";
    
    	try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
    			){
    		pstat.setInt(1, userSeq);
    		 
    		List<ExerciseDTO> list = new ArrayList<>();
    		try(ResultSet rs = pstat.executeQuery();){
    			
    			while(rs.next()) {
    				ExerciseDTO dto = new ExerciseDTO();
    				dto.setInbody_weight(rs.getString("inbody_weight"));
    				dto.setInbody_bfm(rs.getString("inbody_bfm"));
    				dto.setInbody_bmi(rs.getString("inbody_bmi"));
    				dto.setInbody_sm(rs.getString("inbody_sm"));
    				list.add(dto);
    		}    			
    			return list;
    		}
    	}
    }
    
    public void insertWeight(WeightDTO wet) throws Exception{
    	String sql = "insert into weight values(user_seq.nextval,?,?)";
    	
    	try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
    			){
    		pstat.setString(1, wet.getWeight());
    		pstat.setTimestamp(2, wet.getWeight_date());
    		
    		int result = pstat.executeUpdate();
    		con.commit();
    	}
    	
    }
    
    public List<WeightDTO> selectWeightAll(int user_seq) throws Exception{
    	String sql = "selcet * from weight where user_seq = ?";
    	
    	List<WeightDTO> result = new ArrayList<>();
    	
    	try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
    			){
    		pstat.setInt(1, user_seq);
    		
    		try(ResultSet rs = pstat.executeQuery();){
    			while(rs.next()) {
    				result.add(new WeightDTO(rs));
    				
    			}
    		}
    		return result;
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

    public void insertRecord(ExerciseDTO exr) throws Exception {
        String sql = "insert into exercise values(exr_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setTimestamp(1, exr.getExr_date());
            pstat.setInt(2, exr.getUser_seq());
            pstat.setString(3, exr.getExr_memo());
            pstat.setInt(4, exr.getExr_how());
            pstat.setString(5, exr.getExr_intensity());
            pstat.setString(6, exr.getInbody_weight());
            pstat.setString(7, exr.getInbody_bfm());
            pstat.setString(8, exr.getInbody_bmi());
            pstat.setString(9, exr.getInbody_sm());

            int result = pstat.executeUpdate();
            con.commit();
        }
    }

    public void deleteByDate(String userSeq, String date) throws Exception{
        String sql = "delete from exercise where user_seq = ? and exr_date = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setString(1, userSeq);
            statement.setString(2, date);
            statement.executeUpdate();

            connection.commit();
        }
    }

    public List<ExerciseDTO> selectByOption(String option, String value) throws Exception {
        List<ExerciseDTO> result = new ArrayList<>();
        String sql = "select * from exercise where " + option + " = ? order by exr_date";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);)
        {
            pstat.setString(1, value);
            try(ResultSet rs = pstat.executeQuery();) {
                while (rs.next()) {
                    result.add(new ExerciseDTO(rs));
                }
                return result;
            }
        }
    }


    public List<ExerciseDTO> selectRecentByDate(String userSeq, String date) throws Exception {
        List<ExerciseDTO> result = new ArrayList<>();
        String sql = "select * from (select * from exercise order by exr_date desc) where rownum <= 7 and user_seq = ? and exr_date <= ? order by exr_date";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);)
        {
            pstat.setString(1, userSeq);
            pstat.setString(2, date);
            try(ResultSet rs = pstat.executeQuery();) {
                while (rs.next()) {
                    result.add(new ExerciseDTO(rs));
                }
                return result;
            }
        }
    }

    public ExerciseDTO selectByDate(String userSeq, String date) throws Exception {
        String sql = "select * from exercise where user_seq = ? and exr_date = ?";
        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);)
        {
            pstat.setString(1, userSeq);
            pstat.setString(2, date);
            try(ResultSet rs = pstat.executeQuery();) {
                return rs.next() ? new ExerciseDTO(rs) : null;
            }
        }
    }
//    public ExerciseDTO selectInbodyByDate(String userSeq, String date) throws Exception {
//        String sql = "select inbody_weight, inbody_bfm, inbody_bmi, inbody_sm from exercise where user_seq = ? and exr_date = ?";
//        try (Connection con = getConnection();
//             PreparedStatement pstat = con.prepareStatement(sql);)
//        {
//            pstat.setString(1, userSeq);
//            pstat.setString(2, date);
//            try(ResultSet rs = pstat.executeQuery();) {
//                return rs.next() ? new ExerciseDTO(rs) : null;
//            }
//        }
//    }
}
