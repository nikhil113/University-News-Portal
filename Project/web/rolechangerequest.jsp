<%-- 
    Document   : rolechangerequest
    Created on : 13 Jun, 2016, 8:17:47 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.service.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        <div style="height:500px;background-color:#FCEBD9">
            <center><h3>ROLE CHANGE REQUEST</h3></center>
            <br><br>
            
            <%
            Connection con=DbConnection.dbConnection();
            PreparedStatement pst=con.prepareStatement("select * from change_role_request_master");
            ResultSet rs=pst.executeQuery();
            
            
            %>
            
            <center>
                
                <table>
                    
                   <tr style="height:60px"><th style="width: 200px" align="center">Requesting_Id</th><th style="width:200px" align="center">Current_Role</th><th style="width:200px" align="center">Requesting_Role</th><th style="width:200px" align="center">Verify</th></tr>
                    <%
                    while(rs.next()){
                    
                    %>
                    
                    <center>  <tr style="height:60px"><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td><td align="center"><a href="request_done?id=<%= rs.getString(1) %>&role=<%= rs.getString(3) %>">Done</a></td></tr></center>
                    
                   <% } %> 
                    
                </table>
                
                
                
            </center>
            
        </div>
        
        
        
    </body>
</html>
