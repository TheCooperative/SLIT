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
 * Is responsible for checking and stopping a teacher, 
 * if they are trying to create a duplicate module.
 * If it is a new module nothing happens and returns.
 * 
 * @author Christoffer
 */
public class ValidateModule {
    public static int id;
    
    public static boolean checkId(int newId){
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        
        boolean bool = false;
        
        try{
            String sql = "SELECT id FROM module where id=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, newId);
            ResultSet rs = ps.executeQuery();
            bool = rs.next();
            
            if(bool){
                id = rs.getInt("id");  
            } 
        } catch(SQLException e) {
            System.out.println("Driver not found "+e);
        }        
        return bool;
    }
}