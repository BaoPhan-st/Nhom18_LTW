package dao.Product;


import dao.JDBIConnector;
import model.product.Brand;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class BrandDao {

    private final Jdbi jdbi;

    public BrandDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    // ===== FIND =====
    public Brand findById(int id) {
        String sql = "SELECT * FROM brand WHERE id = :id AND is_active = 1";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Brand.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // ===== INSERT =====
    public void insert(Brand brand) {
        String sql = """
            INSERT INTO brand(name, logo_url, is_active)
            VALUES(:name, :logoUrl, 1)
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bindBean(brand)
                        .execute()
        );
    }

    // ===== UPDATE =====
    public void update(Brand brand) {
        String sql = """
            UPDATE brand
            SET name = :name,
                logo_url = :logoUrl,
            WHERE id = :id
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bindBean(brand)
                        .execute()
        );
    }

    public List<Brand> findAllActive() {
        String sql = "SELECT * FROM brand WHERE is_active = 1";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .mapToBean(Brand.class)
                        .list()
        );
    }
}

