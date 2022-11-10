package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dto.FavoritesDTO;
import dto.GymDTO;
import dto.ReviewDTO;
import dto.UserDTO;

import javax.xml.transform.Result;


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
             PreparedStatement pstat = con.prepareStatement(sql);
             ResultSet rs = pstat.executeQuery();) {


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
    public List<GymDTO> selectBySearch(String searchInput, String open, String locker, String shower, String park) throws Exception {
        String sql = "select * from gym g join gym_filter f on g.gym_seq = f.gym_seq" +
                " where (gym_name like ? or gym_location like ?)" +
                " and not open = ? and not locker = ? and not shower = ? and not park = ?";
        List<GymDTO> result = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setString(1, "%" + searchInput + "%");
            pstat.setString(2, "%" + searchInput + "%");
            pstat.setString(3, open);
            pstat.setString(4, locker);
            pstat.setString(5, shower);
            pstat.setString(6, park);

            try (ResultSet rs = pstat.executeQuery();) {

                while (rs.next()) {
                    result.add(new GymDTO(rs));
                }
                return result;
            }
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
                    return new GymDTO();
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
    public int addGym(GymDTO dto) throws Exception {

        String sql = "insert into gym values(?,?,?,?,?,null,null,null,null,?,?)";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setInt(1, dto.getGym_seq());
            pstat.setInt(2, dto.getBs_seq());
            pstat.setString(3, dto.getGym_name());
            pstat.setString(4, dto.getGym_phone());
            pstat.setString(5, dto.getGym_location());
            pstat.setString(6, dto.getGym_x());
            pstat.setString(7, dto.getGym_y());

            con.commit();

            return pstat.executeUpdate();
        }
    }

    /**
     * 사업자 회원가입시 seq 단 한번만 만들어서 시설정보에 gym_seq 추가하기 위함
     *
     * @return
     * @throws Exception
     */
    public int getGymSeqNextVal() throws Exception {
        String sql = "select gym_seq.nextval from dual";


        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
             ResultSet rs = pstat.executeQuery()) {
            rs.next();

            return rs.getInt(1);
        }

    }

    public List<GymDTO> getGymByBsSeq(int bsSeq) throws Exception {
        List<GymDTO> gymList = new ArrayList<>();
        String sql = "select * from gym where bs_seq = ?";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, bsSeq);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    gymList.add(new GymDTO(rs));
                }
                return gymList;
            }
        }
    }


    /**
     * BsSeq에 해당하는 데이터 삭제
     * @param bsSeq
     * @throws Exception
     */
    public void deleteByBsSeq(int bsSeq) throws Exception {
        String sql = "delete from gym where bs_seq = ?";
        try (Connection con = this.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, bsSeq);
            statement.executeUpdate();

            con.commit();
        }
    }



    public void modifyGym(GymDTO gymDto) throws Exception {
        String sql = "update gym set "
                   + "gym_name = ?, "
                   + "gym_phone = ?, "
                   + "gym_price = ?, "
                   + "gym_open = ?, "
                   + "gym_close = ?, "
                   + "gym_location = ?, "
                   + "gym_x = ?, "
                   + "gym_y = ?, "
                   + "gym_main_sysImg = ?"
                   + "where gym_seq = ?";

        try (Connection con = this.getConnection();
                PreparedStatement pstat = con.prepareStatement(sql);) {


        }
    }






}

