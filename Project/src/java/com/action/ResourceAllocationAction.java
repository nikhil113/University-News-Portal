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
public class ResourceAllocationAction implements RequestAware,SessionAware{
    
    private String resources[];
  
    
    RequestMap request;
    SessionMap<String,Object> session;

   

    

    public String[] getResources() {
        return resources;
    }

    public void setResources(String[] resources) {
        this.resources = resources;
    }
    
    
    public String execute()
    {
        String res[]=getResources();
        try{
        Connection con=DbConnection.dbConnection();
        PreparedStatement pst=con.prepareStatement("select count(*) from resource_master");
            ResultSet rs=pst.executeQuery();
            int size=0;
            if(rs.next())
                size=rs.getInt(1);
        for(int i=0;i<res.length;i++)
        {
            
            pst=con.prepareStatement("insert into resource_master values(?,?,?)");
            pst.setInt(1,size+i+1);
            pst.setString(2,(String)session.get("allocation_id"));
            pst.setString(3,res[i]);
            int status=pst.executeUpdate();
            
            
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
        
       
    return("success");    
    
}

    @Override
    public void setRequest(Map<String, Object> map) {
        
        request=(RequestMap)map;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        
        session=(SessionMap<String,Object>)map;
    }
}
