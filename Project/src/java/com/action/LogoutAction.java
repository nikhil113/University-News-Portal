/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Lenovo
 */
public class LogoutAction implements SessionAware{
    
    
    SessionMap<String,Object> session;
    
    public String execute()
    {
        session.invalidate();
        session=null;
        return("success");
    }

    @Override
    public void setSession(Map<String, Object> map) {
        
        
        session=(SessionMap<String,Object>)map;
    }
    
}
