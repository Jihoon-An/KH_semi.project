package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.BsCtfcDTO;
import dto.BsUsersDTO;

public class BsCtfcDAO extends Dao {

//	private BsCtfcDAO() {
//		super();
//	}
//
//	public static BsCtfcDAO getInstance() {
//		return (BsCtfcDAO) Dao.getInstance();
//	}

	
	private static BsCtfcDAO instance;

	synchronized public static BsCtfcDAO getInstance() {
		if (instance == null) {
			instance = new BsCtfcDAO();
		}
		return instance;
	}

	/**
	 * <h1>사업증 이미지 테이블 가져오기</h1>
	 * BsSeq로 그에 대응하는 하나의 데이터를 불러옴.
	 * @param bsSeq
	 * @return BsCtfcDTO
	 * @throws Exception
	 */
	public BsCtfcDTO getByBsSeq(int bsSeq) throws Exception{
		String sql = "select * from bs_ctfc where bs_seq = ?";
		try (Connection con = this.getConnection();
			 PreparedStatement statement = con.prepareStatement(sql)
		) {
			statement.setInt(1, bsSeq);
			try(ResultSet rs = statement.executeQuery();){
				if(rs.next()) {
					return new BsCtfcDTO(rs);
				}else{
					return new BsCtfcDTO();
				}
			}
		}
	}


	/**
	 * insert (신규 데이터 생성)
	 * @param dto BsCtfcDTO
	 * @return 쿼리 성공 결과
	 * @throws Exception
	 */
	public int uploadBsCtfc(BsCtfcDTO dto) throws Exception {
		String sql = "insert into bs_ctfc values(?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, dto.getBsSeq());
			pstat.setString(2, dto.getBsNumber());
			pstat.setString(3, dto.getSysName());
			con.commit();
			return pstat.executeUpdate();
		}
	}

	/**
	 * bsSeq로 사업자 번호를 수정
	 * @param bsCtfc
	 * @throws Exception
	 */
	public void updateBsNum(BsCtfcDTO bsCtfc) throws Exception{
		String sql = "update bs_ctfc set bs_number = ? where bs_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
		){
			statement.setString(1, bsCtfc.getBsNumber());
			statement.setInt(2, bsCtfc.getBsSeq());

			statement.executeUpdate();
			con.commit();
		}
	}

	/**
	 * bsSeq로 사업자 등록증의 system name을 수정함.
	 * @param bsCtfc
	 * @throws Exception
	 */
	public void updateSysName(BsCtfcDTO bsCtfc) throws Exception {
		String sql = "update bs_ctfc set bs_regi_sys = ? where bs_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement statement = con.prepareStatement(sql);
		){
			statement.setString(1, bsCtfc.getSysName());
			statement.setInt(2, bsCtfc.getBsSeq());

			statement.executeUpdate();
			con.commit();
		}
	}
}
