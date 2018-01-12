/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.service.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class User_Authentication_Action {
    
    private String q;

    public String getQ() {
        return q;
    }

    public void setQ(String q) {
        this.q = q;
    }
    
    public String execute()
    {
        Connection con=DbConnection.dbConnection();
        
        try{
        PreparedStatement pst=con.prepareStatement("update login_master set status=? where id=?");
        pst.setString(1,"true");
        pst.setString(2,getQ());
        int status=pst.executeUpdate();
       
        }
        
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        catch(Exception e)
        {
            System.out.println(e);
        }
        
        return("success");
    }
    
}
