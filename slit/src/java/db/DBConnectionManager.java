package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Martin
 */
public class DBConnectionManager {

    private static String url = "jdbc:mysql://localhost:3306/slitdb?useSSL=false";
    private static String DBuser = "root";
    private static String DBpass = "root";
    private static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
            // log an exception. for example:
            System.out.println("Driver not found.");
        }
            try {
                conn = DriverManager.getConnection(url, DBuser, DBpass);
                
            } catch (SQLException e) {
                System.out.println("Failed to connect to DB");
            }
        return conn;
    }
}
