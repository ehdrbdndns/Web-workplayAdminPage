package commands;

import mvc.command.ExtendedCommandHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLogoutHandler implements ExtendedCommandHandler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        if(req.getSession().getAttribute("ADMIN") != null){
            req.getSession().removeAttribute("ADMIN");
            res.sendRedirect("/admin/login.do");
        }
        return null;
    }

    @Override
    public String processForm(HttpServletRequest req, HttpServletResponse res) {
        return null;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        return null;
    }
}
