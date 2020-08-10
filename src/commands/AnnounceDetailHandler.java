package commands;

import models.Notice;
import mvc.command.ExtendedCommandHandler;
import services.NoticeService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AnnounceDetailHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/announce_detail.jsp";

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        if (req.getMethod().equalsIgnoreCase("GET")) {
            init(req);
            return processForm(req, res);
        } else if (req.getMethod().equalsIgnoreCase("POST")) {
            init(req);
            return processSubmit(req, res);
        } else {
            res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    @Override
    public String processForm(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        return FORM_VIEW;
    }

    private void init(HttpServletRequest req) {
        int no = req.getParameter("announce") != null ? Integer.parseInt(req.getParameter("announce")) : 0;
        if (no == 0)
            throw new RuntimeException();
        Notice notice = new NoticeService().selectNotice(no);
        req.setAttribute("notice", notice);
    }
}
