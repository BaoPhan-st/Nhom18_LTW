package dao.Product;

import dao.JDBIConnector;
import model.product.ProductImage;
import model.product.ProductMainImage;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ProductDaoImage {
    private final Jdbi jdbi;

    public ProductDaoImage() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public ProductMainImage findMainImage(int productId) {

        String sql = """
        SELECT *
        FROM product_main_img
        WHERE product_id = :productId
          AND is_active = 1
        LIMIT 1
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(ProductMainImage.class)
                        .findFirst()
                        .orElse(null)
        );
    }
    public List<ProductImage> findSubImages(int productId, int colorId) {

        String sql = """
        SELECT *
        FROM product_image
        WHERE product_id = :productId
          AND color_id = :colorId
          AND is_main = 0
          AND is_active = 1
        ORDER BY sort_order ASC
        LIMIT 5
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .bind("colorId", colorId)
                        .mapToBean(ProductImage.class)
                        .list()
        );
    }

}



