package com.augmentum.oes.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.augmentum.oes.Constants;
import com.augmentum.oes.model.User;

public class SessionFilter implements Filter {
    private String notNeedLoginPages;
    protected FilterConfig filterConfig;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        if (filterConfig.getInitParameter("notNeedLoginPages") != null) {
            notNeedLoginPages = filterConfig.getInitParameter("notNeedLoginPages");
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest , ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String uri = request.getRequestURI();
        String requestedURI = uri.substring(request.getContextPath().length() + 1);
        String[] pages = notNeedLoginPages.split(",");
        boolean isAllow = false;

        for (String page : pages) {
            if (page.equals(requestedURI)) {
                isAllow = true;
                break;
            }
        }

        if (isAllow) {
            filterChain.doFilter(request, response);
        } else {
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute(Constants.USER);

            if (user == null) {
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<script>");
                out.println("window.open('" + request.getContextPath() + "/page/user/readyToLogin" + "', '_top')");
                out.println("</script>");
                out.println("</html>");
            } else {
                filterChain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {}
}
