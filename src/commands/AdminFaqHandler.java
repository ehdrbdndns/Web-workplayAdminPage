package commands;

import models.Faq;
import mvc.command.ExtendedCommandHandler;
import services.FaqService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

public class AdminFaqHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/admin/faq_main.jsp";
    private static String FORM_VIEW_DETAIL = "/WEB-INF/view/admin/faq_detail.jsp";
    FaqService faqService = new FaqService();

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
        String type = req.getParameter("type");
        if(type != null){
            if(type.equals("change")){
                String no_c_ = req.getParameter("no_c");
                int no_c = Integer.parseInt(no_c_);
                return getPage(req, res, no_c);
            } else if(type.equals("del")){
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                faqService.deleteFaq(no);
                String no_c_ = req.getParameter("no_c");
                int no_c = Integer.parseInt(no_c_);
                return getPage(req, res, no_c);
            } else if(type.equals("detail")){
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                Faq faq = faqService.faqDetail(no);
                req.setAttribute("faq", faq);
                req.setAttribute("divider", "detail");
                return FORM_VIEW_DETAIL;
            } else if(type.equals("add")){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
                Calendar calendar = Calendar.getInstance();
                String today;
                today = sdf.format(calendar.getTime());
                req.setAttribute("date", today);
                String no_c_ = req.getParameter("no_c");
                int no_c = Integer.parseInt(no_c_);
                req.setAttribute("no_c", no_c);
                req.setAttribute("divider", "add");
                return FORM_VIEW_DETAIL;
            }

        } else {
            ArrayList<Faq> faqs = faqService.selectFaq(1);
            req.setAttribute("name", "전체");
            req.setAttribute("faqs", faqs);
            req.setAttribute("no_c", 1);
            return FORM_VIEW;
        }
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        String type = req.getParameter("type");
        if(type != null){
            if(type.equals("save")){
                String title = req.getParameter("title");
                String content = req.getParameter("content");
                String no_ = req.getParameter("no");
                int no = Integer.parseInt(no_);
                faqService.updateFaq(no, title, content);
                String no_c_ = req.getParameter("no_c");
                int no_c = Integer.parseInt(no_c_);
                return getPage(req, res, no_c);
            } else if(type.equals("add")){
                String title = req.getParameter("title");
                String content = req.getParameter("content");
                String no_c_ = req.getParameter("no_c");
                String date = req.getParameter("date");
                int no_c = Integer.parseInt(no_c_);
                faqService.addFaq(no_c, title, content, date);
                return getPage(req, res, no_c);
            }
        }
        return FORM_VIEW;
    }

    public String getPage(HttpServletRequest req, HttpServletResponse res, int no_c){
        ArrayList<Faq> faqs = faqService.selectFaq(no_c);
        if(no_c == 1)
            req.setAttribute("name", "전체");
        else if(no_c == 2)
            req.setAttribute("name", "입주 안내");
        else if(no_c == 3)
            req.setAttribute("name", "시설 이용");
        else if(no_c == 4)
            req.setAttribute("name", "대관 안내");
        else if(no_c == 5)
            req.setAttribute("name", "기타");
        req.setAttribute("no_c", no_c);
        req.setAttribute("faqs", faqs);
        return FORM_VIEW;
    }
}
