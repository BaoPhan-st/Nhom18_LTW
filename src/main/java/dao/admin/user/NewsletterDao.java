package dao.admin.user;

import dao.JDBIConnector;
import model.user.Newsletter;

import java.util.List;

public class NewsletterDao
{
    public List<Newsletter> findAll()
    {
        String sql = "SELECT * FROM newsletters";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Newsletter.class)
                        .list()
        );
    }

    public Newsletter findById(int id)
    {
        String sql = "SELECT * FROM newsletters WHERE id = :id";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Newsletter.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public Newsletter findByEmail(String email)
    {
        String sql = "SELECT * FROM newsletters WHERE email = :email";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("email", email)
                        .mapToBean(Newsletter.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public boolean insert(Newsletter newsletter)
    {
        String sql = """
            INSERT INTO newsletters
            (email, is_active, subscribed_at)
            VALUES (:email, :active, :subscribedAt)
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(newsletter)
                        .execute() > 0
        );
    }

    public boolean update(Newsletter newsletter)
    {
        String sql = """
            UPDATE newsletters SET
                email = :email,
                is_active = :active,
                subscribed_at = :subscribedAt
            WHERE id = :id
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(newsletter)
                        .execute() > 0
        );
    }

    public boolean delete(int id)
    {
        String sql = "DELETE FROM newsletters WHERE id = :id";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute() > 0
        );
    }
}
