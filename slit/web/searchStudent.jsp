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
<div class="row">
    <div class="searchSection">
        <form method="POST" action="SearchServlet">

            <input type="text" name="searchName" placeholder="Enter name to search for">
            <input type="submit" value="Search">
        </form>
    </div>
</div>
<div class="row">
    <div class="searchResult">
        <%
            if (request.getAttribute("searchList") != null) {
                ArrayList<String> searchList = (ArrayList) request.getAttribute("searchList");
                System.out.println(searchList);
                for (int i = 0; i < searchList.size(); i++) {
                    out.println("<a href='#'>"+searchList.get(i)+"</a>");
                    out.println("<br>");
                    out.println("<br>");
                }
            }

        %>
    </div>
</div>
</body>


