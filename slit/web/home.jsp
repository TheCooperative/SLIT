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
            if(session.getAttribute("id")==null){
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="row hellomsg">
            <span>
            <h1>Hello ${firstName} ${lastName}</h1><br>
            </span>
        </div>
            <%
                Connection conn;
                conn = DBConnectionManager.getConnection();
                String sql = "SELECT id FROM module;";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
            %>
        <div class="row">
            <div class="box">
                 <h3>Upload new Module</h3>
                 <form method="post" action="fileUpload" enctype="multipart/form-data">
                 <select name="moduleId">
                     <%
                         while(rs.next()){
                             
                         }
                     
                     %>    
                </select>
                <input type="text" name="fileName" placeholder="Enter your title"><br>
                <input type="file" name="fileBlob" id="fileBlob">
                <input type="submit" value="upload">
                </form>
             </div>
        </div>
            <a href="createModule.jsp">Click here to add new Module</a>
            <a href="fileUpload.jsp">Click here to upload new Module</a>
    </body>
</html>
