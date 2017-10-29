<%-- 
    Document   : resetPass
    Created on : 19.okt.2017, 16:02:17
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
        <form method="post" action="ResetPassServlet">
         <input type="text" name="email" placeholder="Enter Email"><br>
         <input type="password" name="password" placeholder="Enter password"><br>
         <input type="text" name="verification" placeholder="Enter verification code"><br>
         <input type="submit" value="Change password">
        </form>
    </body>
</html>
