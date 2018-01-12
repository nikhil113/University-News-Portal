<%-- 
    Document   : index
    Created on : 9 Jun, 2016, 1:46:07 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        if(session.getAttribute("id")!=null)
            response.sendRedirect("home");
        
        
       %>
        
        
        
        <jsp:include page="form.html"/>
        <%
            if(request.getAttribute("reg_msg")!=null){
        %>
        
    <center>  <h3 style="color:red"><%= request.getAttribute("reg_msg") %></h3> </center>
        
        <% } %>
        
        
        <%
            if(request.getAttribute("login_msg")!=null){
        %>
        
        <center>  <h3 style="color:red"><%= request.getAttribute("login_msg") %></h3> </center>
        
        <% } %>
        
        
    </body>
</html>
