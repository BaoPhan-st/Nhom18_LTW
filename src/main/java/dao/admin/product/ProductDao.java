package dao.admin.product;

import dao.JDBIConnector;
import model.product.Product;

import java.util.List;

public class ProductDao
{
    public List<Product> findAll()
    {
        String sql = "SELECT * FROM products";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public Product findById(int id)
    {
        String sql = "SELECT * FROM products WHERE id = :id";
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Product.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public boolean insert(Product product)
    {
        String sql = """
            INSERT INTO products
            (name, description, price, brand_id, added_at, is_discontinue, is_available)
            VALUES (:name, :description, :price, :brandID, :addedAt, :discontinue, :available)
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(product)
                        .execute() > 0
        );
    }

    public boolean update(Product product)
    {
        String sql = """
            UPDATE products SET
                name = :name,
                description = :description,
                price = :price,
                brand_id = :brandID,
                added_at = :addedAt,
                is_discontinue = :discontinue,
                is_available = :available
            WHERE id = :id
        """;

        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(product)
                        .execute() > 0
        );
    }

    public boolean delete(int id)
    {
        String sql = """
            UPDATE products
            SET is_available = false,
                is_discontinue = true
            WHERE id = :id
        """;
        return JDBIConnector.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute() > 0
        );
    }
    public List<Product> findWithFilter(Integer id, String name, Integer brandId)
    {
        StringBuilder sbSQL = new StringBuilder("""
                SELECT *
                FROM products
                WHERE is_avaiable = true
                """);
        if (id != null) sbSQL.append(" AND id = :id");
        if (name != null) sbSQL.append(" AND name = :name");
        if (brandId != null) sbSQL.append(" AND brand_id = :brandId");

        return JDBIConnector.getJdbi().withHandle(handle -> {
           var query = handle.createQuery(sbSQL.toString());
           if (id != null) query.bind("id", id);
           if (name != null) query.bind("name", name);
           if (brandId != null) query.bind("brandId", brandId);

           return query.mapToBean(Product.class).list();
        });
    }
}
