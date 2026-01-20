package dao.admin.product;

import dao.JDBIConnector;
import model.product.Brand;

import java.util.List;

public class BrandDao
{
    public List<Brand> findAll()
    {
        String sql = "SELECT * FROM brand";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Brand.class)
                        .list()
        );
    }
    public Brand findById(int id)
    {
        String sql = "SELECT * FROM brand WHERE id = :id";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Brand.class)
                        .findOne()
                        .orElse(null)
        );
    }
    public boolean insert(Brand brand)
    {
        String sql = """
                INSERT INTO brand
                (id, name, logoURL)
                VALUES
                (:id, :name, :logoURL)""";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(brand)
                        .execute() > 0
        );
    }
    public boolean update(Brand brand)
    {
        String sql = """
                UPDATE brand SET
                name = :name
                logoURL =: logoURL
                WHERE id = :id
                """;
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(brand)
                        .execute() > 0
        );
    }
}
