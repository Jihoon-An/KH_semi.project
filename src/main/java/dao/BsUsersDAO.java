package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import dto.BsUsersDTO;

import dto.UserDTO;

public class BsUsersDAO extends Dao {
		
	private BsUsersDAO() {
		super();
	}

	private static BsUsersDAO instance;

	synchronized public static BsUsersDAO getInstance() {
		if (instance == null) {
			instance = new BsUsersDAO();
		}
		return instance;
	}
	

	/**
	 * 사업자 회원 날짜 오름차순 정렬 출력
	 * @return
	 * @throws Exception
	 */
	public List<BsUsersDTO> selectAll() throws Exception {
		List<BsUsersDTO> result = new ArrayList<>();
		String sql = "select * from bs_users order by bs_signup desc";
		try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
		
				
				   while(rs.next()) {
					   
					   
					   result.add(new BsUsersDTO(rs));
				   	}
				   return result;
			}
	
				
	
	}
	
	
	/**
	 *  관리자 사업자 회원 페이지 회원 검색
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public List<BsUsersDTO> search(String name) throws Exception{
		String sql = "select * from bs_users where bs_name like ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, "%"+name+"%");
			try(ResultSet rs = pstat.executeQuery();){
				List<BsUsersDTO> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new BsUsersDTO(rs));
				}
				return list;
			}
		}
	}
	/**
	 * 삭제 기능 미완성
	 * @param seq
	 * @return
	 * @throws Exception
	 */
	public int delete(int seq) throws Exception{  //byseq
		String sql = "delete from bs_users where seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
	// 아래로 네비바 로직
	public List<BsUsersDTO> selectByRange(int start, int end) throws Exception{ // 한페이지에 출력
		   String sql = "select  * from (select bs_users.*, row_number() over(order by bs_seq desc) rn from bs_users) where rn between ? and ?";
		   try(Connection con = this.getConnection();
				   PreparedStatement pstat = con.prepareStatement(sql);
				){
			   
			   pstat.setInt(1, start);
			   pstat.setInt(2, end);
			   
			   try(ResultSet rs = pstat.executeQuery();){
				
				   List<BsUsersDTO> list = new ArrayList<BsUsersDTO>(); 
				   
				   while(rs.next()) {
					  
					 //하나의 dto만 나오기떄문에 while문 필요x
			 
					   	list.add(new BsUsersDTO(rs));
			   }
				   return list;
			   }
		   
	   }
	}
	
	
	
	public int getRecordCount() throws Exception{ //게시글 갯수반환
			String sql="select count(*) from bs_users";
			
			try(Connection con= this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					ResultSet rs = pstat.executeQuery()){
			rs.next();
			return rs.getInt(1);  //한줄 뽑겠다
			}
			
	}
	
	public String getPageNavi(int currentPage) throws Exception { //페이지 네비
		//총 몇개의 글
		
		int recordTotalCount=this.getRecordCount(); //board 테이블에 총 144개의 글이 있다고 가정
		int recordCountPerPage = 10; //한페이지당 몇개의 글을 보여줄것인가
		int naviCountPerpage =10; //게시판 하단의 page vaigator 가 한번에 몇개씩 보여질지저장
	
		//recordCountPerPage
		//naviCountPerpage 는 dao의 지역변수로 쓰면 안되고 따로 클래스를 만들어 static으로 사용해야함
		
		
		int pageTotalCount=0; //총페이지 갯수
		
		if(recordTotalCount%recordCountPerPage>0) {  //총게시글/ 한페이지 몇개의 글 나머지가 0보다 크면 +1 아니면 그대로 //페이지 총 갯수
			
			pageTotalCount=(recordTotalCount/recordCountPerPage)+1;
		}else {
			pageTotalCount=(recordTotalCount/recordCountPerPage);
		} //전체페이지갯수
		
		//int currentPage =12; //현재 페이지가 12 // 매개변수로존재해야함
		//7 : 1~10
		//15 : 11 ~20
		//28 : 21~30
		//현재 페이지부터 시작 페이지를 얻어서 +9  // 1의 자리를 날리고 1을 끼워넣으면 시작페이지 
		
		if(currentPage<1) { //현재 페이지가 1보다 작다그러면 현재 페이지는 1
			currentPage=1;  
		} else if(currentPage>pageTotalCount) { //현재 페이지가 토탈페이지갯수보다 크면 현재페이지=토탈
			currentPage=pageTotalCount;
		} //보안코드
		
			
		int startNavi=(currentPage-1)/naviCountPerpage * naviCountPerpage +1; 
		int endNavi= startNavi+naviCountPerpage-1;
		//7 : 1~10
		//15 : 11 ~20
		//28 : 21~30
			//int startNavi=(currentPage-1)/10 *10 +1; 
			//1의 자리를 날리고 1을 끼워넣으면 시작페이지  //10의 배수일떈 성립이 안되어서 currentPage-1
			//10페이지를 본다는 기준하에
		 
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;  //네비게이터끝이 토탈 페이지 보다 크면 둘은 같다
		}
		
//		System.out.println("현재 페이지" +currentPage);
//		System.out.println("네비게이터 시작:" + startNavi);
//		System.out.println("네비게이터 끝"+endNavi);
		
		boolean needPrev = true;
		boolean needNext=true;
		
		
		if(startNavi==1) {
			needPrev=false; //스타트 
		}
		if(endNavi==pageTotalCount){
			needNext=false;
		}
		
		StringBuilder sb = new StringBuilder();
		
		if(needPrev) { //왼쪽 화살표가 필요한 상황이면
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/bsUserList.host?cpage="+(startNavi-1)+"'>Previous</a></li>");
			//System.out.println("<");
		}  //이전페이지
		
		for(int i = startNavi; i<= endNavi; i++) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/bsUserList.host?cpage="+i+"'>"+i+"</a></li>");
		//	System.out.println(i+" ");
		}
		
		if(needNext) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/bsUserList.host?cpage="+(endNavi+1)+"'>Next</a></li>");
		//	System.out.println(">");
		} //다음페이지
		
		return sb.toString();
		  /*
		   * int pageTotalCount= (recordTotalCount+9) / recordCountPerPage;
		   * 수정전
		   * recordCountPerPage = 10일때만 해당될겁니다간단하게 페이지당 2페이지보이게하면 저걸로하면 페이지 엄청불어남

		   * 수정후
		   * int pageTotalCount= (recordTotalCount+(recordCountPerPage-1)) / recordCountPerPage;


		   * */
	//	게시글의 갯수 / 한페이지당 보여줄게시글+1=전체페에지 갯수
		
		
			
	}
}


