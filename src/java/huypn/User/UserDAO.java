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
                 String sql="select lastname,isAdmin "
                            + "from Registration "
                            + "where username=? "
                            + "and password=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs=stm.executeQuery();
                if(rs.next()){
                    String fullname=rs.getString("lastname");
                    boolean role=rs.getBoolean("isAdmin");
                    result=new UserDTO(username, "", fullname, role);
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
}
