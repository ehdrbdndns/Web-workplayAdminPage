package commands;

import models.Faq;
import models.Notice;
import mvc.command.ExtendedCommandHandler;
import services.FaqService;
import services.NoticeService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class MainHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/main.jsp";

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

    private void init(HttpServletRequest req) {
        ArrayList<Notice> notices = new NoticeService().selectNotice();
        req.setAttribute("notices", notices);
        ArrayList<Faq> faqs = new FaqService().selectFaq();
        req.setAttribute("faqs", faqs);
    }

    @Override
    public String processForm(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        return FORM_VIEW;
    }
}
