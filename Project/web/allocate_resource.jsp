<%-- 
    Document   : allocate_resource
    Created on : 12 Jun, 2016, 10:44:53 PM
    Author     : Lenovo
--%>


<%@page import="java.util.ArrayList"%>
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
        PreparedStatement pst=con.prepareStatement("select * from login_master where type!=? and status=?");
        pst.setString(1,"admin");
        pst.setString(2,"true");
        ResultSet rs=pst.executeQuery();
                
        
        %>
        
        
        
        
        
        <div style="height:500px;background-color:#FAEBD9">
            <center><h3>ALLOCATE RESOURCE</h3></center>
            
            <center>
                
                <form method="post">
                <select name="student" onchange="form.submit()" style="height: 50px;font-size: 15px;color:crimson">
                    <%
                            if(request.getParameter("student")!=null){
                    
                    %>
                    
               <option value="<%= request.getParameter("student") %>" selected><%= request.getParameter("student") %></option>     
                
               <% } %>
               
               
                    <%
                    while(rs.next()){
                        if(!rs.getString("id").equals(request.getParameter("student"))){
                      
                    %>
                  
                    <option value="<%= rs.getString("id") %>"><%= rs.getString("id") %></option>
                    
                    <% }} %>
                    
                </select>  
                </form>   
            
             <%
                if(request.getParameter("student")!=null)
                {                       
                    String id=request.getParameter("student");
                    pst=con.prepareStatement("select name from resources where accessibility!=?");
                   
                    pst.setString(1,"admin");
                    
                    rs=pst.executeQuery();
                    
                    pst=con.prepareStatement("select res_name from resource_master where id=?");
                    pst.setString(1,id);
                    ResultSet rs1=pst.executeQuery();
                    
                    ArrayList<String> al1=new ArrayList<String>();
                    ArrayList<String> al2=new ArrayList<String>();
                    ArrayList<String> al3=new ArrayList<String>();
                    for(int i=0;rs.next();i++)
                        al1.add(rs.getString(1));
                    
                    for(int i=0;rs1.next();i++)
                        al2.add(rs1.getString(1));
                    
                    
                    for(int i=0;i<al1.size();i++)
                    {
                        int flag=0;
                        for(int j=0;j<al2.size();j++)
                        {
                            if(al1.get(i).equals(al2.get(j)))
                            {
                                flag=1;
                                break;
                            }
                        }
                        if(flag==0)
                            al3.add(al1.get(i));
                    }
                    
                    
              %>
                    
              <br>       
                    <form action="student_resource_allocation" method="post">
                        <table>
                            <tr style="height: 50px"><th align="left">Resource Name</th><th align="center">Click to Allocate</th></tr>
                            
                            <%
                            for(int i=0;i<al3.size();i++){
                            
                          %>
                          <tr><td align="left"><%= al3.get(i) %></td><td align="center"><input type="checkbox" name="resources" value="<%= al3.get(i) %>" style="-webkit-appearance: checkbox"/></td>
                            
                         <% } %>
                         
                         
                         <%

                            session.setAttribute("allocation_id",id);



                           %>
                         
                         
                         
                          <tr style="height: 80px"><td colspan="2" align="center"><input type="submit" value="Allocate Resorce" style="height: 40px;background-color:cyan"/></td></tr>
                         
                        </table>   
                        
                        
                         
                        
                        
                    </form>
                        
                    
                         
              <% } %>      
                    
                    
                  
                    
            </center>
            
            
            
            
        </div>
        
    </body>
</html>
