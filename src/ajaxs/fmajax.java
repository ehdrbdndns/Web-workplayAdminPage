package ajaxs;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import mvc.command.CommandHandler;
import org.json.JSONException;
import org.json.JSONObject;
import services.FmService;
import util.Constant;
import util.Directory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class fmajax implements CommandHandler {
    JSONObject jsonObject = new JSONObject();
    FmService fmService = new FmService();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        if(type != null){
            if(type.equals("upload")) {
                String filename_ = req.getParameter("file");
                String filename = "/resources/files/facility/" + filename_;
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                return ajaxResult(filename, no);
            } else
                return jsonObject.toString();
        } else {
            Directory directory = new Directory(req.getServletContext().getRealPath("/"), "resources/files/facility");
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

    public String ajaxResult(String filename, int no) throws JSONException {
        fmService.updateFm_i(no, filename);
        jsonObject.put("no", no);
        jsonObject.put("filename", filename);
        return jsonObject.toString();
    }
}
