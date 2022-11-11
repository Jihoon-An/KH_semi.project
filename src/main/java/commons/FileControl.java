package commons;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;


public class FileControl {

    private int maxSize = 1024 * 1024 * 10;

    /**
     * 기본 최대 파일 사이즈는 10Mb입니다.
     */
    public FileControl() {
    }

    /**
     * 파일의 최대 크기를 정하며 생성
     * @param maxSize Mb단위로 입력.
     */
    public FileControl(int maxSize) {
        this.maxSize = maxSize;
    }

    public int getMaxSize() {
        return maxSize;
    }

    /**
     * 파일의 최대 크기를 정함.
     * @param maxSize Mb단위로 입력.
     */
    public void setMaxSize(int maxSize) {
        this.maxSize = 1024 * 1024 * maxSize;
    }

    /**
     * 파일을 저장함.
     * @param request File을 불러오는 request
     * @param path 파일을 저장할 경로<br>Ex) "/resource/profile"
     * @param paramName request에서 파일을 불러올 parameter 이름
     * @return 저장된 파일의 system name
     * @throws IOException
     */
    public String save(HttpServletRequest request,String path, String paramName) throws IOException {

        //경로 저장
        String savePath = request.getServletContext().getRealPath(path); //런타임 webapp 폴더를 불러옴.
        File fileSavePath = new File(savePath);

        // 폴더 생성
        if (!fileSavePath.exists()) { //find directory
            fileSavePath.mkdir();//make directory
        }
        // 파일 생성
        MultipartRequest multi = new MultipartRequest(request, savePath, this.maxSize, "UTF8", new DefaultFileRenamePolicy());
        String sysName = multi.getFilesystemName(paramName);

        return sysName;
    }


    /**
     * 기존에 있는 파일 지우기
     * @param request 파일이 있는 실시간 경로를 찾기 위한 request
     * @param path 지울 파일이 있는 경로(!not savePath!)<br>Ex) "/resource/profile"
     * @param fileName 지울 파일 이름.
     */
    public void delete(HttpServletRequest request,String path, String fileName){
        String savePath = request.getServletContext().getRealPath(path);
        File file = new File(savePath + "/" + fileName);

        if (file.exists()) {
            file.delete();
        }
    }
}
