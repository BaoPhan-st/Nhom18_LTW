package services.admin;

import dao.JDBIConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.nhom18.webshoes.util.Password.checkPassword;
import static com.nhom18.webshoes.util.Password.hashPassword;

public class AdminService
{

    public String adminGetUserName(int adminId)
    {
        String sql = """
                SELECT full_name
                FROM users
                WHERE role = 'admin' AND id = ?;
                """;
        try (Connection conn = JDBIConnector.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql))
        {
            ps.setInt(1,adminId);
            ResultSet rs = ps.executeQuery();

            if (rs.next())
            {
                return rs.getString("full_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void adminUpdateUserName(int adminId, String userName)
    {
        String sql = """
                UPDATE users 
                SET full_name = ? 
                WHERE id = ? AND role = 'admin';
                """;
        try (Connection conn = JDBIConnector.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql))
        {
            ps.setString(1, userName);
            ps.executeUpdate();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    public void adminUpdatePassword(int adminId, String rawPassword)
    {
        String sql = """
            UPDATE users 
            SET password_hash = ? 
            WHERE id = ? AND role = 'admin';
            """;

        try (Connection conn = JDBIConnector.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql))
        {
            ps.setString(1, hashPassword(rawPassword));
            ps.setInt(2, adminId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean adminCheckPassword(int adminId, String rawPassord)
    {
        String sql = """
                SELECT password_hash
                FROM users
                WHERE role = 'admin' AND id = ?;
                """;
        try (Connection conn = JDBIConnector.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql))
        {
            ps.setInt(1,adminId);
            ResultSet rs = ps.executeQuery();

            if (rs.next())
            {
                return checkPassword(rawPassord, rs.getString("password_hash"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
