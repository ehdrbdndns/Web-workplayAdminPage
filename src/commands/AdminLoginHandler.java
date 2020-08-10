package commands;

import models.*;
import mvc.command.ExtendedCommandHandler;
import services.AdminService;
import services.FmService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AdminLoginHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/admin/login_main.jsp";
    private static String MAIN_VIEW = "/WEB-INF/view/admin/facility_main.jsp";
    public AdminService adminService = new AdminService();
    FmService fmService = new FmService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
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
        System.out.println("왜 일로 안와..?");
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String Id = req.getParameter("Id");
        String Pwd = req.getParameter("Pwd");
        int check = adminService.checkAdmin(Id, Pwd);
        if (check == 1) {
            init(req);
            req.getSession().setAttribute("ADMIN", new Admin(Id, Pwd));
            ArrayList<Fm_i> fm_is = fmService.selectFm(1);
            ArrayList<Fm_c> fm_cs = fmService.getFm();
            int fmCount = fmService.countFm_i(1);
            String name = fm_cs.get(0).getNAME();
            req.setAttribute("name", name);
            req.setAttribute("fm_cs", fm_cs);
            req.setAttribute("no_c", 1);
            req.setAttribute("fm_is", fm_is);
            req.setAttribute("count", fmCount);
            return MAIN_VIEW;
        }
        else
        return FORM_VIEW;
    }

    private void init(HttpServletRequest req) {
        int no = req.getParameter("no_c") != null ? Integer.parseInt(req.getParameter("no_c")) : 1;
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
