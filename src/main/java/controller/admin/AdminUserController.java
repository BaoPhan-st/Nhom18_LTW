package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/admin/accounts", "/admin/wishlist"})
public class AdminUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/wishlist")) {
            // Load wishlist data


            request.getRequestDispatcher("/admin-wishlist.jsp").forward(request, response);
        } else {
            // Default accounts


            request.getRequestDispatcher("/admin-accounts.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/wishlist")) {
            // Handle wishlist CRUD


        } else {
            // Handle account CRUD


        }
        response.sendRedirect(request.getContextPath() + uri);
    }
}
