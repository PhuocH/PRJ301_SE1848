package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    
    public static Connection getConnection() throws Exception {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionString = "jdbc:sqlserver://localhost:1433;database=MyStock";
            Connection cnn = DriverManager.getConnection(connectionString, "sa", "123");
            return cnn;
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        }
    }
}
