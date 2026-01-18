package dao.admin.user;

import dao.JDBIConnector;
import model.product.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao
{
    public List<Product> findAll()
    {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection cn = JDBIConnector.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery())
        {
            while(rs.next())
            {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return products;
    }

    public Product findById(int id)
    {
        String sql = "SELECT * FROM products where id = ?";
        Product product = null;

        try (Connection cn = JDBIConnector.getConnection();
            PreparedStatement ps = cn.prepareStatement(sql))
        {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next())
            {
                product = mapResultSetToProduct(rs);
            }
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        return product;
    }

    public boolean insert(Product product)
    {
        String sql = "INSERT INTO products (id, name, description, price, brand_id, added_at, is_discontinue, is_available) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection cn = JDBIConnector.getConnection();
            PreparedStatement ps = cn.prepareStatement(sql))
        {
            ps.setInt(1, product.getId());
            ps.setString(2, product.getName());
            ps.setString(3, product.getDescription());
            ps.setBigDecimal(4, product.getPrice());
            ps.setInt(5, product.getBrandID());
            ps.setTime(6, product.getAddedAt());
            ps.setBoolean(7, product.isDiscontinue());
            ps.setBoolean(8, product.isAvailable());

            return ps.executeUpdate() > 0;
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update (Product product)
    {
        String sql = "UPDATE products SET name = ?, description = ?, price = ?, brand_id = ?, added_at = ?, is_discontinue = ?, is_available = ? WHERE id = ?";
        try (Connection cn = JDBIConnector.getConnection();
        PreparedStatement ps = cn.prepareStatement(sql))
        {
            ps.setInt(1, product.getId());
            ps.setString(2, product.getName());
            ps.setString(3, product.getDescription());
            ps.setBigDecimal(6, product.getPrice());
            ps.setInt(4, product.getBrandID());
            ps.setTime(5, product.getAddedAt());
            ps.setBoolean(7, product.isDiscontinue());
            ps.setBoolean(8, product.isAvailable());

            return ps.executeUpdate() > 0;
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete (int id)
    {
        String sql = "DELETE FROM products WHERE id = ?";

        try (Connection cn = JDBIConnector.getConnection();
        PreparedStatement ps = cn.prepareStatement(sql))
        {
            ps.setInt(1, id);

            return  ps.executeUpdate() > 0;
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public Product mapResultSetToProduct(ResultSet rs) throws  Exception
    {
        Product product = new Product();

        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setDescription(rs.getString("description"));
        product.setPrice(rs.getBigDecimal("price"));
        product.setBrandID(rs.getInt("brand_id"));
        product.setAddedAt(rs.getTime("added_at"));
        product.setDiscontinue(rs.getBoolean("is_discontinue"));
        product.setIsAvailable(rs.getBoolean("is_available"));

        return product;
    }

    public static void main (String[] args)
    {
        ProductDao dao = new ProductDao();

        List<Product> products = dao.findAll();
        for(Product product : products)
        {
            System.out.println(product.toString());
        }
        Product p = dao.findById(1011);
        if (p == null) return;
        System.out.println(p.toString());
    }
}
