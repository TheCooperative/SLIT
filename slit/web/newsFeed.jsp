<%-- 
    Document   : message
    Created on : 10.nov.2017, 12:04:51
    Author     : Marius Vika
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="includes/header.jsp"></jsp:include>
    
    <center>
<%
// If the user is not signed in, redirect the user to index.jsp
    if (session.getAttribute("id") == null) {
        response.sendRedirect("index.jsp");
    }
    if (session.getAttribute("role") == "Teacher"){
   %>
        
        <h1>News from teachers</h1>
        <form method="post" action="newsServlet">
            <textarea name="message" placeholder='message'></textarea>
            <input type="submit" value="publish">
        </form>
        
<%
    } 
%>
        <h1>News</h1>
        <table border="1">
            <tr>
                <td>Date</td>
                <td>Author</td>
                <td>Message</td>
            </tr>
<%
        Connection conn = DBConnectionManager.getConnection();
        PreparedStatement ps;
            
        try {
            String sql = "SELECT userID, timePosted, message, userAccount.firstName FROM news INNER JOIN userAccount on userID = userAccount.id";
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            
            while (rs.next()) {
%>
            <tr>
                <td><%=rs.getDate("timePosted") %></td>
                <td><%=rs.getString("firstName")%></td>
                <td><%=rs.getString("message")%></td>
            </tr>     
<%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
%>
        </table>
    </center>
</body>
</html>
