package dao.Product;

import dao.JDBIConnector;
import model.product.ProductVariant;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductVariantDao {

    private final Jdbi jdbi;

    public ProductVariantDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    // ===== FIND =====
    public List<ProductVariant> findByProduct(int productId) {
        String sql = """
            SELECT * FROM product_variant
            WHERE product_id = :productId
              AND is_available_variant = 1
        """;

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(ProductVariant.class)
                        .list()
        );
    }

    // ===== INSERT =====
    public void insert(ProductVariant v) {
        String sql = """
            INSERT INTO product_variant
            (product_id, size_id, color_id, stock, is_available_variant)
            VALUES(:productId, :sizeId, :colorId, :stock, 1)
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bindBean(v)
                        .execute()
        );
    }

    // ===== UPDATE STOCK =====
    public void updateStock(ProductVariant v) {
        String sql = """
            UPDATE product_variant
            SET stock = :stock
            WHERE product_id = :productId
              AND size_id = :sizeId
              AND color_id = :colorId
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bindBean(v)
                        .execute()
        );
    }

    // ===== DELETE =====
    public void delete(ProductVariant v) {
        String sql = """
            UPDATE product_variant
            SET is_available_variant = 0
            WHERE product_id = :productId
              AND size_id = :sizeId
              AND color_id = :colorId
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bindBean(v)
                        .execute()
        );
    }
}

