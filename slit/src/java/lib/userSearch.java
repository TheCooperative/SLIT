/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.DBConnectionManager;

/**
 *
 * @author Martin
 */
public class userSearch {
    public static String fname;
    public static String lname;
    public static String fullName;
    public static ArrayList<String> StudentName;
    
    public static ArrayList<String> searchUser(String searchName){
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
       
        StudentName = new ArrayList<String>();
        try {
            String sql = "SELECT firstName, lastName FROM useraccount WHERE (firstName LIKE '%" +searchName+ "%' OR lastName LIKE '%" +searchName+ "%')";
            
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                fname = rs.getString("firstName");
                lname = rs.getString("lastName");
                fullName = fname + " " + lname;
                StudentName.add(fullName);
            }

            return StudentName;
            
        } catch (SQLException e) {
            System.out.println("Dette gikk ikke helt etter planen" + e);
            e.printStackTrace();
            
        }
        return null;
    }
}
