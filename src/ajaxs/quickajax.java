package ajaxs;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import mvc.command.CommandHandler;
import org.json.JSONException;
import org.json.JSONObject;
import services.QuickService;
import util.Constant;
import util.Directory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class quickajax implements CommandHandler {
    QuickService quickService = new QuickService();
    JSONObject jsonObject = new JSONObject();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        if(type != null){
            if(type.equals("restore")){
                String filename_ = req.getParameter("file");
                String filename = "/resources/files/quick/" + filename_;
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                String url = req.getParameter("url");
                String text = req.getParameter("text");
                return ajaxResult(filename, no, url, text);
            } else if(type.equals("del")){
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                quickService.updateImg(null, no,null,null);
                return ajaxUploadFile();
            }
            return ajaxFail();
        } else {
            Directory directory = new Directory(req.getServletContext().getRealPath("/"), "resources/files/quick");
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
    public String ajaxFail(){
        System.out.println("quickajax err");
        return jsonObject.toString();
    }
    public String ajaxUploadFile() {
        return jsonObject.toString();
    }

    public String ajaxResult(String filename, int no, String url, String text) throws JSONException{
        quickService.updateImg(filename, no, url, text);
        jsonObject.put("filename", filename);
        jsonObject.put("no", no);
        jsonObject.put("url", url);
        jsonObject.put("text", text);
        return jsonObject.toString();
    }
}
