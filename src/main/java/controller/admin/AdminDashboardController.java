package controller.admin;

import dao.UserDao;
import dao.Order.OrderDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import services.admin.AdminService;
import services.admin.SettingService;

import java.io.IOException;

@WebServlet({"/admin/dashboard", "/admin/statistics", "/admin/setting"})
public class AdminDashboardController extends HttpServlet
{
    private final UserDao userDao = new UserDao();
    private final OrderDao orderDao = new OrderDao();
    private final SettingService settingService = new SettingService();
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/statistics"))
        {
            request.setAttribute("totalUsers", userDao.findAll().size());
            request.setAttribute("totalOrders", orderDao.findAll().size());
            request.setAttribute("totalRevenue", orderDao.totalRevenue());

            request.setAttribute("contentPage", "/admin-statistics.jsp");
            request.setAttribute("active", "admin/statistics");

        } else if (uri.endsWith("/admin/setting"))
        {
            Integer adminId = (Integer) request.getSession().getAttribute("adminId");

            request.setAttribute("siteName", settingService.settingGet("site_name"));
            request.setAttribute("siteEmail", settingService.settingGet("site_email"));
            request.setAttribute("sitePhone", settingService.settingGet("site_phone"));
            request.setAttribute("siteAddress", settingService.settingGet("site_address"));

            request.setAttribute("newOrders", "true".equalsIgnoreCase(settingService.settingGet("notify_new_orders")));
            request.setAttribute("newNewsletterSignup", Boolean.parseBoolean(settingService.settingGet("notify_newsletter")));

            request.setAttribute("adminUsername", adminService.adminGetUserName(adminId));

            request.setAttribute("contentPage", "/admin-setting.jsp");
            request.setAttribute("active", "admin/setting");
        } else
        {
            request.setAttribute("todayOrders", orderDao.todayOrders());
            request.setAttribute("todayRevenue", orderDao.todayRevenue());
            request.setAttribute("newCustomers", userDao.todayCustomers());

            request.setAttribute("contentPage", "/admin-dashboard.jsp");
            request.setAttribute("active", "admin/dashboard");
        }

        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/setting"))
        {
            String action = request.getParameter("action");

            if ("site".equals(action))
            {
                settingService.settingUpdate("site_name", request.getParameter("siteName"));
                settingService.settingUpdate("site_email", request.getParameter("siteEmail"));
                settingService.settingUpdate("site_phone", request.getParameter("sitePhone"));
                settingService.settingUpdate("site_address", request.getParameter("siteAddress"));

            } else if ("notification".equals(action))
            {
                settingService.settingUpdate("notify_new_orders", String.valueOf(request.getParameter("newOrders") != null));
                settingService.settingUpdate("notify_newsletter", String.valueOf(request.getParameter("newSletterSignup") != null));

            } else if ("account".equals(action))
            {
                int adminId = (int) request.getSession().getAttribute("adminId");
                adminService.adminUpdateUserName(adminId, request.getParameter("adminUserName"));

                String adminPassword = request.getParameter("adminPassword");
                if (adminPassword != null && !adminPassword.isBlank())
                {
                    adminService.adminUpdatePassword(adminId, adminPassword);
                }
            }

            response.sendRedirect(request.getContextPath() + "/admin/setting");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}
