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
                user_id AS idUser,
                product_id AS idProduct,
                added_At as addedAt
            FROM wishlist
           """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Wishlist.class)
                        .list()
        );
    }

    public void deleteByUserId(int userId)
    {
        JDBIConnector.getJdbi().useHandle(handle ->
                handle.createUpdate("DELETE FROM wishlist WHERE user_id = :userId")
                        .bind("userId", userId)
                        .execute()
        );
    }
}
