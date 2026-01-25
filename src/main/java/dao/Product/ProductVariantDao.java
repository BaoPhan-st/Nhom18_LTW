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

    private Jdbi jdbi = JDBIConnector.getJdbi();

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

    public List<Color> findColorsByProduct(int productId) {
        String sql = """
            SELECT DISTINCT c.*
            FROM product_variant v
            JOIN color c ON v.color_id = c.id
            JOIN product p ON v.product_id = p.id
            WHERE v.product_id = :productId
              AND p.is_available = 1
              AND v.is_discontinue_variant = 0
            ORDER BY c.id
        """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .mapToBean(Color.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<Size> findSizesByProductAndColor(int productId, int colorId) {

        String sql = """
            SELECT DISTINCT s.*
            FROM product_variant v
            JOIN size s ON v.size_id = s.id
            WHERE v.product_id = :productId
              AND v.color_id = :colorId
              AND v.is_discontinue_variant = 0
            ORDER BY s.id
        """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .bind("colorId", colorId)
                            .mapToBean(Size.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public int getStock(int productId, int colorId, int sizeId) {

        String sql = """
            SELECT stock
            FROM product_variant
            WHERE product_id = :productId
              AND color_id = :colorId
              AND size_id = :sizeId
              AND is_discontinue_variant = 0
        """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .bind("colorId", colorId)
                            .bind("sizeId", sizeId)
                            .mapTo(Integer.class)
                            .findOne()
                            .orElse(0)
            );
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int getTotalStockByColor(int productId, int colorId) {
        String sql = """
        SELECT COALESCE(SUM(stock), 0)
        FROM product_variant
        WHERE product_id = :productId
          AND color_id = :colorId
          AND is_discontinue_variant = 0
    """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .bind("colorId", colorId)
                            .mapTo(Integer.class)
                            .one()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public Integer findDefaultColorId(int productId) {

        String sql = """
        SELECT v.color_id
        FROM product_variant v
        WHERE v.product_id = :productId
          AND v.is_discontinue_variant = 0
        GROUP BY v.color_id
        HAVING SUM(v.stock) > 0
        ORDER BY MIN(v.id) ASC
        LIMIT 1
    """;

        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .mapTo(Integer.class)
                            .findOne()
                            .orElse(null)
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean existsProductVariant(int productId, Integer colorId, Integer sizeId) {
        if (colorId == null || sizeId == null) {
            return false;
        }
        String sql = """
        SELECT COUNT(*)
        FROM product_variant v
        WHERE v.product_id = :productId
          AND v.color_id = :colorId
          AND v.size_id = :sizeId
          AND v.is_discontinue_variant = 0
    """;
        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("productId", productId)
                            .bind("colorId", colorId)
                            .bind("sizeId", sizeId)
                            .mapTo(Integer.class)
                            .one() > 0
            );
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getColorName(int colorId) {

        String sql = """
        SELECT name
        FROM color
        WHERE id = :colorId
    """;
        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("colorId", colorId)
                            .mapTo(String.class)
                            .findOne()
                            .orElse("")
            );
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public String getSizeName(int sizeId) {

        String sql = """
        SELECT name
        FROM size
        WHERE id = :sizeId
    """;
        try {
            return jdbi.withHandle(h ->
                    h.createQuery(sql)
                            .bind("sizeId", sizeId)
                            .mapTo(String.class)
                            .findOne()
                            .orElse("")
            );
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public int lockAndGetStock(Handle handle, int productId, int colorId, int sizeId) {
        String sql = """
        SELECT stock
        FROM product_variant
        WHERE product_id = :productId
          AND color_id = :colorId
          AND size_id = :sizeId
        FOR UPDATE
    """;

        return handle.createQuery(sql)
                .bind("productId", productId)
                .bind("colorId", colorId)
                .bind("sizeId", sizeId)
                .mapTo(int.class)
                .one();
    }

    public void updateStock(Handle handle, int productId, int colorId, int sizeId, int newStock) {
        String sql = """
        UPDATE product_variant
        SET stock = :stock
        WHERE product_id = :productId
          AND color_id = :colorId
          AND size_id = :sizeId
    """;

        handle.createUpdate(sql)
                .bind("stock", newStock)
                .bind("productId", productId)
                .bind("colorId", colorId)
                .bind("sizeId", sizeId)
                .execute();
    }

}

