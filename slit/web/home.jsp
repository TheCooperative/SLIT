<%-- 
    Document   : home.jsp
    Created on : 12.okt.2017, 23:54:47
    Author     : Martin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnectionManager"%>
<%@page import="java.sql.Connection"%>
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
        response.sendRedirect("teacherHome.jsp");
    }
%>


<!--Dette skal bort etterhvert-->
<a href="approveHandin.jsp">Click here to approve a hand-in</a>
<a href="classOverview.jsp">Click here to see the class overview</a>
<a href="createModule.jsp">Click here to add new Module</a>
<a href="fileUpload.jsp">Click here to upload new Module</a>
<a href="showAllModules.jsp">Click here to show all modules</a>
<a href="teacherHome.jsp">Click here to go to Teacher home page</a>


<div class="row hellomsg">
    <span>
        <h1>Hello ${firstName} ${lastName}</h1><br>
        <p>UserID: ${id}<br>
            Email: ${email}<br>
            role: ${role}<br>
            last logged in: ${lastLogin}<br>
        </p>
    </span>
</div>
              
<%
    Connection conn;
    PreparedStatement ps;
    conn = DBConnectionManager.getConnection();
    try {
        String sql = "select id from module";
        ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery(sql);
%> 

<div class="row">
    <div class="box">
        <h3>Upload new Module</h3>
        <form method="post" action="fileUpload" enctype="multipart/form-data">
            <select name="moduleId">
<%
        while (rs.next()) {
%>
                <option value=<%= rs.getString("id")%>>Module <%= rs.getString("id")%></option>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
            </select>
            
            <input type="text" name="fileName" placeholder="Enter your title"><br>
            <input type="file" name="fileBlob" id="fileBlob">
            <input type="submit" value="upload">
        </form>
    </div>
</div>
            
<div class="section">
    <div class="row">
        <div class="hellomsg"><h3>Module Information</h3></div>
<%
    try {
        String sql = "select * from module";
        ps = conn.prepareStatement(sql);

        ResultSet rs2 = ps.executeQuery(sql);

        while (rs2.next()) {
%>
        <div class="mod_inf">
            <table class="modules">
                <tr>
                    <td>Module <%= rs2.getString("id")%></td>
                    <td><%= rs2.getString("title")%></td>
                    <td><%= rs2.getString("deadline")%></td>
                </tr>
            </table>
        </div>
                
        <div class="mod_desc">
            <h1>Module <%= rs2.getString("id")%> - <%= rs2.getString("title")%></h1>
            <label for="mod_desc">Description</label>
            <p class="mod_des"><%= rs2.getString("description")%></p>
            <label for="mod_goals">Learning goal</label>
            <p class="mod_goals"><%= rs2.getString("goals")%></p>
            <label for="mod_resources">Resources</label>
            <p class="mod_resources"><%= rs2.getString("resources")%></p>
            <label for="mod_task">Task</label>
            <p class="mod_task"><%= rs2.getString("task")%></p>
            <label for="mod_deadline">Deadline</label>
            <p class="mod_deadline">Deadline is due: <%= rs2.getString("deadline")%></p>
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
</body>
</html>
