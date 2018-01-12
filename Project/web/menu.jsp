<%-- 
    Document   : menu
    Created on : 10 Jun, 2016, 12:06:25 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.service.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        
        <section id="stuck_container">
  <!--==============================
              Stuck menu
  =================================-->
  
  <% 
  
  String id=(String)session.getAttribute("id");
  Connection con=DbConnection.dbConnection();
  PreparedStatement pst=con.prepareStatement("select * from resource_master,resources where resource_master.res_name=resources.name and id=?");
  pst.setString(1,id);
  ResultSet rs=pst.executeQuery();
  
  
  
  %>
  
  
    <div class="container_12">
        <div class="grid_12">          
          <div class="navigation">
            <nav>
              <ul class="sf-menu">
            <% while(rs.next()){ 
            %> 
            
                
            <li><a href="<%= rs.getString(5) %>"><%= rs.getString(3) %></a></li>
         <%   } %>
             
             
             
             </ul>
            </nav>
            <div class="clear"></div>
          </div>       
         <div class="clear"></div>  
     </div> 
     <div class="clear"></div>
    </div> 
  </section>

<section class="slider_wrapper">
  <div id="camera_wrap" class="">
    <div data-src="images/uni_image2.jpg"></div>
    <div data-src="images/uni_image1.jpg"></div>
    <div data-src="images/sports.gif"></div>  
  </div>  
</section>
        
    </body>
</html>
