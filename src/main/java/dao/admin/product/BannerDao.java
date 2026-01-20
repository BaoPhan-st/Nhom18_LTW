package dao.admin.product;

import dao.JDBIConnector;
import model.product.Banner;

import java.util.List;

public class BannerDao
{
    public List<Banner> findAll()
    {
        String sql = "SELECT * FROM banners";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Banner.class)
                        .list()
        );
    }

    public Banner findById(int id)
    {
        String sql = "SELECT * FROM banners WHERE id = :id";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Banner.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public boolean insert(Banner banner)
    {
        String sql = """
            INSERT INTO banners
            (title, img_url, link_url, target_type, target_entity_id, position,
             sort_order, is_active, start_date, end_date)
            VALUES
            (:title, :imgUrl, :linkUrl, :targetType, :targetEntityId, :position,
             :sortOrder, :active, :startDate, :endDate)
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(banner)
                        .execute() > 0
        );
    }

    public boolean update(Banner banner)
    {
        String sql = """
            UPDATE banners SET
                title = :title,
                img_url = :imgUrl,
                link_url = :linkUrl,
                target_type = :targetType,
                target_entity_id = :targetEntityId,
                position = :position,
                sort_order = :sortOrder,
                is_active = :active,
                start_date = :startDate,
                end_date = :endDate
            WHERE id = :id
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(banner)
                        .execute() > 0
        );
    }

    public boolean delete(int id)
    {
        String sql = "DELETE FROM banners WHERE id = :id";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute() > 0
        );
    }
}

