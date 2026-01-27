package controller.admin;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter
{
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException
    {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String uri = request.getRequestURI();

        // Cho phép login & logout
        if (uri.endsWith("/admin/login") || uri.endsWith("/admin/logout"))
        {
            chain.doFilter(req, res);
            return;
        }

        // ===== DEV MODE =====
        HttpSession session = request.getSession(true);
        if (session.getAttribute("adminId") == null)
        {
            session.setAttribute("adminId", 1);
        }

        chain.doFilter(req, res);
    }
}
