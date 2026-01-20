package dao;


import model.Banner;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class BannerDao {

    private final Jdbi jdbi;

    public BannerDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public List<Banner> findByPositions(String position) {
        String sql = """
            SELECT * FROM banner
            WHERE position = :position
              AND is_active = 1
            ORDER BY sort_order
        """;

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("position", position)
                        .mapToBean(Banner.class)
                        .list()
        );
    }
    public Banner findByPosition(String position) {
        String sql = """
        SELECT *
        FROM banner
        WHERE position = :position
          AND is_active = 1
        ORDER BY sort_order
        LIMIT 1
    """;

        return jdbi.withHandle(h ->
                h.createQuery(sql)
                        .bind("position", position)
                        .mapToBean(Banner.class)
                        .findFirst()
                        .orElse(null)
        );
    }

    public void insert(Banner banner) {
        String sql = """
            INSERT INTO banner(title, img_url, link_url,
                               target_type, target_entity_id,
                               position, sort_order, is_active, slogan)
            VALUES(:title, :imgUrl, :linkUrl,
                   :targetType, :targetEntityId,
                   :position, :sortOrder, 1)
        """;

        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bindBean(banner)
                        .execute()
        );
    }

    public void delete(int id) {
        String sql = "UPDATE banner SET is_active = 0 WHERE id = :id";
        jdbi.useHandle(h ->
                h.createUpdate(sql)
                        .bind("id", id)
                        .execute()
        );
    }
}

