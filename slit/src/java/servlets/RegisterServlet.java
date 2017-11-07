package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import db.DBConnectionManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lib.CryptPassWithMD5;

/**
 *
 * @author Martin
 */
@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        CryptPassWithMD5 crypt = new CryptPassWithMD5();
        boolean successfulReg = false;
        boolean emailExists = false;
        
        
        try {
        String sql = "INSERT INTO userAccount(firstName, lastName, email, pass) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        String newFirstName = request.getParameter("firstName");
        String newLastName = request.getParameter("lastName");
        String newEmail = request.getParameter("email");
        String newPass = request.getParameter("password").toLowerCase();    // Makes the password lowercase, to avoid case sensitivity

        
            if(newPass.length() >= 4){
                // Use the crypt method from CryptPassWithMD5 to encrypt the password before putting it into the db.
                String encryptedPW = crypt.cryptWithMD5(newPass);
                ps.setString(1, newFirstName);
                ps.setString(2, newLastName);
                ps.setString(3, newEmail);
                ps.setString(4, encryptedPW);
                ps.executeUpdate();
                successfulReg = true;
            } else {
                request.setAttribute("error", "Registration was not successful.<br>Password has to be longer than 4 characters");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
                successfulReg = false;
            }
        
        
        } catch(SQLException e) {
            if(e instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException){
                request.setAttribute("error", "Email already exists");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
            
            System.out.println("Driver not found "+e);
            successfulReg = false;
        }
        
        if(successfulReg){
            response.sendRedirect("index.jsp");
        }
    }

}
