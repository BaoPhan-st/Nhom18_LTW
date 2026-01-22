package controller.admin;

import dao.admin.order.OrderDao;
import dao.admin.user.CartDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.order.Order;
import model.user.CartItem;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet({"/admin/orders", "/admin/carts"})
public class AdminOrderController extends HttpServlet {
    private final OrderDao orderDao = new OrderDao();
    private final CartDao cartDao = new CartDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        // ====== CARTs ======
        if (uri.endsWith("/admin/carts"))
        {
            String userIdParam = request.getParameter("userId");
            Integer userId = null;

            try
            {
                if (userIdParam != null && !userIdParam.isBlank()) userId = Integer.parseInt(userIdParam);
            }
            catch (NumberFormatException ignored) {}

            List<CartItem> cartItems = cartDao.findAll();

            if (userId != null)
            {
                cartItems = cartDao.findByUserId(userId);

            }

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("contentPage", "/admin-carts.jsp");
            request.setAttribute("active", "admin/carts");

        } else
        {
            // ====== ORDERS ======
            String orderIdParam = request.getParameter("orderId");
            String userIdParam = request.getParameter("userId");
            String status = request.getParameter("status");

            Integer orderId = null;
            Integer userId = null;
            try
            {
                if (orderIdParam != null && !orderIdParam.isBlank()) orderId = Integer.parseInt(orderIdParam);
                if (userIdParam != null && !userIdParam.isBlank()) userId = Integer.parseInt(userIdParam);
            } catch (NumberFormatException ignorred) {}

            List<Order> orders;
            if (orderId != null || userId != null || (status != null && !status.isBlank()))
            {
                orders = orderDao.findWithFilter(orderId,userId, status);
            } else
            {
                orders = orderDao.findAll();
            }
            request.setAttribute("orders", orders);

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

