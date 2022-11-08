package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.GymDTO;


public class GymDAO extends Dao {
    private GymDAO() {
    }

    private static GymDAO instance;

    synchronized public static GymDAO getInstance() {
        if (instance == null) {
            instance = new GymDAO();
        }
        return instance;
    }

    /**
     * gym 테이블의 모든 컬럼 조회
     *
     * @return List<GymDTO>
     * @throws Exception
     */
    public List<GymDTO> selectAll() throws Exception {
        String sql = "select * from gym";
        List<GymDTO> result = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {

            ResultSet rs = pstat.executeQuery();

            while (rs.next()) {
                result.add(new GymDTO(rs));
            }
        }
        return result;
    }

    /**
     * 검색 조건에 맞는 gym 테이블 컬럼 조회
     *
     * @return List<GymDTO>
     * @throws Exception
     */
    public List<GymDTO> selectBySearch(String searchInput) throws Exception {
        String sql = "select * from gym where gym_name = ? or gym_location like ?";
        List<GymDTO> result = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setString(1, searchInput);
            pstat.setString(2, "%" + searchInput + "%");

            ResultSet rs = pstat.executeQuery();

            while (rs.next()) {
                result.add(new GymDTO(rs));
            }
            return result;
        }
    }


    /**
     * 헬스장 정보 출력
     *
     * @param gym_seq 헬스장 gym_seq 를 기준으로 출력
     * @return
     * @throws Exception
     */
    public GymDTO printGym(int gym_seq) throws Exception {

        String sql = "select * from gym where gym_seq =? ";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);

        ) {

            pstat.setInt(1, gym_seq);
            try (ResultSet rs = pstat.executeQuery();) {

                if (rs.next()) {
                    GymDTO dto = new GymDTO(rs);

                    return dto;
                } else {
                    return null;
                }
            }
        }
    }

    /*
     * 관리자 페이지 시설 갯수 // 반복문써야될거 같은데..
     * @param bs_seq
     * @return
     * @throws Exception
     */
//    public int gymCount(int bs_seq) throws Exception{
//    	String sql="select count(*) from gym group by bs_seq having bs_seq = ?";
//    	int count = 0;
//    	 try (Connection con = this.getConnection();
//                 PreparedStatement pstat = con.prepareStatement(sql);
//
//            ) {
//    		 pstat.setInt(1, bs_seq);
//    		 
//    		 try(ResultSet rs = pstat.executeQuery();){
//    			 //if(rs.next)
//    		 }
//    		 
//    	 }
//    			
//    }

    /**
     * 사업자 회원가입시 시설 추가
     *
     * @param dto
     * @return
     * @throws Exception
     */
    public int addGYM(GymDTO dto) throws Exception {

        String sql = "insert into gym values(gym_seq.nextval,?,?,?,?,null,null,null,null,?,?)";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setInt(1, dto.getBs_seq());
            pstat.setString(2, dto.getGym_name());
            pstat.setString(3, dto.getGym_phone());
            pstat.setString(4, dto.getGym_location());
            pstat.setString(5, dto.getGym_x());
            pstat.setString(6, dto.getGym_y());

            con.commit();

            return pstat.executeUpdate();
        }
    }


//public List<GymDTO> printGym2() throws Exception{   //test
//	
//	String sql="select * from gym ";
//	  try(Connection con = this.getConnection();
//			   PreparedStatement pstat = con.prepareStatement(sql);
//			  ResultSet rs = pstat.executeQuery();
//			){
//		  
//	
//		   List<GymDTO> list = new ArrayList();
//		   
//
//			   while(rs.next()) {
//				   GymDTO dto = new GymDTO();
//				   dto.setGym_seq(rs.getInt("gym_seq"));
//				   dto.setBs_seq(rs.getInt("bs.seq"));
//				   dto.setGym_name(rs.getString("gym_name"));
//				   dto.setGym_phone(rs.getString("gym_phone"));
//				   dto.setGym_location(rs.getString("gym_location"));
//				   dto.setGym_price(rs.getInt("gym_price"));
//				   dto.setManager_name(rs.getString("manager_name"));
//				   dto.setManager_phone(rs.getString("manager_phone"));
//				   dto.setManager_email(rs.getString("manager_email"));
//				   list.add(dto);
//		 
//		   }
//			   return list;
//		
//	   }
//	  }


}

