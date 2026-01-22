package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/admin/banners", "/admin/collections", "/admin/newsletter"})
public class AdminMarketingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/collections")) {
            // Load collections data


            request.getRequestDispatcher("/admin-collections.jsp").forward(request, response);
        } else if (uri.endsWith("/newsletter")) {
            // Load newsletter data


            request.getRequestDispatcher("/admin-newsletter.jsp").forward(request, response);
        } else {
            // Default banners


            request.getRequestDispatcher("/admin-banners.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle marketing CRUD according to URL


        response.sendRedirect(request.getRequestURI());
    }
}
