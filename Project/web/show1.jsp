<%-- 
    Document   : show1
    Created on : 13 Jun, 2016, 2:20:33 PM
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
       
        <section id="content">

<div class="container_12">
    <div class="grid_4">
      <div class="banner">
          <a href="home" class="banner_title">University <br>News</a>
          
          <%
         
          String content=(String)request.getAttribute("news");
          
          
          %>
          
          
          
          
        
        <div class="maxheight">
            
            <marquee  behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
              
                
                <%= content %>    
                
               
            </marquee>
           
        
      </div>
        
        
 </div>
        
    </div>
                
                
                
    <%-- 2nd         --%> 
               
             <div class="grid_4">
      <div class="banner">
          <a href="home" class="banner_title">Branch <br>News</a>
          
          <%
          
          
          Connection con=DbConnection.dbConnection();
        
           PreparedStatement pst=con.prepareStatement("select * from news where type!=? and type!=?");
          pst.setString(1,"admin");
          pst.setString(2,"user");
          ResultSet rs=pst.executeQuery();
          int count=0;
          
          %>
          
          
          
          
        
        <div class="maxheight">
            
            <marquee  behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
              
                <%
                
                while(rs.next()){
                
                count++;
                %>
                
                <a href="show_news2?q=<%= rs.getString("heading") %>"><%= rs.getString("heading") %></a> <br>
                
               <% } %>
               
               <%
               while(count<=8){
               
               %>
               <br>
               
               <% count++;} %>
               
            </marquee>
           
        
      </div>
        
        
 </div>
        
    </div>
               
               
               
               
     <%-- 3rd  --%>          
               
               
               
    <div class="grid_4">
      <div class="banner">
          <a href="home" class="banner_title">Student_Activity <br>News</a>
          
          <%
          con=DbConnection.dbConnection();
          pst=con.prepareStatement("select * from news where type=?");
          pst.setString(1,"user");
          rs=pst.executeQuery();
          count=0;
          
          %>
          
          
          
          
        
        <div class="maxheight">
            
            <marquee  behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
              
                <%
                
                while(rs.next()){
                
                count++;
                %>
                
                <a href="show_news3?q=<%= rs.getString("heading") %>"><%= rs.getString("heading") %></a> <br>
                
               <% } %>
               
               <%
               while(count<=8){
               
               %>
               <br>
               
               <% count++;} %>
               
            </marquee>
           
        
      </div>
        
        
 </div>
        
    </div>
     
     
     
     
     
    <div class="clear"></div>
  </div>
  </section>
        
        
    </body>
</html>

