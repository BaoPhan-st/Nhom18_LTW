package dao.Product;

import dao.JDBIConnector;
import model.product.Size;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SizeDao {

    private final Jdbi jdbi = JDBIConnector.getJdbi();

    public Size findById(int id) {
        String sql = "SELECT * FROM size WHERE id = :id";
        return jdbi.withHandle(h -> h.createQuery(sql)
                .bind("id", id)
                .mapToBean(Size.class)
                .findOne().orElse(null));
    }

    public List<Size> findAllActive() {
        String sql = "SELECT * FROM size ORDER BY sort_order";
        return jdbi.withHandle(h -> h.createQuery(sql)
                .mapToBean(Size.class)
                .list());
    }
}
