package com.augmentum.oes.filter;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.augmentum.oes.common.AppContext;
import com.augmentum.oes.model.User;
import com.augmentum.oes.util.JDBCUtil;

public class AppContextFileter implements Filter {
    @Override
    public void init(FilterConfig fConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        AppContext.setContextPath(request.getContextPath());
        AppContext appContext = AppContext.getAppContext();

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        appContext.addObject("app_context_username", user);

        Connection conn = (Connection)appContext.getObject("thread_local_connection");
        boolean needMyClose = false;

        if (conn == null) {
            conn = JDBCUtil.getConnection();
            appContext.addObject("thread_local_connection", conn);
            needMyClose = true;
        }

        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (RuntimeException | ServletException | IOException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (needMyClose) {
                JDBCUtil.getClose(conn, null, null);
            }
            appContext.clear();
        }
    }

    @Override
    public void destroy() {}
}
