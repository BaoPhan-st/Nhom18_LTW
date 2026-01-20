package dao.admin.user;

import dao.JDBIConnector;
import model.user.CartItem;

import java.util.List;

public class CartDao {

    // LẤY TOÀN BỘ GIỎ HÀNG
    public List<CartItem> findByUserId(int userId) {
        String sql = """
            SELECT
                product_id   AS productId,
                product_name AS productName,
                size_id      AS sizeId,
                color_id     AS colorId,
                price,
                quantity
            FROM cart_items
            WHERE user_id = :userId
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .mapToBean(CartItem.class)
                        .list()
        );
    }

    // CHÈN DƯ LIỆU
    public boolean insert(int userId, CartItem item) {
        String sql = """
            INSERT INTO cart_items
            (user_id, product_id, product_name, size_id, color_id, price, quantity)
            VALUES
            (:userId, :productId, :productName, :sizeId, :colorId, :price, :quantity)
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("userId", userId)
                        .bindBean(item)
                        .execute() > 0
        );
    }

    // CẬP NHẬT SỐ LƯỢNG
    public boolean updateQuantity(int userId, int productId, int sizeId, int colorId, int quantity) {
        String sql = """
            UPDATE cart_items SET
                quantity = :quantity
            WHERE user_id = :userId
              AND product_id = :productId
              AND size_id = :sizeId
              AND color_id = :colorId
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("quantity", quantity)
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .bind("sizeId", sizeId)
                        .bind("colorId", colorId)
                        .execute() > 0
        );
    }

    /* ===== Xoá 1 item khỏi cart ===== */
    public boolean delete(int userId, int productId, int sizeId, int colorId) {
        String sql = """
            DELETE FROM cart_items
            WHERE user_id = :userId
              AND product_id = :productId
              AND size_id = :sizeId
              AND color_id = :colorId
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .bind("sizeId", sizeId)
                        .bind("colorId", colorId)
                        .execute() > 0
        );
    }

    /* ===== Xoá toàn bộ cart của user ===== */
    public boolean clearCart(int userId) {
        String sql = "DELETE FROM cart_items WHERE user_id = :userId";

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("userId", userId)
                        .execute() > 0
        );
    }
}
