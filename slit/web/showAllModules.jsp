<%-- 
    Document   : showAllModules
    Created on : 02.nov.2017, 16:08:12
    Author     : Krist
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConnectionManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        Connection conn;
        PreparedStatement ps;
        conn = DBConnectionManager.getConnection();
        %>
    </head>
    <body>
        <h1>Retrieve data from database in jsp</h1>
        <table border="1">
        <tr>
        <td>Modul</td>
        <td>Title</td>
        <td>Deadline</td>
        <td>Hand-in</td>
        </tr>
        
        <%
        try{
        String sql ="select * from module";    
        ps = conn.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery(sql);
        %>
        <%
        while(rs.next()){
        %>
        
        <tr>   
        <td><a href="singleModule.jsp" name="mod_link">Modul: <%=rs.getString("id")%></a></td>
        <td><%=rs.getString("id") %></td>
        <td><%=rs.getString("title") %></td>
        <td><%=rs.getString("description") %></td>
        <td><%=rs.getString("goals") %></td>
        <td><%=rs.getString("resources") %></td>
        <td><%=rs.getString("task") %></td>
        <td><%=rs.getString("deadline") %></td>
        </tr>
        
        <%
            }
        conn.close();
        }
        catch (Exception e) {
        e.printStackTrace();
        }
        %>
        </table>
    </body>
</html>







