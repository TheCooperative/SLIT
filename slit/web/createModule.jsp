<%-- 
    Document   : createModule
    Created on : 17.okt.2017, 22:55:10
    Author     : Christoffer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>     
<!DOCTYPE html>
<html>
    <head>
        <title>Create Module</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                display: block;
                margin: auto;
                width: 50%;
                border: 3px solid black;
                padding: 10px;
            }
            h5{
                text-align: left;
                padding-top: 1em;
                padding-left: 20%;
                padding-right: 0;
                padding-bottom: 2px;
                margin: 0;
                text-decoration: underline;
            }
            textarea{
                height: auto;
                width: 60%;
            }
            #design{
                float: left;
                padding-left: 19.5%;
            }
        </style>
    </head>
    
    <body><center>
        <%
            // If the user is already signed in, redirect the user to index.jsp
            // Else if the user is a student return user to home, as students dont have access
            if (session.getAttribute("id") == null) {
                response.sendRedirect("index.jsp");
            } else if((String) session.getAttribute("role") == "Student"){
                response.sendRedirect("home.jsp");
            }
        %>
        <form method="post" action="CreateModuleServlet">
            <h2>Create a new Module</h2>
            
            <h5>Select number and title:</h5>
            <div id="design">
            <input type="number" name="moduleNumber" placeholder="Num" min="1" max="20" required>
            <input type="text" name="moduleTitle" placeholder="Module Title" required>
            </div>
            
            <%
            String duplicate_error=(String)request.getAttribute("error");
            if(duplicate_error!=null){
                out.println("<p style='color:red;'>"+duplicate_error+"</p>");
            }
            %>

            <br>
            
            <h5>Description:</h5>
            <textarea name="moduleDescription" rows="5" placeholder="Write Description.."></textarea> <br />
                    
            <h5>Learning Goals:</h5>
            <textarea name="moduleGoals" rows="5" placeholder="Learning Goals.."></textarea> <br />
            
            <h5>Resources:</h5>
            <textarea name="moduleResource" rows="5" placeholder="Recources.."></textarea> <br />
            
            <h5>Task:</h5>
            <textarea name="moduleTask" rows="5" placeholder="Task.."></textarea> <br />
            
            <h5>Deadline:</h5>
            <input type="date" name="moduleDeadline" required> <br />
            
            <br>
            
            <input type="submit" name="moduleCreate" value="Create Module">
        </form>        
    </center></body>
</html>