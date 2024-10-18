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
/*
public class DBHelper {
    public static Connection getConnection()
        throws ClassNotFoundException,SQLException{
        //1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create connection string to DBMS. Syntax: protocol://ip:port;databaseName=
        String url="jdbc:sqlserver://"  //protocol
                + "localhost:1433;"   //container
                + "databaseName=PRJMovieCenter";
        //3. get connection from Driver Manager
        Connection con= DriverManager.getConnection(url, "sa", "12345");
        //4.return con
        return con;
    }
}
*/

public class DBHelper {
    

    public static Connection getConnection(){
        
        String url;        
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        } else{
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        }
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            System.out.println("PRJ301DEMO: Can not load JDBC Driver. Please check your pom file");
        }
        
        try {
            Connection con = DriverManager.getConnection(url, userID, password);
            return con;
        } catch (SQLException ex) {
            System.out.println("PRJ301DEMO: Can not connect SQL Server. Reason: " + ex.getMessage());                        
        }
        return null;
    }
    
    
    private final static String serverName = "localhost";
    private final static String dbName = "PRJMovieName";
    private final static String portNumber = "1433";
    private final static String instance = "";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final static String userID = "sa";
    private final static String password = "12345";
}