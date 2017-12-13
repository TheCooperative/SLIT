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
import javax.servlet.http.HttpSession;

/**
 *
 * @author marvi
 */
@WebServlet(name = "newsServlet", urlPatterns = {"/newsServlet"})
public class newsServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        
        HttpSession session = request.getSession(true);
         
        try {
            String sql = "INSERT INTO news(userID, message, timePosted) VALUES (?, ?, now())";
            ps = conn.prepareStatement(sql);
            
            int userID = (Integer) session.getAttribute("id");
            String msg = request.getParameter("message");
            
            System.out.println(userID);
            System.out.println(msg);
            
            ps.setInt(1, userID);
            ps.setString(2, msg);
            ps.executeUpdate();
            
        }
        
        catch(SQLException e) {
            System.out.println("Driver not found"+e);
        }
        response.sendRedirect("newsFeed.jsp");
        }
}
