package dao.admin.user;

import dao.JDBIConnector;
import model.user.Wishlist;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WishlistDao {

    public List<Wishlist> findAll() {
        List<Wishlist> list = new ArrayList<>();

        String sql = """
            SELECT w.user_id, w.product_id, w.created_at
            FROM wishlists w
            JOIN users u ON w.user_id = w.user_id
            JOIN products p ON w.product_id = p.product_id
            ORDER BY  w.created_at DESC;
        """;

        try (Connection con = JDBIConnector.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Wishlist w = new Wishlist();
                w.setIdUser(rs.getInt("user_id"));
                w.setIdProduct(rs.getInt("product_id"));
                w.setAddedAt(rs.getTimestamp("added_at").toLocalDateTime());
                list.add(w);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void delete(int id) {
        String sql = "DELETE FROM wishlists WHERE id = ?";
        try (Connection con = JDBIConnector.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
