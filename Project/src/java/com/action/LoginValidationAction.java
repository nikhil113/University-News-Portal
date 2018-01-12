/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.model.LoginValidationModel;
import com.service.LoginValidationService;
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
public class LoginValidationAction implements SessionAware,RequestAware{
    
    private String username;
    private String password;
    
    SessionMap<String,Object> session;
    RequestMap request;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String execute()
    {
        String return_value=" ";
        LoginValidationModel lvm=new LoginValidationModel();
        lvm.setUsername(getUsername());
        lvm.setPassword(getPassword());
        LoginValidationService lvs=new LoginValidationService();
        ResultSet rs=lvs.validation(lvm);
        try{
        if(rs.next())
        {
            if((rs.getString("status")).equals("true")){
            session.put("id",rs.getString("id"));
            session.put("name",rs.getString("name"));
            session.put("type",rs.getString("type"));
            return_value="success";
            }
            else
            {
                return_value="false";
                request.put("login_msg","Authentication Is Pending !!!");
              //  System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+validate[4]);
            }
        }
        else
        {
            return_value="false";
            request.put("login_msg","Incorrcet Login_Id Or Password !!!");
        }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
       
        return(return_value);
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
