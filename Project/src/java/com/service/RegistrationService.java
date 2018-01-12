/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.model.RegistrationModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class RegistrationService {
    
    public String doRegistration(RegistrationModel rm)
    {
        int status=0;
        
            try{
            Connection con=DbConnection.dbConnection();
            PreparedStatement pst=con.prepareStatement("insert into login_master values (?,?,?,?,?)");
            pst.setString(1,rm.email);
            pst.setString(2,rm.password);
            pst.setString(3,rm.name);
            pst.setString(4,"user");
            pst.setString(5,"false");
             status=pst.executeUpdate();
             
             if(status>0)
             {
                 pst=con.prepareStatement("select count(*) from resource_master");
                 ResultSet rs=pst.executeQuery();
                 int size=0;
                 if(rs.next())
                      size=rs.getInt(1);
                 
                 pst=con.prepareStatement("insert into resource_master values (?,?,?)");
                 pst.setInt(1,size+1);
                 pst.setString(2,rm.email);
                 pst.setString(3,"HOME");
                 pst.executeUpdate();
                 
                 pst=con.prepareStatement("insert into resource_master values (?,?,?)");
                 pst.setInt(1,size+2);
                 pst.setString(2,rm.email);
                 pst.setString(3,"LOGOUT");
                 pst.executeUpdate();
                 
                 
             }
            
            
            }
            
            catch(SQLException e)
            {
                System.out.println(e);
            }
            
            
        
        
        if(status==0)
            return("failed");
        else
            return("success");
    }
    
}
