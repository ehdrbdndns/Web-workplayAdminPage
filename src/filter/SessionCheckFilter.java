package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class SessionCheckFilter implements Filter {
    private String contextPath;
    private List<String> excludedUrls;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("SessionCheckFilter init()");
        contextPath = filterConfig.getServletContext().getContextPath();
        String excludePattern = filterConfig.getInitParameter("excludedUrls");
        excludedUrls = Arrays.asList(excludePattern.split(","));
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("SessionCheckFilter doFilter()");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        String path = ((HttpServletRequest) req).getServletPath();
        if (this.excludedUrls.contains(path)) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else if (req.getSession().getAttribute("ADMIN") == null) {
            System.out.println("Admin is null");
            res.sendRedirect(this.contextPath + "/admin/login.do");
        } else{
            System.out.println("Session Filter pass");
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        System.out.println("SessionCheckFilter destroy()");
    }
}
