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
        <title>SLIT</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="js/slide.js"></script>

        <style>
            form {
                text-align: center;
            }

            html, body {
                height: 100%;
                min-height: 100%;
                font-family: 'Roboto Condensed', sans-serif;
            }

            body{
                margin: 0;
                padding: 0;
            }

            a {
                text-decoration: none;
                color: #3498db;
            }
            a:hover, a:visited {
                color: #3498db;
            }

            .login_box {
                position: relative;
                margin-right: auto;
                margin-left: auto;
                top: 7%;
                width: 35%;
                background-color: #ffffff;
                border: 1px solid #EDEDED;
                padding: 5px;
                box-shadow: #727272 0px 0px 4px;
            }

            .login_header {
                width: 100%;
                height: 90px;
                background-color: #5C80BC;
                text-align: center;
                color: #F9F8F8;
            }

            .login_header h1 {
                margin-top: 0;
                margin-bottom: 0;
                padding-top: 12px;
                color: #FFFFFF;
                font-size: 250%;
            }

            input[type="submit"] {
                background-color: #3498db;
                border: none;
                border-radius: 3px;
                margin: 5px 0 10px 0;
                padding: 5px 10px 5px 10px;
                color: #ffffff;
            }
            input[type="submit"]:hover {
                box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.25);
            }
            
            h3 {
                color: #d3d3d3;
            }
            
            input[type="text"], input[type="email"], input[type="password"] {
                border: 1px solid #e5e5e5;
                margin-top: 5px;
                width: 60%;
                height: 35px;
                margin-bottom: 10px;
                padding-left: 5px;
                padding-right: 5px;
                border-radius: 3px;
            }

            input[type="text"]:hover, input[type="email"]:hover, input[type="password"]:hover {
                border-color: #3498db;
            }

            #second {
                display: none;
            }
        </style>
    </head>
    <body>
        <%
            // If the user is already signed in, redirect the user to home.jsp
            if (session.getAttribute("id") != null) {
                response.sendRedirect("home.jsp");
            }
        %>
        <div class="login_box">
            <div class="login_header">
                <h1>SLIT!</h1>
                Login or sign up below
            </div>
            <div id="first"> 
                <form method="post" action="LoginServlet">
                    <h3>Login</h3>
                    <input type="text" name="email" placeholder="Enter Email"><br>
                    <input type="password" name="password" placeholder="Enter password"><br>
                    <input type="submit" value="Login"><br>
                    <%
                    String login_error = (String) request.getAttribute("error");
                    if (login_error != null) {
                        out.println("<p style='color:red;'>" + login_error + "</p><br>");
                    }
                    %>
                    <a href="#" id="signup">Need an account? Register here!</a><br>
                </form>
            </div>
            <div id="second">
                <form method="post" action="RegisterServlet">
                    <h3>Register</h3>
                    <input type="text" name="firstName" placeholder="Enter first name" required><br>
                    <input type="text" name="lastName" placeholder="Enter last name" required><br>
                    <input type="email" name="email" placeholder="Enter email" required><br>
                    <input type="password" name="password" placeholder="Enter password" required><br>
                    <input type="submit" name="registerButton" value="register"><br>
                    <%
                    String register_error = (String) request.getAttribute("error");
                    if (register_error != null) {
                        out.println("<p style='color:red;'>" + register_error + "</p><br>");
                    }
                    %>
                    <a href="#" id="signin">Already have an account? Sign in here!</a><br>
                </form>
            </div>
        </div>
    </body>
</html>
