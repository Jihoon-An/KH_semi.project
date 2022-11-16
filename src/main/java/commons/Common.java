package commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;

public class Common {

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


    public String getNavi(String type, String search, int currentPage, int recordTotalCount) throws Exception {
        int recordCountPerPage = 10;
        int naviCountPerPage = 10;
        int pageTotalCount = 0;
        if (recordTotalCount % recordCountPerPage > 0) {
            pageTotalCount = (recordTotalCount / recordCountPerPage) + 1;
        } else {
            pageTotalCount = (recordTotalCount / recordCountPerPage);
        }
        if (currentPage < 1) {
            currentPage = 1;
        }
        if (currentPage > pageTotalCount) {
            currentPage = pageTotalCount;
        }
        int startNavi = (currentPage - 1) / recordCountPerPage * recordCountPerPage + 1;
        int endNavi = startNavi + naviCountPerPage - 1;
        if (endNavi > pageTotalCount) {
            endNavi = pageTotalCount;
        }
        boolean needPrev = true;
        boolean needNext = true;
        if (startNavi == 1) {
            needPrev = false;
        }
        if (endNavi == pageTotalCount) {
            needNext = false;
        }
        StringBuilder sb = new StringBuilder();
        if (needPrev) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewSearch.host?cpage=" + (startNavi - 1)
                    + "'>Previous</a></li>");
        }
        for (int i = startNavi; i <= endNavi; i++) {
            if (currentPage == i) {
                sb.append("<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\" href=\"/reviewSearch.host?cpage=" + i + "&type=" + type + "&search=" + search + "\">" + i
                        + "</a></li>");
            } else {
                sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"/reviewSearch.host?cpage=" + i + "&type=" + type + "&search=" + search + "\">" + i
                        + "</a></li>");
            }
        }
        if (needNext) {
            sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/reviewSearch.host?cpage=" + (endNavi + 1) + "&type=" + type + "&search=" + search
                    + "'>Next</a></li>");
        }
        return sb.toString();
    }
}
