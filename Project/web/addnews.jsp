<%-- 
    Document   : addnews
    Created on : 10 Jun, 2016, 1:23:47 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
       
       
       
       }
        
    </head>
    <body>
       
        
        <div style="background-color:#FAEDD7"> 
            <center><h3>ADD NEWS</h3></center>
            <%
            if(request.getAttribute("news_msg")!=null){
            
            %>
            <center><h4 style="color:red"><%= (String)request.getAttribute("news_msg") %></h4></center>
            
            <% } %>
            
            <center><table align="center">
            <form action="add" method="post">
                
                <tr><td>Enter Your Id: </td><td><input type="text" name="id"/></td></tr><br>
            <tr><td>Enter News Heading: </td><td><input type="text" name="heading"/></td></tr><br>
            <tr><td>Enter Date: </td><td><input type="text" name="date" placeholder="yyyy-mm-dd"/></td></tr><br><br>
            <tr colsapn="2"><td>Enter the content:</label></td></tr>
            </table>
                <table>
            <tr><td> <textarea name="content" style="height:250px;width:300px"></textarea></td></tr></<br>
            <br>
            <tr><td align="center"><input type="submit" value="Float News" style="color:chocolate"/></td></tr><br>
                </table>
            </form>
            </table>
            </center>
            <br>
            <br><br>
            <hr>
        </div> 
        
      
    </body>
</html>
