package controller;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.user.User;
import org.mindrot.jbcrypt.BCrypt; // Import rõ ràng

import java.io.IOException;

@WebServlet("/account")
public class AccountController extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        // Forward sang trang giao diện
        req.getRequestDispatcher("/account.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";

        if ("change-password".equals(action)) {
            handlePasswordChange(req, resp);
        } else {

            doGet(req, resp);
        }
    }

    private void handlePasswordChange(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("currentUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("currentUser");

        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");


        if (newPassword == null || !newPassword.equals(confirmPassword)) {
            req.setAttribute("passMsg", "Mật khẩu xác nhận không khớp!");
            req.setAttribute("msgType", "danger"); // Thêm class CSS cho đẹp (ví dụ bootstrap text-danger)
            req.getRequestDispatcher("/account.jsp").forward(req, resp);
            return;
        }


        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[^A-Za-z0-9])\\S{8,}$";
        if (!newPassword.matches(passwordRegex)) {
            req.setAttribute("passMsg", "Mật khẩu yếu: Cần 8 ký tự, hoa, thường, số và ký tự đặc biệt.");
            req.setAttribute("msgType", "danger");
            req.getRequestDispatcher("/account.jsp").forward(req, resp);
            return;
        }

        User u = userDao.findByEmail(currentUser.getEmail());
        if (u == null || !BCrypt.checkpw(currentPassword, u.getPasswordHash())) {
            req.setAttribute("passMsg", "Mật khẩu hiện tại không đúng!");
            req.setAttribute("msgType", "danger");
            req.getRequestDispatcher("/account.jsp").forward(req, resp);
            return;
        }

        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
        boolean ok = userDao.updatePassword(currentUser.getEmail(), hashed);

        if (ok) {
            // LỰA CHỌN A: Bắt đăng nhập lại (An toàn nhất)
            // session.invalidate();
            // resp.sendRedirect(req.getContextPath() + "/login.jsp?message=PasswordChanged");

            // LỰA CHỌN B: Giữ đăng nhập và thông báo (Thân thiện hơn)
            req.setAttribute("passMsg", "Đổi mật khẩu thành công!");
            req.setAttribute("msgType", "success"); // CSS text-success

            // Cập nhật lại hash trong object session để đồng bộ (nếu User object có lưu hash)
            currentUser.setPasswordHash(hashed);

            req.getRequestDispatcher("/account.jsp").forward(req, resp);
        } else {
            req.setAttribute("passMsg", "Lỗi hệ thống, vui lòng thử lại sau.");
            req.setAttribute("msgType", "danger");
            req.getRequestDispatcher("/account.jsp").forward(req, resp);
        }
    }
}