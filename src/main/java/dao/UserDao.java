package dao;

import model.User;
import org.jdbi.v3.core.Jdbi;

public class UserDao {

    private final Jdbi jdbi;

    public UserDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    // ===== FIND BY EMAIL =====
    public User findByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = :email";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("email", email)
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // ===== FIND BY PHONE =====
    public User findByPhone(String phone) {
        String sql = "SELECT * FROM users WHERE phone_number = :phone";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("phone", phone)
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // ===== INSERT USER =====
    public int insertUser(User user) {
        String sql = """
        INSERT INTO users (
            email,
            password_hash,
            phone_number,
            address,
            full_name,
            role,
            is_active,
            created_at,
            firebase_uid
        )
        VALUES (
            :email,
            :passwordHash,
            :phoneNumber,
            :address,
            :fullName,
            :role,
            :isActive,
            :createdAt,
            :firebaseUID
        )
    """;

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("email", user.getEmail())              // "nguyenvana@gmail.com"
                        .bind("passwordHash", user.getPasswordHash()) // ""
                        .bind("phoneNumber", user.getPhoneNumber())   // NULL
                        .bind("address", user.getAddress())           // NULL
                        .bind("fullName", user.getFullName())         // "Nguyễn Văn A"
                        .bind("role", user.getRole())                 // "user"
                        .bind("isActive", user.isActive())            // true
                        .bind("createdAt", user.getCreatedAt())       // giờ ngày tạo acc
                        .bind("firebaseUID", user.getFirebaseUID())   // "AbC123XyZ"
                        .execute()
        );
    }
}
