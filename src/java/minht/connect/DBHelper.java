/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.connect;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author MinhT
 */
public class DBHelper implements Serializable{
     public static Connection getConnection()throws /*ClassNotFoundException*/NamingException, SQLException{
        
        Context context = new InitialContext(); //get current OS
        Context tomcatContext = (Context)context.lookup("java:comp/env");//get tomcat OS
        DataSource ds = (DataSource)tomcatContext.lookup("DBconnect");
        Connection con = ds.getConnection();
        
        return con;

    }
    
}
