package lib;

import db.DBConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *  This class holds a method which creates a sql query
 *  based on the parameters int user and int module.
 *  With this information the points from one hand-in
 *  is returned.
 * 
 * @author Christoffer
 */
public class ClassOverview {
    public static int points;
    
    public static int getModulePoints(int user, int module){
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        
        try{
            String testSQL = "select points from handIn inner join userAccount on handIn.u_id=userAccount.id WHERE u_id = ? and m_id = ?";
            ps = conn.prepareStatement(testSQL);     
            ps.setInt(1, user);
            ps.setInt(2, module);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                points = rs.getInt("points");
            } else if (!rs.next()) {
                points = 0;
            }
        } catch (SQLException e) {
            System.out.println("Driver not found "+ e);
        }
        return points;
    }
}