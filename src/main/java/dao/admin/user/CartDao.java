package dao.admin.user;

import dao.JDBIConnector;
import model.user.CartItem;

import java.util.List;

public class CartDao
{

    // LẤY TOÀN BỘ GIỎ HÀNG CỦA HỆ THỐNG
    public List<CartItem> findAll()
    {
        String sql = """
            SELECT
                user_id AS userId,
                product_id AS productId,
                color_id AS colorId,
                size_id AS sizeId,
                quantity,
                price,
                total_price AS totalPrice
            FROM cart_items
        """;
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(CartItem.class)
                        .list()
        );
    }

    // LẤY GIỎ HÀNG CỦA MỘT NGƯỜI DÙNG
    public List<CartItem> findByUserId(int userId)
    {
        String sql = """
            SELECT
                user_id AS userId,
                product_id AS productId,
                color_id AS colorId,
                size_id AS sizeId,
                quantity,
                price,
                total_price AS totalPrice
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
    public boolean insert(CartItem item)
    {
        String sql = """
            INSERT INTO cart_items
            (user_id, product_id, color_id, size_id, price, quantity)
            VALUES
            (:userId, :productId, :colorId, :sizeId, :price, :quantity)
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(item)
                        .execute() > 0
        );
    }

    // CẬP NHẬT SỐ LƯỢNG
    public boolean updateQuantity(
            int userId,
            int productId,
            int colorId,
            int sizeId,
            int quantity
    ){
        String sql = """
            UPDATE cart_items 
            SET quantity = :quantity
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

    // XOÁ ITEM
    public boolean delete(
            int userId,
            int productId,
            int sizeId,
            int colorId
    ) {
        String sql = """
            DELETE FROM cart_items
            WHERE user_id = :userId
              AND product_id = :productId
              AND color_id = :colorId
              AND size_id = :sizeId
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
    public boolean clearCart(int userId)
    {
        String sql = """
            DELETE FROM cart_items 
            WHERE user_id = :userId
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("userId", userId)
                        .execute() > 0
        );
    }
}
