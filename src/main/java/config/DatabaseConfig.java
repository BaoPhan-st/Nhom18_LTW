package config;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import org.jdbi.v3.core.Jdbi;

@WebListener
public class DatabaseConfig implements ServletContextListener
{

    @Override
    public void contextInitialized(ServletContextEvent sce)
    {

        Jdbi jdbi = Jdbi.create(
                "jdbc:mysql://localhost:3306/shopshoes",
                "root",
                ""
        );

        sce.getServletContext().setAttribute("jdbi", jdbi);
    }
}
