<%-- 
    Document   : teacherHome
    Created on : 08.des.2017, 15:13:50
    Author     : Christoffer
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="lib.ClassOverview"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="includes/header.jsp"></jsp:include>
    
<a href="approveHandin.jsp">Click here to approve a hand-in</a>
    
<%
    // If the user is not signed in, redirect the user to index.jsp
    if (session.getAttribute("id") == null) {
        response.sendRedirect("index.jsp");
    } else if((String) session.getAttribute("role") == "Student"){
                response.sendRedirect("home.jsp");
    }
    
    Connection conn;
    PreparedStatement ps;
    conn = DBConnectionManager.getConnection();    
%>
        <center>
        <h2>Class Overview</h2>
            <table border="1">
                <tr>
                    <td>Student:</td>
                    <td>Modul: 1</td>
                    <td>Modul: 2</td>
                    <td>Modul: 3</td>
                    <td>Modul: 4</td>
                    <td>Modul: 5</td>
                </tr>
<%
    try{
        String sql1 = "select lastName, firstName, u_id from handIn inner join userAccount on handIn.u_id=userAccount.id group by u_id ORDER BY lastName asc;";
        ps = conn.prepareStatement(sql1);
            
        ResultSet rs = ps.executeQuery();
            
        //Places all students in the student list.
        while(rs.next()){
%>
                <tr>
                    <td><a href="#"> <%=rs.getString("lastName")%>, <%=rs.getString("firstName")%> </a></td>
<%
            //Gets the points on each module
            for(int stepper = 0; stepper <= 4; stepper ++){
                int temp = ClassOverview.getModulePoints(rs.getInt("u_id"), stepper+1);
%>
                    <td><%= temp %></td>
<%
            }
%>
                </tr>
<%
        }
    } catch (SQLException e) {
        System.out.println("Driver not found "+ e);
    }
%>
            </table>

            <br>
            
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
        </center>
    </body>
</html>