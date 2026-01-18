package services;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import dao.JDBIConnector;

public class SettingService {

    // ===== UPDATE A SETTING ===== //
    public void update(String key, String value) {
        String sql = "UPDATE settings SET value = ? WHERE key_name = ?";

        try (Connection conn = JDBIConnector.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, value);
            ps.setString(2, key);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ===== GET A SETTING ===== //
    public String get(String key) {
        String sql = "SELECT value FROM settings WHERE key_name = ?";

        try (Connection conn = JDBIConnector.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("value");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // ===== CHECK EXIST ===== //
    public boolean exists(String key) {
        String sql = "SELECT 1 FROM settings WHERE key_name = ?";

        try (Connection conn = JDBIConnector.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // ===== INSERT IF NOT EXISTS ===== //
    public void save(String key, String value) {
        if (exists(key)) {
            update(key, value);
            return;
        }

        String sql = "INSERT INTO settings (key_name, value) VALUES (?, ?)";

        try (Connection conn = JDBIConnector.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, key);
            ps.setString(2, value);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
