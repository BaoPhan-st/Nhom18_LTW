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

    // FINDALL
    public List<ProductVariant> findAllActive()
    {
        String sql = """
                SELECT * FROM product_variant
                WHERE is_discontinue_variant = 0
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(ProductVariant.class)
                        .list()
        );
    }

    // ===== FIND =====
    public List<ProductVariant> findByProduct(int productId) {
        String sql = """
            SELECT * FROM product_variant
            WHERE product_id = :productId
              AND is_discontinue_variant = 0
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
            (product_id, size_id, color_id, stock, is_discontinue_variant)
            VALUES(:productId, :sizeId, :colorId, :stock, 0)
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
            SET is_dsicontinue_variant = 1
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

    public List<ProductVariant> findWithFilter(
            Integer productId,
            Integer sizeId,
            Integer colorId)
    {
        StringBuilder sbSQL = new StringBuilder("""
                SELECT * FROM product_variant
                WHERE is_discontinue_variant = 0
                """);
        if (productId != null) sbSQL.append(" AND product_id = :productId");
        if (sizeId != null) sbSQL.append(" AND size_id = :sizeId");
        if (colorId != null) sbSQL.append(" AND color_id = :colorId");

        return jdbi.withHandle(handle -> {
                var q = handle.createQuery(sbSQL.toString());
                if (productId != null) q.bind("productId", productId);
                if (sizeId != null) q.bind("sizeId", sizeId);
                if (colorId != null) q.bind("colorId", colorId);
                return q.mapToBean(ProductVariant.class).list();
        });
    }
}

