/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hien
 */
public class DBHelper {
    public static Connection getConnection()
        throws ClassNotFoundException,SQLException{
        //1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create connection string to DBMS. Syntax: protocol://ip:port;databaseName=
        String url="jdbc:sqlserver://"  //protocol
                + "localhost:1433;"   //container
                + "databaseName=PRJ_MovieCenter";
        //3. get connection from Driver Manager
        Connection con= DriverManager.getConnection(url, "sa", "12345");
        //4.return con
        return con;
    }
}