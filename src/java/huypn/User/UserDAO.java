/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.User;


import huypn.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.websocket.Session;

/**
 *
 * @author hien
 */
public class UserDAO implements Serializable{
    public UserDTO checkLogin(String username,String password)
            throws ClassNotFoundException,SQLException{
        Connection con=DBHelper.getConnection();
        PreparedStatement stm=null;
        ResultSet rs=null;
        UserDTO result=null;
        try{
            if(con!=null){
                String sql="select UserID,Username,Role,Phonenumber "
                            + "from dbo.Users "
                            + "where Username=? "
                            + "and Passwordhash=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs=stm.executeQuery();
                if(rs.next()){
                    int userID=rs.getInt("UserID");
                    String phone=rs.getString("Phonenumber");
                    boolean role=rs.getBoolean("Role");
                    result = new UserDTO(username, password, phone, role, userID);
                }
            }
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return result;
    }
    public boolean checkSignUp(String username,String password,String number,boolean role)
            throws ClassNotFoundException,SQLException{
        Connection con=DBHelper.getConnection();
        PreparedStatement stm=null;
        ResultSet rs=null;
        UserDTO result=null;
        try{
            if(con!=null){
                String sql="Insert into dbo.Users (Username,Phonenumber,Passwordhash,Role) "
                        + "Values (?,?,?,?)";
                stm=con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, number);
                stm.setString(3, password);
                stm.setBoolean(4, role);
                int affectedRow=stm.executeUpdate();
                if(affectedRow>0){
                    return true;
                }
                
            }
            
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return false;
    }
}
