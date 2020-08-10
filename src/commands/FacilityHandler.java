package commands;

import models.Facility;
import models.FacilityMenu;
import models.Fm_c;
import mvc.command.ExtendedCommandHandler;
import services.FmService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class FacilityHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/facility.jsp";

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
        int no = req.getParameter("type") != null ? Integer.parseInt(req.getParameter("type")) : 1;
        ArrayList<FacilityMenu> facilityMenus = new FmService().getFacilityMenu();
        ArrayList<Facility> facilities = new FmService().getFacility(no);
        String images = "";
        int j = 0;
        for (int i = 0; i < facilities.size(); i++) {
            if (i == facilities.size() - 1) {
                images += facilities.get(i).getImg();
                j = i;
                break;
            }
            images += facilities.get(i).getImg() + ",";
        }
        Facility facility = new Facility(j, no, images);
        req.setAttribute("facilityMenus", facilityMenus);
        req.setAttribute("facility", facility);
        req.setAttribute("facilities", facilities);
    }
}
