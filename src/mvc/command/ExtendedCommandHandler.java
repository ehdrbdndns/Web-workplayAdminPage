package mvc.command;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public interface ExtendedCommandHandler extends CommandHandler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException;
    public String processForm(HttpServletRequest req, HttpServletResponse res);
    public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException;
}
