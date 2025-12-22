import java.sql.*;
import java.util.*;

public class ProductDAO {
    private static Connection getConnection() throws SQLException {
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/webshoesDB");
            return ds.getConnection();
        } catch (NamingException e) {
            throw new SQLException("Database connection failed.", e);
        }
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM product";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setBrandID(rs.getInt("brandID"));
                product.setDate_add(rs.getDate("date_add"));
                product.setExp(rs.getDate("exp"));
                product.setAvailable(rs.getBoolean("available"));
                product.setActive(rs.getString("active"));

                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
