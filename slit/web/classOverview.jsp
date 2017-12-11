<%-- 
    Document   : classOverview
    Created on : 13.nov.2017, 10:49:55
    Author     : Christoffer
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="lib.ClassOverview"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnectionManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<%
    Connection conn;
    PreparedStatement ps;
    conn = DBConnectionManager.getConnection();    
%>
    </head>
    <body>
        <table border="1">
            <tr>
                <td>Student:</td>
                <td> Modul: 1 </td>
                <td> Modul: 2 </td>
                <td> Modul: 3 </td>
                <td> Modul: 4 </td>
                <td> Modul: 5 </td>
            </tr>
<%
    try{
        String sql1 = "select lastName, firstName, u_id from handIn inner join userAccount on handIn.u_id=userAccount.id group by u_id ORDER BY lastName asc;";
        ps = conn.prepareStatement(sql1);
            
        ResultSet rs = ps.executeQuery();
            
        //Places all students in the student list.
        while(rs.next()){
%>
            <tr>
                <td><%=rs.getString("lastName")%>, <%=rs.getString("firstName")%></td>
<%
            //Gets the points on each module
            for(int stepper = 0; stepper <= 4; stepper ++){
                int temp = ClassOverview.getModulePoints(rs.getInt("u_id"), stepper+1);
%>
                <td><%= temp %></td>
<%
            }
%>
            </tr>
<%
        }
    } catch (SQLException e) {
        System.out.println("Driver not found "+ e);
    }
%>
        </table>
    </body>
</html>