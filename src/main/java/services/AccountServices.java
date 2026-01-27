package services;

import dao.UserDao;
import model.user.User;
import org.mindrot.jbcrypt.BCrypt;

public class AccountServices {

    private final UserDao userDao;

    public AccountServices() {
        this.userDao = new UserDao();
    }

    public boolean updateUserProfile(int userId, String fullName, String phone, String address) {
        return userDao.updateProfile(userId, fullName, phone, address);
    }

    public String changePassword(String email, String currentPassword, String newPassword, String confirmPassword) {
        if (newPassword == null || !newPassword.equals(confirmPassword)) {
            return "Mật khẩu xác nhận không khớp!";
        }

        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[^A-Za-z0-9])\\S{8,}$";
        if (!newPassword.matches(passwordRegex)) {
            return "Mật khẩu yếu: Cần 8 ký tự, hoa, thường, số và ký tự đặc biệt.";
        }

        User user = userDao.findByEmail(email);
        if (user == null) {
            return "Người dùng không tồn tại.";
        }

        // Kiểm tra mật khẩu cũ
        if (user.getPasswordHash() == null || !BCrypt.checkpw(currentPassword, user.getPasswordHash())) {
            return "Mật khẩu hiện tại không đúng!";
        }

        // Mã hóa mật khẩu mới
        String hashedNewPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));

        // Cập nhật vào DB
        boolean success = userDao.updatePassword(email, hashedNewPassword);
        if (success) {
            return "SUCCESS";
        } else {
            return "Lỗi hệ thống, vui lòng thử lại sau.";
        }
    }
}
