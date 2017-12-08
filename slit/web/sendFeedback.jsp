<%-- 
    Document   : sendFeedback
    Created on : 07.nov.2017, 10:10:35
    Author     : Marius Vika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback to the developers</title>
    </head>
    <body>
        <h1>Send your feedback! &#9786</h1>
        <h3>Please fill in the boxes below to mail feedback to the developers.</h3>
        <p>All kinds of feedback are much appreciated!</p>
        
        <form action="mailto:modul.assistanse@gmail.com" method="post" enctype="text/plain">
            Name:<br>
            <input type="text" name="name" placeholder="E.g. Ola Nordmann" size="25"><br>
            E-mail:<br>
            <input type="text" name="mail" placeholder="E.g. ola.nordmann@gmail.com" size="25"><br>
            Comment:<br>
            <input type="text" name="comment" size="50" placeholder="E.g. This system is awesome! But i wish you could...."><br><br>
            <input type="submit" value="Send">
            <input type="reset" value="Reset form">
        </form><br>
        <a href="index.jsp">
            <button>Return home</button>
        </a>
    </body>
    
</html>
