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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Martin
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        HttpSession session = request.getSession();
        
        int u_id = (int) session.getAttribute("id");
        
        try {
            String sql = "update userAccount set lastLogin = now() where id = "+ u_id;
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Driver not found "+e);
        }
        
        session.removeAttribute("email");
        session.removeAttribute("firstName");
        session.removeAttribute("lastName");
        session.removeAttribute("id");
        session.removeAttribute("role");
        session.invalidate();
        response.sendRedirect("index.jsp");
    }

}
