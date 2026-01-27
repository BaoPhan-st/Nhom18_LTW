package controller;

import DTO.SessionOrderDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user.CartItem;
import model.user.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String mode = (String) session.getAttribute("checkoutMode");
        Map<String, CartItem> cart;

        if ("BUY_NOW".equals(mode)) {
            cart = (Map<String, CartItem>) session.getAttribute("checkoutCart");
        } else {
            cart = (Map<String, CartItem>) session.getAttribute("cart");
        }

        if (cart == null || cart.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        try {
            // Lưu đơn hàng vào database (nếu có)
            // orderService.placeOrder(user.getId(), cart);

            // Tạo đơn hàng từ giỏ hàng và lưu vào session
            SessionOrderDTO newOrder = SessionOrderDTO.fromCart(cart);

            // Lấy danh sách đơn hàng từ session (nếu có)
            List<SessionOrderDTO> orderHistory = (List<SessionOrderDTO>) session.getAttribute("orderHistory");
            if (orderHistory == null) {
                orderHistory = new ArrayList<>();
            }

            // Thêm đơn hàng mới vào đầu danh sách
            orderHistory.add(0, newOrder);

            // Lưu lại vào session
            session.setAttribute("orderHistory", orderHistory);

            // Lưu đơn hàng vừa đặt để hiển thị trên trang thành công
            session.setAttribute("lastOrder", newOrder);

            if ("BUY_NOW".equals(mode)) {
                session.removeAttribute("checkoutCart");
                session.removeAttribute("checkoutMode");
            } else {
                session.removeAttribute("cart");
            }

            req.setAttribute("successMessage", " Đặt hàng thành công!");
            req.getRequestDispatcher("/order-success.jsp").forward(req, resp);

        } catch (RuntimeException e) {
            req.setAttribute("errorMessage", e.getMessage());
            req.getRequestDispatcher("/checkout.jsp").forward(req, resp);
        }
    }
}
