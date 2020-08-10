package commands;

import models.Notice;
import mvc.command.ExtendedCommandHandler;
import services.NoticeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

public class AdminNoticeHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/admin/notice_main.jsp";
    private static String FORM_VIEW_DETAIL = "/WEB-INF/view/admin/notice_detail.jsp";
    private static String DRECTORY_ROOT = "/resources/files/notice/";

    NoticeService noticeService = new NoticeService();

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
        System.out.println("Notice 쿼리문 테스트: " + type);
        if (type != null) {
            if(type.equals("detail")) {
                String no_ = req.getParameter("num");
                int no = Integer.parseInt(no_);
                Notice notice = noticeService.selectNotice(no);
                req.setAttribute("divider", "detail");
                req.setAttribute("notice", notice);
                for(int i = 1; i<=6; i++){
                    if(i<=4) {
                        String File = notice.getFiles(i);
                        String result = null;
                        if(File != null) {
                            result = File.substring(DRECTORY_ROOT.length());
                            req.setAttribute("showFile" + i, result);
                        }
                        req.setAttribute("getFile" + i, notice.getFiles(i));
                    }
                    req.setAttribute("getImg" + i, notice.getImgs(i));
                    req.setAttribute("getContent" + i, notice.getContents(i));
                }
                return FORM_VIEW_DETAIL;
            } else if(type.equals("del")) {
                String no_ = req.getParameter("num");
                int no = Integer.parseInt(no_);
                noticeService.deleteNotice(no);
                return FORM_VIEW;
            } else if(type.equals("add")){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
                Calendar calendar = Calendar.getInstance();
                String today;
                today = sdf.format(calendar.getTime());
                req.setAttribute("date", today);
                req.setAttribute("divider", "add");
                return FORM_VIEW_DETAIL;
            }
        } else {
            System.out.println("NoticeHandler의 type값이 null입니다.");
            return FORM_VIEW;
        }
        System.out.println("AdminNoticeHandler 오류");
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) {
        return FORM_VIEW;
    }

}