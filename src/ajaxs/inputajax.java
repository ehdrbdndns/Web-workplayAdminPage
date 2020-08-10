package ajaxs;

import models.Footer;
import mvc.command.CommandHandler;
import org.json.JSONException;
import org.json.JSONObject;
import services.FooterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class inputajax implements CommandHandler {
    FooterService footerservice = new FooterService();
    JSONObject jsonObject = new JSONObject();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        String value = req.getParameter("value");
        String url = req.getParameter("url");
        return ajaxResult(type, value, url);
    }

    public String ajaxResult(String type, String value, String url) throws JSONException {
        if(url == null){
            footerservice.updateFooter(type, value);
            return jsonObject.toString();
        }else{
            footerservice.updateFooter(type, value, url);
            return jsonObject.toString();
        }
    }
}
