package controller;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/account")
public class AccountController extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User sessionUser = (User) session.getAttribute("currentUser");

        User freshUser = userDao.findByEmail(sessionUser.getEmail());

        if (freshUser == null) {
            session.invalidate();
            resp.sendRedirect("login.jsp");
            return;
        }

        req.setAttribute("user", freshUser);
        req.getRequestDispatcher("/account.jsp").forward(req, resp);
    }
}