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
import lib.userSearch;

/**
 *
 * @author Krist
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("searchName");
        userSearch.searchUser(searchName);
        
        if(userSearch.StudentName.size() > 0){
        request.setAttribute("searchList", userSearch.StudentName);
        RequestDispatcher rd = request.getRequestDispatcher("searchStudent.jsp");
        rd.include(request, response);
        
        } else {
            request.setAttribute("error", "No user with that name was found");
            RequestDispatcher rd = request.getRequestDispatcher("searchStudent.jsp");
            rd.include(request, response);
        }
        

    }
}
