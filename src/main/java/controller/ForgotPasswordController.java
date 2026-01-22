package controller;

import java.io.IOException;
import java.util.Random;

import org.mindrot.jbcrypt.BCrypt;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user.User;
import services.EmailServices;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {

    private EmailServices emailService;
    private UserDao userDao;

    @Override
    public void init() {
        emailService = new EmailServices();
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");

        String action = req.getParameter("action");

        if ("send-otp".equals(action)) {
            handleSendOtp(req, resp);
        } else if ("verify-otp".equals(action)) {
            handleVerifyOtp(req, resp);
        } else if ("reset-password".equals(action)) {
            handleResetPassword(req, resp);
        }
    }

    // Tạo OTP 6 số
    private String generateOtp() {
        Random random = new Random();
        return String.valueOf(100000 + random.nextInt(900000));
    }

    // Gửi OTP
    private void handleSendOtp(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String email = req.getParameter("email");

        // Kiểm tra email tồn tại
        User user = userDao.findByEmail(email);
        if (user == null) {
            resp.getWriter().write("{\"success\": false, \"message\": \"Email không tồn tại\"}");
            return;
        }

        // Tạo OTP
        String otp = generateOtp();
        
        // Lưu OTP vào session
        HttpSession session = req.getSession();
        session.setAttribute("resetEmail", email);
        session.setAttribute("resetOtp", otp);
        session.setAttribute("otpTime", System.currentTimeMillis()); // Thời gian tạo OTP
        
        // Gửi email
        String subject = "Mã OTP đặt lại mật khẩu - BHD SPORT SHOES";
        String message = "<!DOCTYPE html>" +
            "<html>" +
            "<head><meta charset='UTF-8'></head>" +
            "<body style='font-family: Arial, sans-serif; line-height: 1.6; color: #333;'>" +
                "<div style='max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f9f9f9;'>" +
                    "<div style='background-color: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);'>" +
                        "<div style='text-align: center; margin-bottom: 30px;'>" +
                            "<h1 style='color: #ff6b35; margin: 0;'>BHD SPORT SHOES</h1>" +
                        "</div>" +
                        "<h2 style='color: #333; margin-top: 0;'>Đặt lại mật khẩu</h2>" +
                        "<p style='font-size: 16px;'>Bạn đã yêu cầu đặt lại mật khẩu cho tài khoản của mình.</p>" +
                        "<p style='font-size: 16px;'>Mã OTP của bạn là:</p>" +
                        "<div style='text-align: center; margin: 30px 0;'>" +
                            "<div style='display: inline-block; padding: 20px 40px; background-color: #f5f5f5; border: 2px dashed #ff6b35; border-radius: 10px;'>" +
                                "<span style='font-size: 32px; font-weight: bold; color: #ff6b35; letter-spacing: 8px;'>" + otp + "</span>" +
                            "</div>" +
                        "</div>" +
                        "<div style='margin-top: 30px; padding: 20px; background-color: #fff3cd; border-left: 4px solid #ffc107; border-radius: 5px;'>" +
                            "<p style='font-size: 14px; color: #856404; margin: 5px 0;'>⏰ Mã này có hiệu lực trong <strong>5 phút</strong>.</p>" +
                            "<p style='font-size: 14px; color: #856404; margin: 5px 0;'>🔒 Vui lòng <strong>KHÔNG CHIA SẺ</strong> mã này với bất kỳ ai.</p>" +
                            "<p style='font-size: 14px; color: #856404; margin: 5px 0;'>❌ Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>" +
                        "</div>" +
                        "<div style='margin-top: 30px; text-align: center; color: #666; font-size: 14px;'>" +
                            "<p>Trân trọng,</p>" +
                            "<p style='font-weight: bold; color: #ff6b35;'>Đội ngũ BHD SPORT SHOES</p>" +
                        "</div>" +
                    "</div>" +
                "</div>" +
            "</body>" +
            "</html>";
        
        boolean sent = emailService.seend(email, subject, message);
        
        if (sent) {
            resp.getWriter().write("{\"success\": true, \"message\": \"Mã OTP đã được gửi đến email của bạn\"}");
        } else {
            resp.getWriter().write("{\"success\": false, \"message\": \"Không thể gửi email. Vui lòng thử lại\"}");
        }
    }

    // Verify OTP
    private void handleVerifyOtp(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("resetEmail");
        String savedOtp = (String) session.getAttribute("resetOtp");
        Long otpTime = (Long) session.getAttribute("otpTime");
        
        String inputOtp = req.getParameter("otp");

        if (inputOtp == null || inputOtp.isBlank()) {
            resp.getWriter().write("{\"success\": false, \"message\": \"Vui lòng nhập mã OTP\"}");
            return;
        }

        if (email == null || savedOtp == null || otpTime == null) {
            resp.getWriter().write("{\"success\": false, \"message\": \"Phiên làm việc hết hạn\"}");
            return;
        }

        // Kiểm tra OTP hết hạn (5 phút = 300000ms)
        long currentTime = System.currentTimeMillis();
        if (currentTime - otpTime > 300000) {
            resp.getWriter().write("{\"success\": false, \"message\": \"Mã OTP đã hết hạn\"}");
            return;
        }

        // Kiểm tra OTP đúng không
        if (savedOtp.equals(inputOtp)) {
            session.setAttribute("otpVerified", true);
            session.removeAttribute("otpFailedAttempts");
            resp.getWriter().write("{\"success\": true, \"message\": \"Xác thực thành công\"}");
        } else {
            // Đếm số lần nhập sai
            Integer failedAttempts = (Integer) session.getAttribute("otpFailedAttempts");
            if (failedAttempts == null) failedAttempts = 0;
            failedAttempts++;
            session.setAttribute("otpFailedAttempts", failedAttempts);
            
            if (failedAttempts >= 3) {
                // Xóa OTP sau 3 lần sai
                session.removeAttribute("resetOtp");
                session.removeAttribute("otpTime");
                session.removeAttribute("otpFailedAttempts");
                resp.getWriter().write("{\"success\": false, \"message\": \"Bạn đã nhập sai quá 3 lần. Vui lòng gửi lại OTP\"}");
                return;
            }
            
            resp.getWriter().write("{\"success\": false, \"message\": \"Mã OTP không đúng. Còn " + (3 - failedAttempts) + " lần thử\"}");
        }
    }

    // Đổi mật khẩu
    private void handleResetPassword(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("resetEmail");
        Boolean otpVerified = (Boolean) session.getAttribute("otpVerified");
        
        String newPassword = req.getParameter("password");

        if (email == null || otpVerified == null || !otpVerified) {
            resp.getWriter().write("{\"success\": false, \"message\": \"Chưa xác thực OTP\"}");
            return;
        }

        // Validate password mới
        if (newPassword == null || newPassword.length() < 6) {
            resp.getWriter().write("{\"success\": false, \"message\": \"Mật khẩu phải có ít nhất 6 ký tự\"}");
            return;
        }

        // Hash password mới
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
        
        // Cập nhật mật khẩu
        boolean updated = userDao.updatePassword(email, hashedPassword);
        
        if (updated) {
            // Xóa session
            session.removeAttribute("resetEmail");
            session.removeAttribute("resetOtp");
            session.removeAttribute("otpTime");
            session.removeAttribute("otpVerified");
            session.removeAttribute("otpFailedAttempts");
            
            resp.getWriter().write("{\"success\": true, \"message\": \"Đổi mật khẩu thành công\"}");
        } else {
            resp.getWriter().write("{\"success\": false, \"message\": \"Không thể đổi mật khẩu\"}");
        }
    }
}
