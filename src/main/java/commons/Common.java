package commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;

public class Common {

    public static Common getInstance(){
        return new Common();
    }

    /**
     * 패스워드 암호화
     * @param password
     * @return %0128x 로 변환
     */
    public static String getSHA512(String password) {
        String toReturn = null;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-512");
            digest.reset();
            digest.update(password.getBytes("utf8"));
            toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toReturn;
    }

    /**
     * set request,response utf8
     * @param request HttpServletRequest
     * @param response HttpServletResponse
     */
    public static void setUtf8(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf8");
        response.setContentType("text/html;charset=utf8");
    }
}
