package dao.Collection;

import dao.JDBIConnector;
import model.Collection.Collection;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class CollectionDao {

    private final Jdbi jdbi;

    public CollectionDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public Collection findBySlug(String slug) {
        String sql = """
            SELECT * FROM collection
            WHERE slug = :slug AND is_active = 1
        """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("slug", slug)
                        .mapToBean(Collection.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public List<Collection> findAllActive() {
        String sql = """
            SELECT * FROM collection
            WHERE is_active = 1
            ORDER BY sort_order
        """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Collection.class)
                        .list()
        );
    }
}

