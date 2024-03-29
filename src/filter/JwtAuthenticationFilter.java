package filter;

import javax.servlet.*;
import java.io.IOException;

public class JwtAuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("JwtAuthenticationFilter init()");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("JwtAuthenticationFilter doFilter()");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("JwtAuthenticationFilter doDestroy()");
    }
}
