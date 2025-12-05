package listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // This method is called when the web application is initialized.
        // We don't need to do anything here for this specific problem.
        System.out.println("Application context initialized.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // This method is called when the web application is about to be shut down.
        System.out.println("Application context destroyed. Cleaning up resources...");

        // 1. Shutdown the AbandonedConnectionCleanupThread from MySQL Connector/J
        try {
            System.out.println("Shutting down MySQL AbandonedConnectionCleanupThread...");
            AbandonedConnectionCleanupThread.uncheckedShutdown();
            System.out.println("MySQL cleanup thread shutdown successful.");
        } catch (Exception e) {
            System.err.println("Error shutting down MySQL cleanup thread: " + e.getMessage());
            e.printStackTrace();
        }

        // 2. Deregister JDBC drivers
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                // Only deregister drivers loaded by this webapp's classloader
                if (driver.getClass().getClassLoader() == getClass().getClassLoader()) {
                    System.out.println("Deregistering JDBC driver: " + driver);
                    DriverManager.deregisterDriver(driver);
                } else {
                    System.out.println("Not deregistering JDBC driver (not from this webapp): " + driver);
                }
            } catch (SQLException e) {
                System.err.println("Error deregistering JDBC driver " + driver + ": " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}
