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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Krist
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
       
        try {

            String sql = "select firstName from useraccount where firstName=?";
            String searchName = "";
            searchName = request.getParameter("nameToSearchFor");
            ps = conn.prepareStatement(sql);
            ps.setString(1, searchName);
            
            ResultSet rs = ps.executeQuery(sql);
            ArrayList<String> StudentName = new ArrayList();

            while (rs.next()) {

                String name = rs.getString("firstName");

                StudentName.add(name);

            }
            
            request.setAttribute("searchList", StudentName);
            RequestDispatcher rd = request.getRequestDispatcher("searchStudent.jsp");
            rd.include(request, response);

            
       
        } catch (SQLException e) {
            System.out.println("Dette gikk ikke helt etter planen" + e);
            e.printStackTrace();
            
        }
        
    }
}
