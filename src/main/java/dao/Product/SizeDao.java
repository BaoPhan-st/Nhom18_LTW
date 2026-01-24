package dao.Product;

import dao.JDBIConnector;
import model.product.Color;
import model.product.Size;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SizeDao {

    private final Jdbi jdbi = JDBIConnector.getJdbi();

    // SIZES
    public List<Size> findAll()
    {
        String sql = """
                SELECT *
                FROM size
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Size.class)
                        .list()
        );
    }

    public Color findById(int id) {
        String sql = "SELECT * FROM size WHERE id = :id";
        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Color.class)
                        .findOne().orElse(null)
        );
    }

    public void insert(Color c) {
        String sql = """
            INSERT INTO color(name, sort_order)
            VALUES(:name, :sort_order)
        """;
        jdbi.useHandle(h -> h.createUpdate(sql).bindBean(c).execute());
    }

    public void delete(int id) {
        jdbi.useHandle(h ->
                h.createUpdate("UPDATE size SET is_active = 0 WHERE id = :id")
                        .bind("id", id).execute()
        );
    }
}

