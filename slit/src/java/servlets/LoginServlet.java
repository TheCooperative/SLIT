/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lib.CryptPassWithMD5;
import lib.ValidateUser;

/**
 *
 * @author Martin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    CryptPassWithMD5 crypt = new CryptPassWithMD5();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String email = request.getParameter("email");
        String pass = request.getParameter("password").toLowerCase(); // Makes the password lowercase to avoid case sensitivity.
        String cryptPass = crypt.cryptWithMD5(pass);// crypts password with MD5 so we can use it to see if it matches the crypted pw in db.
        
        if(ValidateUser.checkUser(email, cryptPass)){
            // If login is sucessful sets attributes for id, firstname, lastname, role, email and redirects to homepage.
            HttpSession session = request.getSession(true);
            session.setAttribute("id", ValidateUser.id);
            session.setAttribute("firstName", ValidateUser.firstName);
            session.setAttribute("lastName", ValidateUser.lastName);
            session.setAttribute("email", email);
            session.setAttribute("lastLogin", ValidateUser.lastLoginTime);
            // If the user role is equal to 0 the user is a Student. If it's a higher number the user is a Teacher.
            if(ValidateUser.role == 0){
            session.setAttribute("role", "Student");
            } else {
                session.setAttribute("role", "Teacher");
            }
            
            response.sendRedirect("home.jsp");
            
        } else {
            request.setAttribute("error", "Wrong username or password");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
        }
        
    }

}
