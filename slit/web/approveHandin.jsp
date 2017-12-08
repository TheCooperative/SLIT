<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <title>Approve Handin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            textarea {
                max-width:300px;
                min-width:200px;
                width:250px; 
            }
        </style>
    </head>

    <body>
        <form action="ApproveHandinServlet" method="POST">
<%
                Connection conn;
                PreparedStatement ps;
                conn = DBConnectionManager.getConnection();
                try {
                    String sql = "select id from module";
                    ps = conn.prepareStatement(sql);

                    ResultSet rs = ps.executeQuery(sql);
%> 

        <div class="row">
        <div class="box">
            <h2>Choose module</h2>
                <form method="post" action="fileUpload" enctype="multipart/form-data">
                    <select name="moduleId">
<%
                    while (rs.next()) {
%>
                        <option value=<%= rs.getString("id")%>>Module <%= rs.getString("id")%></option>
<%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
%>
                    </select>

            <h2>Choose Student</h2>
            <select name="userId">
                <option value ="1">1</option>
                <option value ="2">2</option>
                <option value ="3">3</option>
            </select>
        
            <h2>Choose Score</h2>
            <select name = "points">
                <option value ="1">1</option>
                <option value ="2">2</option>
                <option value ="3">3</option>
                <option value ="4">4</option>
                <option value ="5">5</option>
                <option value ="6">6</option>
                <option value ="7">7</option>
                <option value ="8">8</option>
                <option value ="9">9</option>
                <option value ="10">10</option>
            </select>

            <input type="submit" value="submit"> <p>
               
            </p>
            
            <textarea rows="6" cols="60" name = "feedback" placeholder="Comment"></textarea> <p>
                
            </p>
            
            <textarea rows="6" cols="60" name ="notes" placeholder="Write notes for yourself"></textarea>
   
        </form>    
    </body>
    


