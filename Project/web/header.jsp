<%-- 
    Document   : header
    Created on : 10 Jun, 2016, 12:03:07 AM
    Author     : Lenovo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME PAGE</title>
    </head>
    <body>
        
        <div class="container_12">
    <div class="grid_12">
      					
	<h1 class="logo">
        
            <label>IIITDMJ PORTAL</label>     
    
     <span><%= (String)session.getAttribute("name") %></span>
       
      </h1>
							
    </div>
    <div class="clear"></div>
  </div>
        
    </body>
</html>
