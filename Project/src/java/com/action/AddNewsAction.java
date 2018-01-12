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
public class AddNewsAction implements SessionAware,RequestAware{
    
    private String id;
    private String heading;
    private String date;
    private String content;
    
    private SessionMap<String,Object> session;
    private RequestMap request;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String execute()
    {
        String value=" ";
        if(((getId()).length()==0)||((getHeading()).length()==0)||((getDate()).length()==0)||((getContent()).length()==0))
        {
            value="failed";
            request.put("news_msg","Enter all fields !!!");
        }
        else
        {
            try{
                
                Connection con=DbConnection.dbConnection();
                PreparedStatement pst=con.prepareStatement("select count(*) from news");
                ResultSet rs=pst.executeQuery();
                int size=0;
                if(rs.next())
                   size=rs.getInt(1); 
                
                pst=con.prepareStatement("insert into news values(?,?,?,?,?,?)");
                pst.setInt(1,size+1);
                pst.setString(2,getHeading());
                pst.setString(3,getContent());
                pst.setString(4,(String)session.get("type"));
                pst.setString(5,(String)session.get("id"));
                pst.setString(6,getDate());
                int status=pst.executeUpdate();
                
                value="success";
                
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
