<%-- 
    Document   : registration
    Created on : 10 Jun, 2016, 9:32:31 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body style="background-image:url('uni_image3.jpg')">
        
    <center> <h1 style="color:white">REGISTRTION FORM</h1></center>
    <br><br><br><br><br>
    <center>
        <form action="signup" method="post">
            <table>
                <tr><td style="font-size: 30px">Enter Email Id:</td><td> <input type="text" name="email"/></td></tr>
                <tr><td style="font-size: 30px">Enter Your Name:</td><td><input type="text" name="name"/></td></tr>
                <tr><td style="font-size: 30px">Enter Password:</td><td><input type="password" name="password"/></td></tr>
                <tr><td colspan="2" align="center"><br><br><input type="submit" value="Sign Up" style="height: 50px;width:200px"/></td></tr>
            </table>
         
            
           
        </form>
        
        <%
        if(request.getAttribute("reg_msg")!=null){
            %>
            <center>  <h2 style="color:red"><%= request.getAttribute("reg_msg") %></h2>    </center>
        
        <% } %>
        
        
   
        
        
    </body>
</html>
