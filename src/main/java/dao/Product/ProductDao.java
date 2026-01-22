package dao.Product;

import dao.JDBIConnector;
import model.product.Product;
import org.jdbi.v3.core.Jdbi;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class ProductDao {

    private final Jdbi jdbi;

    public ProductDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }


    public Product findById(int id) {
        String sql = """
        SELECT *
        FROM product
        WHERE id = :id
          AND is_available = 1
    """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("id", id)
                            .mapToBean(Product.class)
                            .findOne()
                            .orElse(null)
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Product> getAllBestSeller(int limit) {
        String sql = """
            SELECT *
            FROM product
            WHERE is_available = 1
              AND is_discontinue = 0
            ORDER BY added_at DESC
            LIMIT :limit
        """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("limit", limit)
                            .mapToBean(Product.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
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

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .mapToBean(Product.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<Product> findByBrandLimit(int brandId, int limit) {
        String sql = """
            SELECT p.*
            FROM product p
            JOIN brand b ON p.brand_id = b.id
            WHERE (:brandId IS NULL OR p.brand_id = :brandId)
              AND b.is_active = 1
              AND p.is_available = 1
            ORDER BY p.id DESC
            LIMIT :limit
        """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("brandId", brandId)
                            .bind("limit", limit)
                            .mapToBean(Product.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public boolean isNew(int id) {
        String sql = """
            SELECT COUNT(*)
            FROM product
            WHERE id = :id
              AND is_available = 1
              AND added_at >= NOW() - INTERVAL 7 DAY
        """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("id", id)
                            .mapTo(int.class)
                            .findOne()
                            .orElse(0) > 0
            );
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getDes(int productId) {
        String sql = """
            SELECT description
            FROM product
            WHERE id = :productId
              AND is_available = 1
        """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .mapTo(String.class)
                            .findOne()
                            .orElse("")
            );
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public List<Product> getRelatedProduct(
            int productId,
            int brandId,
            BigDecimal price,
            int limit) {
        String sql = """
        SELECT *
        FROM product
        WHERE id != :productId
          AND is_available = 1
          AND brand_id = :brandId
          AND price BETWEEN :minPrice AND :maxPrice
        ORDER BY
            ABS(price - :price) ASC
        LIMIT :limit
    """;

        BigDecimal minPrice = price.multiply(new BigDecimal("0.8")); // -20%
        BigDecimal maxPrice = price.multiply(new BigDecimal("1.2")); // +20%

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .bind("brandId", brandId)
                            .bind("price", price)
                            .bind("minPrice", minPrice)
                            .bind("maxPrice", maxPrice)
                            .bind("limit", limit)
                            .mapToBean(Product.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

}


