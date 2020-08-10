package util;

import mvc.command.ExtendedCommandHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

public class FileDownloader implements ExtendedCommandHandler {
    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        System.out.println("process");
        req.setCharacterEncoding("utf-8");
        res.setCharacterEncoding("utf-8");
        res.setContentType("application/octet-stream;charset=utf-8");
        String path = null;
        if (req.getParameter("file1") != null) {
            path = req.getParameter("file1");
        } else if (req.getParameter("file2") != null) {
            path = req.getParameter("file2");
        } else if (req.getParameter("file3") != null) {
            path = req.getParameter("file3");
        } else if (req.getParameter("file4") != null) {
            path = req.getParameter("file4");
        } else {
            new RuntimeException();
        }

        if (path != null) {
            path = req.getSession().getServletContext().getRealPath("/") + path;
            try {
                System.out.println(path);
                OutputStream os = res.getOutputStream();
                File file = new File(path);
                res.setHeader("Content-Disposition", "attachment;filename=" + new String(file.getName().getBytes("EUC-KR"), "ISO-8859-1") + ";");
                res.setHeader("Content-Length", "" + file.length());
                res.setHeader("Content-Transfer-Encoding", "binary;");
                FileInputStream fis = new FileInputStream(file);
                int readCount = 0;
                byte[] buf = new byte[8192];
                while ((readCount = fis.read(buf)) != -1) {
                    os.write(buf, 0, readCount);
                }
                fis.close();
                os.close();
            } catch (Exception e) {
                System.out.println("File Exception");
                e.printStackTrace();
            }
        } else {
            System.out.println("path is null");
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
