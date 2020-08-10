package commands;

import mvc.command.ExtendedCommandHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MoveInHandler implements ExtendedCommandHandler {
    private static String FORM_VIEW = "/WEB-INF/view/move_in.jsp";

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
        return FORM_VIEW;
    }

    @Override
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        return FORM_VIEW;
    }
}
