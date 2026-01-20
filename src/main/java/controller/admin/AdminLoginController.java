package controller.admin;

import model.user.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import services.UserServices;

import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginController extends HttpServlet
{
    private final UserServices userServices = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("adminId") != null)
        {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userServices.loginByEmail(email, password);

        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole()))
        {
            request.setAttribute("error", "Bạn không có quyền admin để truy cập");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(true);

        session.setAttribute("adminId", user.getId());
        session.setAttribute("adminUser", user);

        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}
