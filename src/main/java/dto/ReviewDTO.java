package dto;

import java.io.File;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.GymDAO;

public class ReviewDTO {

	private int review_seq;
	private int user_seq;
	private int gym_seq;
	private String gym_name;


	private String users_email;

	private int bs_seq;
	private String review_writer;
	private String review_contents;
	private int review_like;
	private Timestamp review_writer_date;
	private String review_check1;
	private String review_check2;
	private String review_check3;
	private String review_check4;
	private String review_check5;
	private int review_star;
	private String review_photo;


	public ReviewDTO() {
	}

    public ReviewDTO(ResultSet resultSet) throws Exception {
        this.review_seq = resultSet.getInt("review_seq");
        this.user_seq = resultSet.getInt("user_seq");
        this.gym_seq = resultSet.getInt("gym_seq");
        this.bs_seq = resultSet.getInt("bs_seq");
        this.review_writer = resultSet.getString("review_writer");
        this.review_contents = resultSet.getString("review_contents");
        this.review_star = resultSet.getInt("review_star");
        this.review_like = resultSet.getInt("review_like");
        this.review_writer_date = resultSet.getTimestamp("review_writer_date");
        this.review_check1 = resultSet.getString("review_check1");
        this.review_check2 = resultSet.getString("review_check2");
        this.review_check3 = resultSet.getString("review_check3");
        this.review_check4 = resultSet.getString("review_check4");
        this.review_check5 = resultSet.getString("review_check5");
		this.review_photo = resultSet.getString("review_photo");
	}

	public ReviewDTO(int review_seq) {
		this.review_seq = review_seq;
	}


	public ReviewDTO(HttpServletRequest request) throws Exception {

		String savePath = request.getServletContext().getRealPath("/resource/review"); //런타임 webapp 폴더를 불러옴.
		File fileSavePath = new File(savePath);

		// 폴더 생성
		if (!fileSavePath.exists()) { //find directory
			fileSavePath.mkdir();//make directory
		}
		// 파일 생성
		MultipartRequest multi = new MultipartRequest(request, savePath, 1024 * 1024 * 10, "UTF8", new DefaultFileRenamePolicy());

		this.user_seq = (Integer) request.getSession().getAttribute("userSeq");
		this.gym_seq = Integer.parseInt(multi.getParameter("gym_seq"));
		this.bs_seq = GymDAO.getInstance().printGym(this.gym_seq).getBs_seq();
		this.review_writer = randomNickName();
		this.review_contents = multi.getParameter("review_contents");
		this.review_star = Integer.parseInt(multi.getParameter("review_star"));
		this.review_check1 = multi.getParameter("review_check1");
		this.review_check2 = multi.getParameter("review_check2");
		this.review_check3 = multi.getParameter("review_check3");
		this.review_check4 = multi.getParameter("review_check4");
		this.review_check5 = multi.getParameter("review_check5");
		this.review_photo = multi.getFilesystemName("review_photo");
	}

	public String getReview_photo() {
		return review_photo;
	}

	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}


	public void setUsers_email(String users_email) { this.users_email = users_email; }
	public String getUsers_email() { return users_email;}
	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getGym_seq() {
		return gym_seq;
	}

	public void setGym_seq(int gym_seq) {
		this.gym_seq = gym_seq;
	}

	public int getBs_seq() {
		return bs_seq;
	}

	public void setBs_seq(int bs_seq) {
		this.bs_seq = bs_seq;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public int getReview_like() {
		return review_like;
	}

	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}

	public Timestamp getReview_writer_date() {
		return review_writer_date;
	}

	public void setReview_writer_date(Timestamp review_writer_date) {
		this.review_writer_date = review_writer_date;
	}

	public String getReview_check1() {
		return review_check1;
	}

	public void setReview_check1(String review_check1) {
		this.review_check1 = review_check1;
	}

	public String getReview_check2() {
		return review_check2;
	}

	public void setReview_check2(String review_check2) {
		this.review_check2 = review_check2;
	}

	public String getReview_check3() {
		return review_check3;
	}

	public void setReview_check3(String review_check3) {
		this.review_check3 = review_check3;
	}

	public String getReview_check4() {
		return review_check4;
	}

	public void setReview_check4(String review_check4) {
		this.review_check4 = review_check4;
	}

	public String getReview_check5() {
		return review_check5;
	}

	public void setReview_check5(String review_checkS) {
		this.review_check5 = review_checkS;
	}

	public String getFormDate() {

		long writeTime = this.review_writer_date.getTime();
		long currentTime = System.currentTimeMillis();

		// System.currentTimeMillis()
		// 1970년 1월 1일부터 경과한 시간을 long값으로 리턴 1/1000 초값을리턴
		long timeGap = currentTime - writeTime;
//		System.out.println(timeGap);

		if (timeGap < 60 * 1000) {
			return "1분 이내";
		} else if (timeGap < 300 * 1000) {
			return "5분 이내";
		} else if (timeGap < 3600 * 1000) {
			return "1시간 이내";
		} else if (timeGap < 86400 * 1000) {
			return "24시간 이내";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시");
			// SimpleDateFormat sdf = new SimpleDateFormat("MM월dd일 hh시mm분");
			return sdf.format(writeTime);
		}
	}

	private String randomNickName() {
		List<String> adjective = Arrays.asList("귀여운", "너그러운", "동그란", "뛰어난", "멋진", "무서운", "반가운", "밝은", "부드러운", "힘찬", "한결같은",
				"짓궂은", "조그만", "점잖은", "젊은", "재미있는", "잘생긴", "예쁜", "작은", "큰", "커다란", "언짢은", "올바른", "외로운", "어린", "아름다운", "빠른",
				"수다스러운", "쏜살같은", "수줍은", "서툰", "가냘픈", "정직한", "다정한", "사려깊은", "로맨틱한", "느긋한", "자신감있는", "다감한", "애교있는", "친절한",
				"이해심많은", "순진한", "긍정적인");
		List<String> name = Arrays.asList("너구리", "코끼리", "호랑이", "사자", "기린", "고양이", "강아지", "송아지", "뱀", "파랑새", "앵무새", "다람쥐",
				"타조", "악어", "개구리", "공룡", "원숭이", "곰", "하마", "여우", "늑대", "얼룩말", "표범", "토끼", "사슴", "양", "팬더", "캥거루", "낙타",
				"쥐", "독수리", "고슴도치", "펭귄", "나비", "개미", "고래", "거북이", "부엉이", "오리", "병아리", "기러기", "코뿔소", "비둘기", "두더지",
				"개미핥기", "고릴라", "족제비", "고라니", "참새", "순록", "알파카", "치타", "라마", "닭", "공작새", "백조", "학", "갈매기");
		Collections.shuffle(adjective);
		Collections.shuffle(name);
		return adjective.get(0) + " " + name.get(0);
	}

}
