package commands;

import models.Footer;
import models.FooterIntutition;
import mvc.command.ExtendedCommandHandler;
import services.FooterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminFooterHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/admin/footer_main.jsp";
    private FooterService footerservice = new FooterService();
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
        Footer footer = footerservice.getFooter();
        ArrayList<FooterIntutition> footerSeoul = footerservice.getFooterSeoul();
        ArrayList<FooterIntutition> footerYought = footerservice.getFooterYought();

        req.setAttribute("footerYought", footerYought);
        req.setAttribute("footerSeoul", footerSeoul);
        req.setAttribute("footer", footer);
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }
}
