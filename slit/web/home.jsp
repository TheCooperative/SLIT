<%-- 
    Document   : home.jsp
    Created on : 12.okt.2017, 23:54:47
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
            // If the user is notsigned in, redirect the user to index.jsp
            if(session.getAttribute("id")==null){
                response.sendRedirect("index.jsp");
            }
        %>
        
        <h1>Hello ${firstName} ${lastName}</h1><br>
        <p>UserID: ${id}<br>
            Email: ${email}<br>
            role: ${role}<br>
            last logged in: ${lastLogin}<br></p>
        
        <a href="createModule.jsp">Click here to add new Module</a>
        
        <form method="get" action="LogoutServlet" >
            <input type="submit" name="logout" value="logout">
        </form>
    </body>
</html>
