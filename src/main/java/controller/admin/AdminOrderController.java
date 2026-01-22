package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/admin/orders", "/admin/carts"})
public class AdminOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/carts")) {
            // Load carts data


            request.getRequestDispatcher("/admin-carts.jsp").forward(request, response);
        } else {
            // Default orders


            request.getRequestDispatcher("/admin-orders.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle order/cart CRUD here


        response.sendRedirect(request.getRequestURI());
    }
}
