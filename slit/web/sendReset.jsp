<%-- 
    Document   : sendReset
    Created on : 19.okt.2017, 15:54:15
    Author     : marvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="SendResetPassServlet"></form>
        <input type="text" name="email" placeholder="Enter Email"><br>
        <input type="submit" value="Send">
    </body>
</html>
