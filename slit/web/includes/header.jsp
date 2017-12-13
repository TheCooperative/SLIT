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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="js/slide.js"></script>
    </head>
    <body>
        <div class="topNav">
            <div class="row">
                <div id="slitLogo">
                    <h3>SLIT</h3>
                </div>
                <div id="navLinks">
                    <a href="home.jsp"><i class="fa fa-home" aria-hidden="false"></i> Home</a>
                    <a href="profile.jsp"><i class="fa fa-user" aria-hidden="false"></i> Profile</a>
                    <a href="newsFeed.jsp"><i class="fa fa-envelope" aria-hidden="true"></i> News</a>
                    <form method="POST" action="LogoutServlet">
                    <input type="submit" value="Logout">
                    </form>
                </div>
            </div>  
        </div>