package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/admin/dashboard", "/admin/statistics", "/admin/setting"})
public class AdminDashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/statistics")) {
            // Load statistics data


            request.getRequestDispatcher("/admin-statistics.jsp").forward(request, response);
        } else if (uri.endsWith("/setting")) {
            // Load settings data


            request.getRequestDispatcher("/admin-setting.jsp").forward(request, response);
        } else {
            // Default dashboard


            request.getRequestDispatcher("/admin-dashboard.jsp").forward(request, response);
        }
    }
}
