package dao.admin.user;

import dao.JDBIConnector;
import model.user.Wishlist;

import java.util.List;

public class WishlistDao
{
    public List<Wishlist> findAll()
    {
        String sql = """
            SELECT
                w.user_id AS idUser,
                w.product_id AS idProduct,
                w.added_At as addedAt
            FROM wishlist w
            JOIN users u ON w.user_id = u.id
            JOIN products p ON w.product_id = p.id
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Wishlist.class)
                        .list()
        );
    }

    public void delete(int userId, int productId)
    {
        String sql = """
            DELETE FROM wishlists
            WHERE user_id = :userId AND product_id = :productId
        """;

        JDBIConnector.getJdbi().useHandle(handle ->
                handle.createUpdate(sql)
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .execute()
        );
    }
}
