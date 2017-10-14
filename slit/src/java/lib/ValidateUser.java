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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;


/**
 *
 * @author Martin
 */
public class ValidateUser {
        public static int id;
        public static String firstName;
        public static String lastName;
        public static int role;
        public static Timestamp lastLogin;
        public static String lastLoginTime;

    public static boolean checkUser(String email, String pass){
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        
        
        
        boolean st = false;
        try {
        String sql = "SELECT * FROM userAccount where email=? and pass=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();
        st = rs.next();
        
        // Getting the attributes for Firstname Lastname role and ID.
        if(st){
            id = rs.getInt("id");
            firstName = rs.getString("firstName");
            lastName = rs.getString("lastName");
            role = rs.getInt("role");
            
            lastLogin = rs.getTimestamp("lastLogin");
            lastLoginTime = new SimpleDateFormat("dd.MM.yyyy - HH:mm").format(lastLogin);

        }
        } catch(SQLException e) {
          System.out.println("Driver not found "+e);
        }
        
        return st;
    }
}
