package services.admin;

import dao.JDBIConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SettingService {
    /* ========== SETTING ========== */
    public void settingUpdate(String key, String value) {
        String sql = """
            UPDATE settings
            SET value = ?
            WHERE key_name = ?
        """;

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
    public String settingGet(String key) {
        String sql = """
            SELECT value
            FROM settings
            WHERE key_name = ?
        """;

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
    public boolean settingExists(String key) {
        String sql = """
            SELECT 1 
            FROM settings 
            WHERE key_name = ?
        """;

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
    public void settingSave(String key, String value) {
        if (settingExists(key)) {
            settingUpdate(key, value);
            return;
        }

        String sql = """
            INSERT INTO settings (key_name, value) 
            VALUES (?, ?)
        """;

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
