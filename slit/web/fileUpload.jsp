<%-- 
    Document   : fileUpload
    Created on : Oct 27, 2017, 11:44:33 AM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Page</title>
    </head>
    <body>
        <% 
            // If the user is notsigned in, redirect the user to index.jsp
            if(session.getAttribute("id")==null){
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>File upload</h1>
        
        <form method="post" action="fileUpload" enctype="multipart/form-data">
            <input type="text" name="fileName" placeholder="File name here"><br>
            <input type="file" name="fileBlob">
            <input type="submit" value="upload">
        </form>
    </body>
</html>
