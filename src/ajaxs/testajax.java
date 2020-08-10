package ajaxs;

import mvc.command.CommandHandler;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class testajax implements CommandHandler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String type = req.getParameter("type");
        String value = req.getParameter("value");
        return ajaxResult(type, value);
    }

    public String ajaxResult(String type, String value) throws JSONException {
        switch (type) {
            case "test":
            default:
                return "switch";
        }
    }
}
