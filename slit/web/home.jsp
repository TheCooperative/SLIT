<%-- 
    Document   : home.jsp
    Created on : 12.okt.2017, 23:54:47
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="includes/header.jsp"></jsp:include>
        <% 
            // If the user is not signed in, redirect the user to index.jsp
            if(session.getAttribute("id")==null){
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>Hello ${firstName} ${lastName}</h1><br>
            User ID: ${id}<br>
            Email: ${email}<br>
            role: ${role}<br>
            last logged in: ${lastLogin}<br>
        
        <a href="createModule.jsp">Click here to add new Module</a>
        <a href="fileUpload.jsp">Click here to upload new Module</a>
        
    </body>
</html>
