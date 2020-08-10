package commands;

import models.Notice;
import mvc.command.ExtendedCommandHandler;
import services.NoticeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class
AdminMainHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/admin/admin_main.jsp";
    private NoticeService noticeservice = new NoticeService();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
        if (req.getMethod().equalsIgnoreCase("GET")) {
            return processForm(req, res);
        } else if (req.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(req, res);
        } else {
            res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    @Override
    public String processForm(HttpServletRequest req, HttpServletResponse res) {
        ArrayList<Notice> notices = noticeservice.NoticeDB();
        req.setAttribute("notice", notices);
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }
}
