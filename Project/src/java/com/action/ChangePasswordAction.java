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
import org.apache.struts2.dispatcher.RequestMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Lenovo
 */
public class ChangePasswordAction implements SessionAware,RequestAware{
    
    private String old_password;
    private String new_password;
    
    private SessionMap<String,Object> session;
    private RequestMap request;

    public String getNew_password() {
        return new_password;
    }

    public void setNew_password(String new_password) {
        this.new_password = new_password;
    }

    public String getOld_password() {
        return old_password;
    }

    public void setOld_password(String old_password) {
        this.old_password = old_password;
    }
    
    public String execute()
    {
        String value=" ";
        if(((getOld_password()).length()==0)||((getNew_password()).length())==0)
        {
            value="failed";
            request.put("pass_msg","please enter both fields !!!");
        }
        else
        {
            String id=(String)session.get("id");
            try{
            Connection con=DbConnection.dbConnection();
            PreparedStatement pst=con.prepareStatement("select * from login_master where id=? and password=?");
            pst.setString(1,id);
            pst.setString(2,getOld_password());
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            {
                pst=con.prepareStatement("update login_master set password=? where id=?");
                pst.setString(1,getNew_password());
                pst.setString(2,id);
                int status=pst.executeUpdate();
                value="success";
                request.put("pass_msg","password changed succesfully !!!");
            }
            else
            {
                value="failed";
                request.put("pass_msg","old password is incorrect !!!");
            }
          
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        
        }
        
        
        
        return(value);
        
    }

    @Override
    public void setSession(Map<String, Object> map) {
        
        session=(SessionMap<String,Object>)map;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        
        request=(RequestMap)map;
    }
    
    
}
