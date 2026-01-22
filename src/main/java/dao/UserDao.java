package dao;

import model.user.User;
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
            email, password_hash, phone_number, address, full_name, role, is_active, created_at, firebase_uid
        )
        VALUES (
            :email, :passwordHash, :phoneNumber, :address, :fullName, :role, :isActive, :createdAt, :firebaseUID
        )
    """;

        try {
            int rows = jdbi.withHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("email", user.getEmail())
                            .bind("passwordHash", user.getPasswordHash())
                            .bind("phoneNumber", user.getPhoneNumber())
                            .bind("address", user.getAddress())
                            .bind("fullName", user.getFullName())
                            .bind("role", user.getRole())
                            .bind("isActive", user.isActive())
                            .bind("createdAt", user.getCreatedAt())
                            .bind("firebaseUID", user.getFirebaseUID())
                            .execute()
            );

            System.out.println("insertUser rows = " + rows);
            return rows;
        } catch (Exception e) {
            System.out.println("insertUser FAILED!");
            e.printStackTrace();
            return 0;
        }
    }


    // ===== UPDATE PASSWORD (cho quên mật khẩu) =====
    public boolean updatePassword(String email, String newPasswordHash) {
        String sql = "UPDATE users SET password_hash = :password WHERE email = :email";
        
        return jdbi.withHandle(handle ->
            handle.createUpdate(sql)
                .bind("email", email)
                .bind("password", newPasswordHash)
                .execute()
        ) > 0;
    }
    public boolean activateByEmail(String email) {
        String sql = "UPDATE users SET is_active = 1 WHERE email = :email";
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("email", email)
                        .execute()
        ) > 0;
    }

}
