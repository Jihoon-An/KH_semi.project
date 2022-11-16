package commons;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.MulticastChannel;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;


public class FileControl {

    private int maxSize = 1024 * 1024 * 10;
    private MultipartRequest multi;

    List<String> sysNameList = new ArrayList<>();

    /**
     * 기본 최대 파일 사이즈는 10Mb입니다.
     */
    public FileControl() {
    }

    /**
     * 파일의 최대 크기를 정하며 생성
     *
     * @param maxSize Mb단위로 입력.
     */
    public FileControl(int maxSize) {
        this.maxSize = maxSize;
    }

    public int getMaxSize() {
        return maxSize;
    }

    public List<String> getSysNameList() {
        return sysNameList;
    }

    public void setSysNameList(List<String> sysNameList) {
        this.sysNameList = sysNameList;
    }

    /**
     * 파일의 최대 크기를 정함.
     *
     * @param maxSize Mb단위로 입력.
     */
    public void setMaxSize(int maxSize) {
        this.maxSize = 1024 * 1024 * maxSize;
    }

    public MultipartRequest getMulti() {
        return multi;
    }

    public void setMulti(MultipartRequest multi) {
        this.multi = multi;
    }

    /**
     * 파일을 저장함.
     *
     * @param request   File을 불러오는 request
     * @param path      파일을 저장할 경로<br>Ex) "/resource/profile"
     * @param paramName request에서 파일을 불러올 parameter 이름
     * @return 저장된 파일의 system name
     * @throws IOException
     */
    public String save(HttpServletRequest request, String path, String paramName) throws IOException {

        //경로 저장
        String savePath = request.getServletContext().getRealPath(path); //런타임 webapp 폴더를 불러옴.
        File fileSavePath = new File(savePath);

        // 폴더 생성
        if (!fileSavePath.exists()) { //find directory
            fileSavePath.mkdir();//make directory
        }
        // 파일 생성
        this.multi = new MultipartRequest(request, savePath, this.maxSize, "UTF8", new DefaultFileRenamePolicy());
        String sysName = multi.getFilesystemName(paramName);

        return sysName;
    }


    /**
     * <h2>여러 파일일 경우 파일을 저장</h2>
     *
     * @param request
     * @param path
     * @return 저장에 성공한 파일들의 리스트 0번은 대표이미지, 1~ 시설 이미지
     * @throws IOException
     */
    public List<String> saves(HttpServletRequest request, String path) throws IOException {

        //경로 저장
        String savePath = request.getServletContext().getRealPath(path); //런타임 webapp 폴더를 불러옴.
        File fileSavePath = new File(savePath);

        // 폴더 생성
        if (!fileSavePath.exists()) { //find directory
            fileSavePath.mkdir();//make directory
        }
        // 파일 생성
        this.multi = new MultipartRequest(request, savePath, this.maxSize, "UTF8", new DefaultFileRenamePolicy());

        Enumeration fileNames = multi.getFileNames();

        while (fileNames.hasMoreElements()) {
            String parameter = (String) fileNames.nextElement();
            String sysName = multi.getFilesystemName(parameter);

            if (sysName == null) {
                continue;
            }
            if (!sysName.endsWith(".jpg") && !sysName.endsWith(".jpeg") && !sysName.endsWith(".png") &&
                    !sysName.endsWith(".bmp") && !sysName.endsWith(".pdf") && !sysName.endsWith(".gif")) {
                // 허용하지 않는 파일 삭제
                File file = new File(savePath + "/" + sysName);
                file.delete();
            } else {
                // 허용하는 파일 리스트에 추가
                this.sysNameList.add(sysName);
            }
        }
        Collections.reverse(this.sysNameList);
        return this.sysNameList;
    }


    /**
     * 기존에 있는 파일 지우기
     *
     * @param request  파일이 있는 실시간 경로를 찾기 위한 request
     * @param path     지울 파일이 있는 경로(!not savePath!)<br>Ex) "/resource/profile"
     * @param fileName 지울 파일 이름.
     */
    public void delete(HttpServletRequest request, String path, String fileName) {
        String savePath = request.getServletContext().getRealPath(path);
        File file = new File(savePath + "/" + fileName);

        if (file.exists()) {
            file.delete();
        }
    }
}
