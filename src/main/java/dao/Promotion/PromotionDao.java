package dao.Promotion;

import dao.JDBIConnector;
import model.Promotion.Promotion;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class PromotionDao {
    private final Jdbi jdbi;

    public PromotionDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }
    public List<Promotion> findAllActive() {

        String sql = """
            SELECT *
            FROM promotion
            WHERE is_active = 1
              AND (start_date IS NULL OR start_date <= NOW())
              AND (end_date IS NULL OR end_date >= NOW())
            ORDER BY start_date DESC
        """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Promotion.class)
                        .list()
        );
    }
    public List<Promotion> findPromotionForProduct(int productId) {

        String sql = """
            SELECT p.*
            FROM promotion p
            JOIN promotion_product pp 
                ON p.id = pp.promotion_id
            WHERE pp.product_id = :productId
              AND p.is_active = 1
              AND (p.start_date IS NULL OR p.start_date <= NOW())
              AND (p.end_date IS NULL OR p.end_date >= NOW())
            ORDER BY 
                p.start_date DESC
        """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(Promotion.class)
                        .list()
        );
    }
}
