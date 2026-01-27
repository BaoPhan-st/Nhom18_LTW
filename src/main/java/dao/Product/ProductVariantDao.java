package dao.Product;

import dao.JDBIConnector;
import model.product.Color;
import model.product.ProductVariant;
import model.product.Size;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import java.util.Collections;
import java.util.List;

public class ProductVariantDao {

    private final Jdbi jdbi;

    public ProductVariantDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    // ===== FIND ALL =====
    public List<ProductVariant> findAllActive() {
        String sql = """
            SELECT *
            FROM product_variant
            WHERE is_discontinue_variant = 0
        """;

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .mapToBean(ProductVariant.class)
                        .list()
        );
    }

    // ===== FIND BY PRODUCT =====
    public List<ProductVariant> findByProduct(int productId) {
        String sql = """
            SELECT *
            FROM product_variant
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
            VALUES (:productId, :sizeId, :colorId, :stock, 0)
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bind("productId", v.getProductId())
                        .bind("sizeId", v.getSizeId())
                        .bind("colorId", v.getColorId())
                        .bind("stock", v.getStock())
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
                        .bind("stock", v.getStock())
                        .bind("productId", v.getProductId())
                        .bind("sizeId", v.getSizeId())
                        .bind("colorId", v.getColorId())
                        .execute()
        );
    }

    // ===== SOFT DELETE =====
    public void delete(ProductVariant v) {
        String sql = """
            UPDATE product_variant
            SET is_discontinue_variant = 1
            WHERE product_id = :productId
              AND size_id = :sizeId
              AND color_id = :colorId
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bind("productId", v.getProductId())
                        .bind("sizeId", v.getSizeId())
                        .bind("colorId", v.getColorId())
                        .execute()
        );
    }

    // ===== FILTER =====
    public List<ProductVariant> findWithFilter(
            Integer productId,
            Integer sizeId,
            Integer colorId
    ) {
        StringBuilder sql = new StringBuilder("""
            SELECT *
            FROM product_variant
            WHERE is_discontinue_variant = 0
        """);

        if (productId != null) sql.append(" AND product_id = :productId");
        if (sizeId != null)    sql.append(" AND size_id = :sizeId");
        if (colorId != null)   sql.append(" AND color_id = :colorId");

        return jdbi.withHandle(h -> {
            var q = h.createQuery(sql.toString());
            if (productId != null) q.bind("productId", productId);
            if (sizeId != null)    q.bind("sizeId", sizeId);
            if (colorId != null)   q.bind("colorId", colorId);
            return q.mapToBean(ProductVariant.class).list();
        });
    }

    // ===== GET STOCK =====
    public int getStock(int productId, int colorId, int sizeId) {
        String sql = """
            SELECT stock
            FROM product_variant
            WHERE product_id = :productId
              AND color_id = :colorId
              AND size_id = :sizeId
              AND is_discontinue_variant = 0
        """;

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("productId", productId)
                        .bind("colorId", colorId)
                        .bind("sizeId", sizeId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0)
        );
    }

    // ===== LOCK & UPDATE (TRANSACTION) =====
    public int lockAndGetStock(Handle h, int productId, int colorId, int sizeId) {
        String sql = """
            SELECT stock
            FROM product_variant
            WHERE product_id = :productId
              AND color_id = :colorId
              AND size_id = :sizeId
            FOR UPDATE
        """;

        return h.createQuery(sql)
                .bind("productId", productId)
                .bind("colorId", colorId)
                .bind("sizeId", sizeId)
                .mapTo(int.class)
                .one();
    }

    public void updateStock(
            Handle h,
            int productId,
            int colorId,
            int sizeId,
            int newStock
    ) {
        String sql = """
            UPDATE product_variant
            SET stock = :stock
            WHERE product_id = :productId
              AND color_id = :colorId
              AND size_id = :sizeId
        """;

        h.createUpdate(sql)
                .bind("stock", newStock)
                .bind("productId", productId)
                .bind("colorId", colorId)
                .bind("sizeId", sizeId)
                .execute();
    }

    public String getColorName (int colorId)
    {
        String sql = """
                SELECT name
                FROM color
                WHERE id = :colorId
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("colorId", colorId)
                        .mapTo(String.class)
                        .one()
        );
    }

    public String getSizeName (int sizeId)
    {
        String sql = """
                SELECT name
                FROM size
                WHERE id = :sizeId
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("sizeId", sizeId)
                        .mapTo(String.class)
                        .one()
        );
    }
}
