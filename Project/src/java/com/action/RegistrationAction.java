/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.model.RegistrationModel;
import com.service.RegistrationService;
import java.util.Map;
import org.apache.struts2.dispatcher.RequestMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.validator.constraints.Length;

/**
 *
 * @author Lenovo
 */
public class RegistrationAction implements SessionAware,RequestAware{
    
    private String email;
    private String name;
    private String password;
    
    SessionMap<String,Object> session;
    RequestMap request;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String execute()
    {
        String value=" ";
        RegistrationModel rm=new RegistrationModel();
        rm.setEmail(getEmail());
        rm.setName(getName());
        rm.setPassword(getPassword());
        
        if(((rm.getEmail()).length()==0)||((rm.getName()).length()==0)||((rm.getPassword()).length()==0))
        {
            value="failed";
            request.put("reg_msg","Registration Failed !!!");
        }
        else{
        RegistrationService rs=new RegistrationService();
         value=rs.doRegistration(rm);
        
        if(value.equals("success"))
        {
           request.put("reg_msg","Registration done !!!");
        }
        else
        {
            request.put("reg_msg","Registration Failed !!!");
        }}
        
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
