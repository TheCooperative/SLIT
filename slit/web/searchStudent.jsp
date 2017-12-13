<%-- 
    Document   : searchStudent
    Created on : 11.des.2017, 19:42:46
    Author     : Krist
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConnectionManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.jsp.JspWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:include page="includes/header.jsp"></jsp:include>
<%
    // If the user is not signed in, redirect the user to index.jsp (login/registration page)
    if (session.getAttribute("id") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<form method="POST" action="Search" enctype="multipart/form-data">

    <input type="text" name="nameToSearchFor" placeholder="Search">
    <input type="submit" value="Search">
</form>
<%
    if (request.getAttribute("searchList") != null) {
        ArrayList searchList = (ArrayList) request.getAttribute("searchList");
        for (int i = 0; i < searchList.size(); i++) {
            
            out.println(searchList.get(i));
            out.println("<br>");
            
            
            
        }
    }
            
      
%>

</body>


