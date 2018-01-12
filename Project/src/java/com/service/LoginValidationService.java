/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;


import com.model.LoginValidationModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Lenovo
 */
public class LoginValidationService implements SessionAware {
    
    SessionMap<String,Object> session;
    ResultSet rs;
    
    public ResultSet validation(LoginValidationModel lvm)
    {
      
        try{
        Connection con=DbConnection.dbConnection();
        PreparedStatement pst=con.prepareStatement("select * from login_master where id=? and password=?");
        pst.setString(1,lvm.getUsername());
        pst.setString(2,lvm.getPassword());
      
         rs=pst.executeQuery();
       
        }
        
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        return(rs);
        
    }

    @Override
    public void setSession(Map<String, Object> map) {
        
        session=(SessionMap<String,Object>)map;
    }
    
}
