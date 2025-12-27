package controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.User;
import services.UserServices;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private UserServices userService;

    @Override
    public void init() {
        userService = new UserServices();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("webapp/menu.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // 1. Validate
        if (email == null || password == null ||
                email.isBlank() || password.isBlank()) {

            req.setAttribute("error", "Vui lòng nhập email và mật khẩu");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        // 2. Login
        User users = userService.loginByEmail(email, password);

        if (users == null) {
            req.setAttribute("error", "Sai email hoặc mật khẩu");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        // 3. Session
        HttpSession session = req.getSession(true);
        session.setAttribute("currentUser", users);
        session.setMaxInactiveInterval(30 * 60);


        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new ArrayList<CartItem>());
            session.setAttribute("cartCount", 0);
        }


        if ("ADMIN".equalsIgnoreCase(users.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/admin/overview");
        } else {
            resp.sendRedirect(req.getContextPath() + "/menu.jsp");

        }
    }
}
