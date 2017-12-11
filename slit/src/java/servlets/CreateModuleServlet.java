package servlets;

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
import lib.ValidateModule;

/**
 * Whith the help of the DB
 * connentor we are able to execute insertions and statments from
 * the servlets. This servlet is responisble for transfering data from the UI
 * too the database and creating a new Module with that data. 
 * 
 * @author Christoffer
 */
@WebServlet(name = "CreateModuleServlet", urlPatterns = {"/CreateModuleServlet"})
public class CreateModuleServlet extends HttpServlet {
    
    /**
     * Processes requests for HTTP <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        //MySQL Workbench Database Conector
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        
        try {
            String sql = "INSERT INTO module(id, title, description, goals, resources, task, deadline) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            
            //Pulling data from the input fields
            String stringId = request.getParameter("moduleNumber");
            String newTitle = request.getParameter("moduleTitle");
            String newDescritption = request.getParameter("moduleDescription");
            String newGoal = request.getParameter("moduleGoals");
            String newResource = request.getParameter("moduleResource");
            String newTask = request.getParameter("moduleTask");
            String stringDeadline= request.getParameter("moduleDeadline");
        
            //Converters
            int newId = Integer.parseInt(stringId);
                  
            if(ValidateModule.checkId(newId)){
                request.setAttribute("error", "Duplicate Module Number");
                
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
                
                response.sendRedirect("home.jsp");
            }
        } catch(SQLException e){
            System.out.println("Driver not found "+ e);
        }
    }
}