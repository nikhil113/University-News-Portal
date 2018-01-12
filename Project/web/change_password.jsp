<%-- 
    Document   : change_password
    Created on : 12 Jun, 2016, 10:45:31 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        <div style="height:400px;background-color:#FAEBD9">
           
            <center> <h3>CHANGE PASSWORD</h3>     </center>
            <br>
            
             <%
            if(request.getAttribute("pass_msg")!=null)
                             {  


        %>                                                                                     
           
          
        <center><h4><%= (String)request.getAttribute("pass_msg") %></h4></center>
        
        <% } %>
            <br>
            
            <form action="passwordaction" method="post">
            <center>  <table>
                
                
                  
                    
                    <tr><td>Enter Old Password:</td><td><input type="password" name="old_password"/></td></tr>
                </table></center><br><br>
                    
                <center><table>
                    <tr><td>Enter New Password:</td><td><input type="password" name="new_password"/></td></tr>
                    
                    </table></center><br><br>
                
                <center><table>
                    <tr><td colspan="2"><input type="submit" value="change password" style="height:50px;width:200px;background-color: cyan"/></td></tr>
                    </table></center>
                    
                </form>
                
            
                <center>
                    
       
        
        
        
        </div>
        
        
    </body>
</html>
