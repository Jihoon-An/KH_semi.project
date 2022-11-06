package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import commons.Common;
import dto.UserDTO;

public class UserDAO extends Dao {

    private UserDAO() {
        super();
    }

    private static UserDAO instance;

    synchronized public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    /**
     * users 테이블의 모든 컬럼 조회
     *
     * @return List<UserDTO>
     * @throws Exception
     */
    public List<UserDTO> selectAll() throws Exception {
        List<UserDTO> result = new ArrayList<>();
        String sql = "select * from users";
        try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                result.add(new UserDTO(rs));
            }
            return result;
        }
    }

    /**
     * 일반 user의 seq로 해당 user의 모든 데이터를 불러옵니다. 데이터가 null exception이 나오면 문의해주세요
     * - 지훈 -
     *
     * @param seq users_seq
     * @return
     * @throws Exception
     */
    public UserDTO selectBySeq(int seq) throws Exception {
        String sql = "select * from users where users_seq = ?";
        try (Connection con = getConnection(); PreparedStatement prepareStatement = con.prepareStatement(sql);) {
            prepareStatement.setInt(1, seq);
            try (ResultSet resultSet = prepareStatement.executeQuery();) {
                if (resultSet.next()) {
                    UserDTO result = new UserDTO(resultSet);
                    return result;
                } else {
                    return null;
                }
            }
        }
    }

    /**
     * users 테이블에서 입력받은 name과 phone이 일치하는 row 조회
     *
     * @param name
     * @param phone
     * @return String / null
     * @throws Exception
     */
    public String searchId(String name, String phone) throws Exception {
        String sql = "select users_email from users where users_name = ? and users_phone = ?";
        try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, name);
            pstat.setString(2, phone);
            ResultSet rs = pstat.executeQuery();
            return rs.next() ? rs.getString("users_email") : null;
        }
    }

    /**
     * users 테이블에서 입력받은 email과 phone이 일치하는 row 조회
     *
     * @param email
     * @param phone
     * @return boolean
     * @throws Exception
     */
    public boolean searchPw(String email, String phone) throws Exception {
        String sql = "select users_email from users where users_email = ? and users_phone = ?";
        try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, email);
            pstat.setString(2, phone);
            ResultSet rs = pstat.executeQuery();
            return rs.next();
        }
    }

    /**
     * users 테이블에서 option의 value가 일치하는 모든 컬럼을 조회
     *
     * @param option
     * @param value
     * @return List<UserDTO>
     * @throws Exception
     */
    public List<UserDTO> searchAll(String option, String value) throws Exception {
        List<UserDTO> result = new ArrayList<>();
        String sql = "select * from users where " + option + " = ?";
        try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, value);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                result.add(new UserDTO(rs));
            }
            return result;
        }
    }

    /**
     * 유저 회원가입 이메일 중복 확인
     *
     * @param email
     * @return
     * @throws Exception
     */
    public boolean isUserEmailCheck(String email) throws Exception {
        String sql = "select * from users where users_email = ?";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setString(1, email);

            try (ResultSet rs = pstat.executeQuery();) {
                return rs.next();
            }

        }
    }


    /**
     * 유저 회원가입
     *
     * @param email
     * @param pw
     * @param phone
     * @return
     * @throws Exception
     */
    public int isUserSignUp(String email, String pw, String phone) throws Exception {

        String sql = "insert into users values(users_seq.nextval,?,?,null,?,null,sysdate,null,null)";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

            pstat.setString(1, email);
            pstat.setString(2, pw);
            pstat.setString(3, phone);

            int result = pstat.executeUpdate();
            con.commit();

            return result;
        }
    }

    /**
     * 관리자 페이지 회원검색
     *
     * @param name
     * @return
     * @throws Exception
     */
    public List<UserDTO> searchUser(String name) throws Exception {
        String sql = "select * from users where users_name like ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
        ) {
            pstat.setString(1, "%" + name + "%");
            try (ResultSet rs = pstat.executeQuery();) {
                List<UserDTO> list = new ArrayList<>();
                while (rs.next()) {
                    list.add(new UserDTO(rs));
                }
                return list;
            }
        }
    }

    /**
     * 프로필 수정
     * 수정목록 : 이름, 생일, 전화번호, 성별, 관심사
     *
     * @param user
     * @throws Exception
     */
    public void updateProfileInfo(UserDTO user) throws Exception {
        String sql = "update users set " +
                "users_name = ?," +
                "users_birthday = ?," +
                "users_phone = ?," +
                "sex = ?," +
                "interest = ? " +
                "where users_seq = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getBirthday());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getSex());
            statement.setString(5, user.getInterest());
            statement.setInt(6, user.getSeq());

            statement.executeUpdate();
            connection.commit();
        }
    }

    /**
     * 비밀번호 변경
     * @param userSeq
     * @param pw 암호화 전의 PW
     * @throws Exception
     */
    public void updatePw(int userSeq, String pw) throws Exception {
        String sql = "update users set users_pw = ? where users_seq = ?";
        String password = Common.getSHA512(pw);
        try (Connection connection = this.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
        ) {
            statement.setString(1, password);
            statement.setInt(2, userSeq);

            statement.executeUpdate();
            connection.commit();
        }
    }

    public void deleteByUserSeq(int userSeq) throws Exception{
        String sql = "delete from users where users_seq = ?";
        try(Connection connection = this.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
        ){
            statement.setInt(1, userSeq);
            statement.executeUpdate();

            connection.commit();
        }
    }
}
