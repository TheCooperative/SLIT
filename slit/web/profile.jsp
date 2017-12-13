<%-- 
    Document   : profile
    Created on : 11.des.2017, 12:07:09
    Author     : Christoffer
--%>

<%@page import="lib.ClassOverview"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="includes/header.jsp"></jsp:include>

<%
    // If the user is not signed in, redirect the user to index.jsp
    if (session.getAttribute("id") == null) {
        response.sendRedirect("index.jsp");
    }
    if ((String) session.getAttribute("role") == "Teacher"){
        response.sendRedirect("searchStudent.jsp");
    }

    Connection conn;
    PreparedStatement ps;
    conn = DBConnectionManager.getConnection();
    
    int temp = (Integer) session.getAttribute("id");
%>
        <center>
            <h1>Profile - ${firstName} ${lastName}</h1>
            
            <table border="1">
                <tr>
                    <td></td>
                    <td> Modul: 1 </td>
                    <td> Modul: 2 </td>
                    <td> Modul: 3 </td>
                    <td> Modul: 4 </td>
                    <td> Modul: 5 </td>
                </tr>
                
                <tr>
                    <td> You: </td>
<%
        //Gets the points on each module
        for(int stepper = 0; stepper <= 4; stepper ++){
            int modules = ClassOverview.getModulePoints(temp, stepper+1);
%>
                    <td><%= modules %></td>
<%
        }
%>
                </tr>
                
                <tr>
                    <td> Average: </td>
<%
        try {
            String sql= "select m_id, round(avg(points), 2) from handIn group by m_id";
            ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery(sql);  

            while (rs.next()) {
%>
                    <td><%= rs.getString("round(avg(points), 2)")%></td>
<%
            }
        } catch (Exception e){
            e.printStackTrace();
        }
%>
                </tr>
            </table>
            
            <div class="section">
                <div class="row">
                    <div class="hellomsg"><h3>Hand-in Information</h3></div>
<%
    try {
        String sql = "select u_id, m_id, points, feedback, notes, fileName, deliveryDate, title from module inner join handIn on module.id = handIn.m_id where u_id = " + temp;
        ps = conn.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery(sql);
        
        while (rs.next()) {
%>
                    <div class="mod_inf">
                        <table class="modules">
                            <tr>
                                <td>Module <%= rs.getString("m_id")%></td>
                                <td><%= rs.getString("title")%></td>
                                <td>
<%          if(rs.getString("points") != null){     %>
                <%= rs.getString("points")%>
<%          } else {                                %>
                <font color="red">Pending</font>
<%          }                                       %>
                                </td>
                            </tr>
                        </table>
                    </div>
                                
                    <div class="mod_desc">
                        <h1>Module <%= rs.getString("m_id")%> - <%= rs.getString("title")%></h1>
                        <label for="mod_desc">Feedback</label>
                        <p class="mod_des">
<%          if(rs.getString("feedback") != null){     %>
                <%= rs.getString("feedback")%>
<%          } else {                                %>
                <font color="red">Pending</font>
<%          }                                       %>                             
                        
                        </p>
                        <label for="mod_goals">Notes</label>
                        <p class="mod_goals">
<%          if(rs.getString("notes") != null){     %>
                <%= rs.getString("notes")%>
<%          } else {                                %>
                <font color="red">Pending</font>
<%          }                                       %>                            
                        </p>
                        <label for="mod_resources">File</label>
                        <p class="mod_resources"><%= rs.getString("fileName")%></p>
                        <label for="mod_task">Delivered</label>
                        <p class="mod_task"><%= rs.getString("deliveryDate")%></p>
                        <a href="#">Download Hand-in</a> <br>
                        <a href="#">Correct Hand-in</a>
                    </div>
<%
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
                </div>
            </div>
        </center>
    </body>
</html>
