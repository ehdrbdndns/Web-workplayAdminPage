package commands;

import models.Faq;
import mvc.command.ExtendedCommandHandler;
import services.FaqService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class FAQHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/faq.jsp";

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
        int category_no = req.getParameter("category") != null ? Integer.parseInt(req.getParameter("category")) : 0;
        ArrayList<Faq> faqs = new FaqService().selectFaqByCategory(category_no);
        req.setAttribute("faqs", faqs);
    }
}