/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.service.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Lenovo
 */
public class RoleChangingRequestAction implements SessionAware{
    
    private String id;
    private String role;
    private SessionMap<String,Object> session;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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
            PreparedStatement pst=con.prepareStatement("update login_master set type=? where id=?");
            pst.setString(1,getRole());
            pst.setString(2,getId());
            int status=pst.executeUpdate();
            if(status>0)
            {
                pst=con.prepareStatement("delete from change_role_request_master where id=?");
                pst.setString(1,getId());
                status=pst.executeUpdate();
            }
            
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
