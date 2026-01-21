package dao.Product;

import dao.JDBIConnector;
import model.product.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductDao {

    private final Jdbi jdbi;

    public ProductDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }


    public Product findById(int id) {
        String sql = "SELECT * FROM product WHERE id = :id AND is_available = 1";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Product.class)
                        .one()
        );
    }

    public List<Product> getAllBestSeller(int limit) {
        String sql = """
            SELECT * FROM product
            WHERE is_available = 1 AND is_discontinue = 0
            ORDER BY added_at DESC
            LIMIT :limit
        """;

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public List<Product> findProductsInPromotion() {

        String sql = """
        SELECT DISTINCT p.*
        FROM product p
        JOIN promotion_product pp ON p.id = pp.product_id
        JOIN promotion pr ON pr.id = pp.promotion_id
        WHERE p.is_available = 1
          AND pr.is_active = 1
          AND (pr.start_date IS NULL OR pr.start_date <= NOW())
          AND (pr.end_date IS NULL OR pr.end_date >= NOW())
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Product.class)
                        .list()
        );
    }
    public List<Product> findByBrandLimit(int brandId, int limit) {
        String sql = """
    
                SELECT p.* FROM product p
                JOIN brand b ON p.brand_id = b.id
                WHERE (:brandId IS NULL OR p.brand_id = :brandId)
                  AND b.is_active = 1
                  AND p.is_available = 1
                ORDER BY p.id DESC
                LIMIT :limit
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("brandId", brandId)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list()
        );
    }
    public boolean isNew(int id) {
        String sql = """
        SELECT COUNT(*)
        FROM product
        WHERE id = :id
          AND is_available = 1
          AND added_at >= NOW() - INTERVAL 7 DAY
    """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapTo(int.class)
                        .one() > 0
        );
    }


}

