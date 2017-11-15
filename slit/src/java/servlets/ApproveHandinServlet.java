/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.DBConnectionManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.CryptPassWithMD5;

/**
 *
 * @author Joakim
 */
@WebServlet(name = "ApproveHandinServlet", urlPatterns = {"/ApproveHandinServlet"})
public class ApproveHandinServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        CryptPassWithMD5 crypt = new CryptPassWithMD5();
        
        
        
        try {
            String sql ="UPDATE handin set feedback = ?, notes = ?, points = ? where m_id = ? and u_id = ?";
            ps = conn.prepareStatement(sql);
            String m_id = request.getParameter("moduleId");
            String u_id = request.getParameter("userId");
            
            String newFeedback = request.getParameter("feedback");
            String newNotes = request.getParameter ("notes");
            String Points = request.getParameter ("points");
            int newPoints = Integer.valueOf(Points);
            
            
            
                ps.setString(1, newFeedback);
                ps.setString(2, newNotes);
                ps.setInt(3, newPoints);
                ps.setString(4, m_id);
                ps.setString(5, u_id);
                ps.executeUpdate();
                
                        
            }
        
        
                
        catch (SQLException e){
            
            System.out.println("Driver not found "+e);
            
            
        }
        


    }
    
    
}

