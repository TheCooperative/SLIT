<%-- 
    Document   : header
    Created on : Nov 9, 2017, 4:27:39 PM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SLIT</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    </head>
    <body>
        <div class="topNav">
            <div id="slitLogo">
                <h3>SLIT</h3>
            </div>
            <div id="navLinks">
                <a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                <a href="#"><i class="fa fa-user" aria-hidden="true"></i> Profile</a>
                <a href="#"><i class="fa fa-envelope" aria-hidden="true"></i> Messages</a>
                <form method="POST" action="LogoutServlet">
                <input type="submit" value="Logout">
                </form>
            </div>
        </div>