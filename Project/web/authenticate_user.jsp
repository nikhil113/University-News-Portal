<%-- 
    Document   : authenticate_user
    Created on : 11 Jun, 2016, 11:58:57 AM
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
        
        <%
        Connection con=DbConnection.dbConnection();
        PreparedStatement pst=con.prepareStatement("select * from login_master where status=?");
        pst.setString(1,"false");
        ResultSet rs=pst.executeQuery();
        
        
        
        %>
        
        
        
        
        <div style="height: 600px;background-color:#FAEBD7">
            
                
                
            <center> <h3> AUTHENTICATE USERS</h3> </center> <br><br><br>
               
            <center>
            <table>
                    <tr>
                        <th align="center" style="width:200px">Email_Id</th>
                        <th align="center" style="width:200px">NAME</th>
                        <th align="center">Click to Authenticate</th>
                    </tr>  
                    
                    
                    <%
                    
                    while(rs.next()){
                    %>
                    
                    <tr>
                        <td align="center"><%= rs.getString(1) %></td>
                        <td align="center"><%= rs.getString(3) %></td>
                        <td align="center"><a href="user_authentication?q=<%= rs.getString(1) %>">Authenticate</a></td>
                    </tr>
                    
                    
                    
                    <% } %>
                </table>
            </center>    
                                             
            
        </div>
        
        
        
    </body>
</html>
