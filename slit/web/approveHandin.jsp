<%-- 
    Document   : message
    Created on : 10.nov.2017, 10:00:34
    Author     : Joakim Meisner
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConnectionManager"%>
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
                <select name="moduleId">
<%
                    while (rs.next()) { System.out.println(rs.getString("id"));
%>
                    <option value=<%= rs.getInt("id")%>>Module <%= rs.getString("id")%></option>
<%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
%>
                </select>
            </div>
        </div>

<%
                try {
                    String sql1 = "select id, firstName, lastName from useraccount where role = 0";
                    ps = conn.prepareStatement(sql1);

                    ResultSet rs1 = ps.executeQuery(sql1);
%> 

        <div class="row">
            <div class="box">
            <h2>Choose Student</h2>
                <select name="studentId">
<%
                    while (rs1.next()) { System.out.println(rs1.getString("id"));
%>
                    <option value=<%= rs1.getInt("id")%>> <%= rs1.getString("firstName")%> <%= rs1.getString("lastName")%> </option> 
<%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
%>
                </select>
            </div>
        </div>

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
        
        <br><br>

        <textarea rows="6" cols="60" name = "feedback" placeholder="Comment" required></textarea>
        
        <br>

        <textarea rows="6" cols="60" name ="notes" placeholder="Write notes for yourself" required></textarea>
        
        <br>
        
        <input type="submit" value="submit">
        </form>    
    </body>