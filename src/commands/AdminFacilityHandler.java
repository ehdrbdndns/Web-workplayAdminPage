package commands;

import models.Facility;
import models.FacilityMenu;
import models.Fm_c;
import models.Fm_i;
import mvc.command.ExtendedCommandHandler;
import services.FmService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AdminFacilityHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/admin/facility_main.jsp";
    private static String DRECTORY_ROOT = "/resources/files/facility/";
    FmService fmService = new FmService();
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) {
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
        String type = req.getParameter("type");
        if(type != null) {
            if(type.equals("change")){
                String no_c_ = req.getParameter("no_c");
                int no_c = Integer.parseInt(no_c_);
                return getPage(req, res, no_c);
            } else if(type.equals("cdel")){
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                fmService.delFm_c(no);
                return getPage(req, res,1);
            } else if(type.equals("idel")){
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                fmService.delFm_i(no);
                String no_c_ = req.getParameter("no_c");
                int no_c = Integer.parseInt(no_c_);
                return getPage(req, res,no_c);
            } else if(type.equals("add")){
                String no_c_ = req.getParameter("no_c");
                int no_c = Integer.parseInt(no_c_);
                fmService.addFm_i(no_c);
                return getPage(req, res, no_c);
            }
        } else{
            return getPage(req, res,1);
        }
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        String type = req.getParameter("type");
        if(type != null){
            if(type.equals("cadd")){
                String name = req.getParameter("categoryname");
                fmService.addFm_c(name);
                return getPage(req, res, 1);
            } else{
                return FORM_VIEW;
            }
        } else{
            return FORM_VIEW;
        }
    }

    public String getPage(HttpServletRequest req, HttpServletResponse res, int no_c){
        ArrayList<Fm_i> fm_is = fmService.selectFm(no_c);
        ArrayList<Fm_c> fm_cs = fmService.getFm();
        int fmCount = fmService.countFm_i(no_c);
        String name = fm_cs.get(no_c-1).getNAME();
        req.setAttribute("name", name);
        req.setAttribute("fm_cs", fm_cs);
        req.setAttribute("no_c", no_c);
        req.setAttribute("fm_is", fm_is);
        req.setAttribute("count", fmCount);
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
