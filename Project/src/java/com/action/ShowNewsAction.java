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
import org.apache.struts2.interceptor.RequestAware;

/**
 *
 * @author Lenovo
 */
public class ShowNewsAction implements RequestAware{
    
    private String q;
    private RequestMap request;

    public String getQ() {
        return q;
    }

    public void setQ(String q) {
        this.q = q;
    }
    
    public String execute()
    {
        try{
        Connection con=DbConnection.dbConnection();
        PreparedStatement pst=con.prepareStatement("select content from news where heading=?");
        pst.setString(1,getQ());
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
            request.put("news",rs.getString("content"));
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
    
}
