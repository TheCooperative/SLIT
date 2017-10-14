<%-- 
    Document   : login
    Created on : 12.okt.2017, 23:34:58
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            // If the user is already signed in, redirect the user to home.jsp
            if(session.getAttribute("id")!=null){
                response.sendRedirect("home.jsp");
            }
        %>
        <h1>Login page</h1>
        <form method="post" action="LoginServlet">
            <input type="text" name="email" placeholder="Enter Email"><br>
            <input type="password" name="password" placeholder="Enter password"><br>
            <input type="submit" value="Login">
        </form>
        <%
            String login_error=(String)request.getAttribute("error");
            if(login_error!=null){
                out.println("<p style='color:red;'>"+login_error+"</p>");
            }
        %>
        <a href="register.jsp">Click here to register</a>
        
    </body>
</html>
