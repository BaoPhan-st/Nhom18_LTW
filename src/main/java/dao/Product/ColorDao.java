package dao.Product;

import dao.JDBIConnector;
import model.product.Color;
import org.jdbi.v3.core.Jdbi;

public class ColorDao {

    private final Jdbi jdbi = JDBIConnector.getJdbi();

    public Color findById(int id) {
        String sql = "SELECT * FROM color WHERE id = :id";
        return jdbi.withHandle(h -> h.createQuery(sql)
                .bind("id", id)
                .mapToBean(Color.class)
                .findOne().orElse(null));
    }

    public void insert(Color c) {
        String sql = """
                    INSERT INTO color(name, hexcode)
                    VALUES(:name, :hexcode)
                """;
        jdbi.useHandle(h -> h.createUpdate(sql).bindBean(c).execute());
    }

    public void delete(int id) {
        jdbi.useHandle(h -> h.createUpdate("UPDATE color SET is_active = 0 WHERE id = :id")
                .bind("id", id).execute());
    }

    public java.util.List<Color> findAllActive() {
        String sql = "SELECT * FROM color WHERE is_active = 1 ORDER BY name";
        return jdbi.withHandle(h -> h.createQuery(sql)
                .mapToBean(Color.class)
                .list());
    }
}
