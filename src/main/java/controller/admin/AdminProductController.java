package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/admin/products", "/admin/variants"})
public class AdminProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/variants")) {
            // Load variants, sizes, colors data


            request.getRequestDispatcher("/admin-variants.jsp").forward(request, response);
        } else {
            // Default products


            request.getRequestDispatcher("/admin-products.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/variants")) {
            // Handle variant CRUD


        } else {
            // Handle product CRUD


        }
        response.sendRedirect(request.getContextPath() + uri);
    }
}
