package ajaxs;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import mvc.command.CommandHandler;
import org.json.JSONObject;
import services.NoticeService;
import util.Constant;
import util.Directory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class noticeajax implements CommandHandler {
    NoticeService noticeService = new NoticeService();
    JSONObject jsonObject = new JSONObject();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        if(type != null){
            if(type.equals("save")){
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                String title = req.getParameter("title");
                String file1 = req.getParameter("file[1]");
                String file2 = req.getParameter("file[2]");
                String file3 = req.getParameter("file[3]");
                String file4 = req.getParameter("file[4]");
                String img1 = req.getParameter("img[1]");
                String img2 = req.getParameter("img[2]");
                String img3 = req.getParameter("img[3]");
                String img4 = req.getParameter("img[4]");
                String img5 = req.getParameter("img[5]");
                String img6 = req.getParameter("img[6]");
                String content1 = req.getParameter("content[1]");
                String content2 = req.getParameter("content[2]");
                String content3 = req.getParameter("content[3]");
                String content4 = req.getParameter("content[4]");
                String content5 = req.getParameter("content[5]");
                String content6 = req.getParameter("content[6]");
                noticeService.updateNoticedetail(no, title, file1, file2, file3, file4, img1, img2, img3, img4, img5, img6, content1, content2, content3, content4, content5, content6);
                return jsonObject.toString();
            } else if(type.equals("add")){
                System.out.println("잘 오는데?");
                String title = req.getParameter("title");
                String date = req.getParameter("date");
                String file1 = req.getParameter("file[1]");
                String file2 = req.getParameter("file[2]");
                String file3 = req.getParameter("file[3]");
                String file4 = req.getParameter("file[4]");
                String img1 = req.getParameter("img[1]");
                String img2 = req.getParameter("img[2]");
                String img3 = req.getParameter("img[3]");
                String img4 = req.getParameter("img[4]");
                String img5 = req.getParameter("img[5]");
                String img6 = req.getParameter("img[6]");
                String content1 = req.getParameter("content[1]");
                String content2 = req.getParameter("content[2]");
                String content3 = req.getParameter("content[3]");
                String content4 = req.getParameter("content[4]");
                String content5 = req.getParameter("content[5]");
                String content6 = req.getParameter("content[6]");
                noticeService.addNotice(date, title, file1, file2, file3, file4, img1, img2, img3, img4, img5, img6, content1, content2, content3, content4, content5, content6);
                return jsonObject.toString();
            } else{
                System.out.println("없는 타입 종류이다.(noticeajax)");
                return null;
            }
        } else {
            System.out.println("왜 일로와?");
            Directory directory = new Directory(req.getServletContext().getRealPath("/"), "resources/files/notice");
            if (!directory.isExistFolder()) {
                if (!directory.createFolder()) {
                    /*File Create Error*/
                    System.out.println("디렉토리 생성 에러");
                    return null;
                }
            }
            MultipartRequest multipartRequest = new MultipartRequest(req, directory.getRealPath() + directory.getDirectoryPath(), Constant.IMAGE_SIZE, "utf-8", new DefaultFileRenamePolicy());
            File file = multipartRequest.getFile(multipartRequest.getFileNames().nextElement().toString());
            System.out.println(file);
            return ajaxUploadFile();
        }
    }
    public String ajaxUploadFile() {
        return jsonObject.toString();
    }
}


