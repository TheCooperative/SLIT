/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import db.DBConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
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
            ResultSet test = ps.executeQuery();
            while(test.next()){
                points = test.getInt("points");  
            } 

        } catch (SQLException e) {
            System.out.println("Driver not found "+ e);
        }
        //System.out.println(points + " from get Module Points");
        return points;
    }
}
