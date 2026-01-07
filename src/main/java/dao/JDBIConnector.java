package dao;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.CaseStrategy;
import org.jdbi.v3.core.mapper.reflect.ReflectionMappers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBIConnector {

    private static Jdbi jdbi;

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            connect();
        }
        return jdbi;
    }

    private static void connect() {
        MysqlDataSource ds = new MysqlDataSource();

            ds.setUrl("jdbc:mysql://localhost:3306/shopshoes?useSSL=false&serverTimezone=Asia/Ho_Chi_Minh");
            ds.setUser("root");
            ds.setPassword("");

        try {
            ds.setAutoReconnect(true);
            ds.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        jdbi = Jdbi.create(ds);



    }

    // Test nhanh kết nối DB
    public static void main(String[] args) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        jdbi.useHandle(h -> {
            int count = h.createQuery("SELECT COUNT(*) FROM users")
                    .mapTo(int.class)
                    .one();
            System.out.println("Users = " + count);
        });
    }

    public static Connection getConnection ()
    {
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/shopshoes?useSSL=false&serverTimezone=Asia/Ho_Chi_Minh", "hung", "");
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }
}
