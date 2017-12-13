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
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="js/slide.js"></script>

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
                    <input type="text" name="referral" placeholder="Referral code"><br>
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
