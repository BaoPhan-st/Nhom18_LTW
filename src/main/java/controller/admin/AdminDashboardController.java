package controller.admin;

import dao.UserDao;
import dao.admin.order.OrderDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import services.admin.AdminService;
import services.admin.SettingService;

import java.io.IOException;

@WebServlet({"/dashboard", "/statistics", "/setting"})
public class AdminDashboardController extends HttpServlet
{

    private final UserDao userDao = new UserDao();
    private final OrderDao orderDao = new OrderDao();
    private final SettingService settingService = new SettingService();
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        if (uri.endsWith("/statistics"))
        {

            // LOAD STATISTICS DATA
            request.setAttribute("totalUsers", userDao.findAll().size());
            request.setAttribute("totalOrders", orderDao.findAll().size());
            request.setAttribute("totalRevenue", orderDao.totalRevenue());

            request.setAttribute("contentPage", "/admin-statistics.jsp");
            request.setAttribute("active", "statistics");

        } else if (uri.endsWith("/setting")) {

            // SITE SETTING
            request.setAttribute("siteName", settingService.settingGet("site_name"));
            request.setAttribute("siteEmail", settingService.settingGet("site_email"));
            request.setAttribute("sitePhone", settingService.settingGet("site_phone"));
            request.setAttribute("siteAddress", settingService.settingGet("site_address"));

            // NOTIFICATION
            request.setAttribute("newOrders", Boolean.parseBoolean(settingService.settingGet("notify_new_orders")));
            request.setAttribute("newSletterSignup", Boolean.parseBoolean(settingService.settingGet("notify_newsletter")));

            // ADMIN ACCOUNT
            request.setAttribute("adminUsername", "admin");

            request.setAttribute("contentPage", "/admin-setting.jsp");
            request.setAttribute("active", "setting");
        } else {

            // DASHBOARD (DEFAULT)
            request.setAttribute("todayOrders", orderDao.todayOrders().size());
            request.setAttribute("todayRevenue", orderDao.todayRevenue());
            request.setAttribute("newCustomers", userDao.todayCustomers());

            request.setAttribute("contentPage", "/admin-dashboard.jsp");
            request.setAttribute("active", "dashboard");
        }

        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/setting"))
        {
            String action = request.getParameter("action");
            if (action == null)
            {
                response.sendRedirect(request.getContextPath() + "/setting");
                return;
            }
            if ("site".equals(action))
            {
                String siteName = request.getParameter("siteName");
                String siteEmail = request.getParameter("siteEmail");
                String sitePhone = request.getParameter("sitePhone");
                String siteAddress = request.getParameter("siteAddress");

                settingService.settingUpdate("site_name", siteName);
                settingService.settingUpdate("site_email", siteEmail);
                settingService.settingUpdate("site_phone", sitePhone);
                settingService.settingUpdate("site_address", siteAddress);
            } else if ("notification".equals(action))
            {
                boolean newOrder = request.getParameter("newOrders") != null;
                boolean newSletterSignup = request.getParameter("newSletterSignup") != null;

                settingService.settingUpdate("notify_new_order", String.valueOf(newOrder));
                settingService.settingUpdate("notify_newsletter", String.valueOf(newSletterSignup));
            } else if ("account".equals(action))
            {
                String adminUserName = request.getParameter("adminUserName");
                String adminPassword = request.getParameter("adminPassword");

                int adminId = (int) request.getSession().getAttribute("adminId");

                adminService.adminUpdateUserName(adminId, adminUserName);

                if (adminPassword != null && !adminPassword.isBlank())
                {
                    adminService.adminUpdatePassword(adminId, adminPassword);
                }
            }

            response.sendRedirect(request.getContextPath() + "/setting");
            return;
        } else if (uri.endsWith("/statistics")) {

            // POST cho statistics (nếu có filter)
            response.sendRedirect(request.getContextPath() + "/statistics");
            return;
        }

        // DEFAULT → DASHBOARD
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
