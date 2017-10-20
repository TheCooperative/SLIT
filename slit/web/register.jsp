<%-- 
    Document   : register.jsp
    Created on : 12.okt.2017, 13:54:12
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Register page</h1>
            
        <form method="post" action="RegisterServlet">
            <input type="text" name="firstName" placeholder="Enter first name" required><br>
            <input type="text" name="lastName" placeholder="Enter last name" required><br>
            <input type="email" name="email" placeholder="Enter email" required><br>
            <input type="password" name="password" placeholder="Enter password" required><br>
            <input type="submit" name="registerButton" value="register">
        </form>
        <%
            String register_error=(String)request.getAttribute("regError");
            if(register_error!=null){
                out.println("<p style='color:red;'>"+register_error+"</p>");
            }
        %>
        
        <a href="index.jsp">Go back to login page</a>
    </body>
</html>
