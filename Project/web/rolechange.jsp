<%-- 
    Document   : rolechange
    Created on : 13 Jun, 2016, 7:33:08 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        <div style="height: 450px; background-color:#FBEBD9">
             
            <center><h3>ROLE CHANGE</h3></center>
            <br><br>
            
            <%
            String roles[]={"user","cse_hod","mech_hod"};
            
            %>
            
            
            
            <center>
                
                <form action="role_changing" method="post">
                <table>
                    <tr style="height: 50px"><th>Roles Available</th><th>Select One</th></tr>
                    <%
                    for(int i=0;i<roles.length;i++){
                    
                        if(!roles[i].equals((String)session.getAttribute("type"))){
                    %>
                    
                    <tr style="height: 50px"><td><%= roles[i] %></td><td><input type="radio" name="role" value="<%= roles[i] %>" style="-webkit-appearance: radio"/></td></tr>
                    
                    <% }} %>
                    
                    
                    <tr style="height: 50px"> <td colspan="2" align="center"><input type="submit" value="change my role" style="height: 40px;width:150px;background-color:cyan"/></td></tr>
                    
                </table>
                
                </form> 
                
                
                
            </center>
             
             
             
             </div>
        
        
        
        
        
        
    </body>
</html>
