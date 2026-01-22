package dao.Product;

import dao.JDBIConnector;
import model.product.Color;
import model.product.Size;
import org.jdbi.v3.core.Jdbi;

import java.util.Collections;
import java.util.List;

    public class ProductVariantDao {

        private final Jdbi jdbi = JDBIConnector.getJdbi();

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

        public boolean isValidVariant(int productId, int colorId, int sizeId, int qty) {

            String sql = """
            SELECT COUNT(*)
            FROM product_variant v
            JOIN product p ON v.product_id = p.id
            WHERE v.product_id = :productId
              AND v.color_id = :colorId
              AND v.size_id = :sizeId
              AND v.is_discontinue_variant = 0
              AND p.is_available = 1
              AND v.stock >= :qty
        """;

            try {
                return jdbi.withHandle(h ->
                        h.createQuery(sql)
                                .bind("productId", productId)
                                .bind("colorId", colorId)
                                .bind("sizeId", sizeId)
                                .bind("qty", qty)
                                .mapTo(int.class)
                                .one() > 0
                );
            } catch (Exception e) {
                e.printStackTrace();
                return false;
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

        public boolean existsProductVariant(
                int productId,
                Integer colorId,
                Integer sizeId
        ) {
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
    }

