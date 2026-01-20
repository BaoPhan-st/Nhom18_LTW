package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/admin/orders", "/admin/carts"})
public class AdminOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/carts"))
        {
            // TODO: load carts data


            request.setAttribute("contentPage", "/admin-carts.jsp");
            request.setAttribute("active", "admin/carts");

        } else
        {
            // TODO: load orders data


            request.setAttribute("contentPage", "/admin-orders.jsp");
            request.setAttribute("active", "admin/orders");
        }

        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/carts"))
        {
            // Handle cart CRUD


            response.sendRedirect(request.getContextPath() + "/admin/carts");
        } else
        {
            // Handle order CRUD


            response.sendRedirect(request.getContextPath() + "/admin/orders");
        }
    }
}

