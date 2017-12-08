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
import lib.RandomStringGenerator;

/**
 *
 * @author Martin
 */
@WebServlet(name = "SendResetPassServlet", urlPatterns = {"/SendResetPassServlet"})
public class SendResetPassServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        boolean sucessfullySent = false;

        String email = request.getParameter("email");
        RandomStringGenerator rsg = new RandomStringGenerator();
        String verificationCode = rsg.generateRandom();

        try {
            String sql = "UPDATE userAccount set resetVerification = ? WHERE email=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, verificationCode);
            ps.setString(2, email);
            ps.executeUpdate();
            System.out.println("check");
            sucessfullySent = true;

        } catch (SQLException e) {
            System.out.println("Driver not found " + e);
            sucessfullySent = false;
        }
        
        if (sucessfullySent) {
            response.sendRedirect("index.jsp");
        } else {
            // Add an error message and redirect the user under this line.
            response.sendRedirect("index.jsp");
        }
    }
}
