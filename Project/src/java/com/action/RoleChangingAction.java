/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.service.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Lenovo
 */
public class RoleChangingAction implements SessionAware{
    
    private String role;
    private SessionMap<String,Object> session;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public String execute()
    {
        try{
        Connection con=DbConnection.dbConnection();
        PreparedStatement pst=con.prepareStatement("insert into change_role_request_master values(?,?,?)");
        pst.setString(1,(String)session.get("id"));
        pst.setString(2,(String)session.get("type"));
        pst.setString(3,getRole());
      
        int status=pst.executeUpdate();
        
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        return("success");
    }
    

    @Override
    public void setSession(Map<String, Object> map) {
        
        
        session=(SessionMap<String,Object>)map;
    }
    
    
    
}
