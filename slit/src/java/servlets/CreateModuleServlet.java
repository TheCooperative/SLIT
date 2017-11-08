package servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.DBConnectionManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Christoffer
 */
@WebServlet(name = "CreateModuleServlet", urlPatterns = {"/CreateModuleServlet"})
public class CreateModuleServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        boolean createdModule = false;
        
        try {
            String sql = "INSERT INTO module(id, title, description, goals, resources, task, deadline) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            
            String stringId = request.getParameter("moduleNumber");
            String newTitle = request.getParameter("moduleTitle");
            String newDescritption = request.getParameter("moduleDescription");
            String newGoal = request.getParameter("moduleGoals");
            String newResource = request.getParameter("moduleResource");
            String newTask = request.getParameter("moduleTask");
            String stringDeadline= request.getParameter("moduleDeadline");
            
            //Converters
            int newId = Integer.parseInt(stringId);
                        
            if(stringDeadline.isEmpty()){
                request.setAttribute("regError", "A deadline is required");
                RequestDispatcher rd = request.getRequestDispatcher("createModule.jsp");
                rd.include(request, response);
            } else {
                ps.setInt(1, newId);
                ps.setString(2, newTitle);
                ps.setString(3, newDescritption);
                ps.setString(4, newGoal);
                ps.setString(5, newResource);
                ps.setString(6, newTask);
                ps.setDate(7, Date.valueOf(stringDeadline));
                ps.executeUpdate();
                createdModule = true;
            }
        } catch(SQLException e){
            System.out.println("Driver not found "+e);
            createdModule = false;
        }
        
        if(createdModule){
            response.sendRedirect("home.jsp");
        }
    }
}
