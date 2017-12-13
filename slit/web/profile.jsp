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
    Connection conn;
    PreparedStatement ps;
    conn = DBConnectionManager.getConnection();
    
    int temp = (Integer) session.getAttribute("id");
%>
        <center>
            <h1>Profile - ${firstName} ${lastName}</h1>
            
            <table border="1">
                <tr>
                    <td> Modul: 1 </td>
                    <td> Modul: 2 </td>
                    <td> Modul: 3 </td>
                    <td> Modul: 4 </td>
                    <td> Modul: 5 </td>
                </tr>
                
                <tr>
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
                                <td><%= rs.getString("points")%></td>
                            </tr>
                        </table>
                    </div>
                                
                    <div class="mod_desc">
                        <h1>Module <%= rs.getString("m_id")%> - <%= rs.getString("title")%></h1>
                        <label for="mod_desc">Feedback</label>
                        <p class="mod_des"><%= rs.getString("feedback")%></p>
                        <label for="mod_goals">Notes</label>
                        <p class="mod_goals"><%= rs.getString("notes")%></p>
                        <label for="mod_resources">File</label>
                        <p class="mod_resources"><%= rs.getString("fileName")%></p>
                        <label for="mod_task">Delivered</label>
                        <p class="mod_task"><%= rs.getString("deliveryDate")%></p>
                        <br>
                        <a href="#">download module</a>
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
