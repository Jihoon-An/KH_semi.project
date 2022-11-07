package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dto.BsCtfcDTO;

public class BsCtfcDAO extends Dao {

	private BsCtfcDAO() {
		super();
	}

	public static BsCtfcDAO getInstance() {
		return (BsCtfcDAO) Dao.getInstance();
	}

//	private static BsCtfcDAO instance;

//	synchronized public static BsCtfcDAO getInstance() {
//		if (instance == null) {
//			instance = new BsCtfcDAO();
//		}
//		return instance;
//	}

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
	
}
