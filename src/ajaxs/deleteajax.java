package ajaxs;

import mvc.command.CommandHandler;
import org.json.JSONObject;
import services.FooterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteajax implements CommandHandler {
    FooterService footerService = new FooterService();
    JSONObject jsonObject = new JSONObject();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        String index_ = req.getParameter("number");
        int index = Integer.parseInt(index_);
        return ajaxResult(type, index);
    }

    public String ajaxResult(String type, int index){
        footerService.deleteFooter(type, index);
        return jsonObject.toString();
    }
}
