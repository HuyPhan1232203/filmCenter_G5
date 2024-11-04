/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachnph.Seat;

import huypn.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hien
 */
public class SeatDAO implements Serializable{
     private ArrayList<SeatDTO> seatList;

    /**
     *
     * @return
     */
    public ArrayList<SeatDTO> getSeat() {

        return seatList;

    }

    public ArrayList<SeatDTO> showAllSeat(int id)
            throws ClassNotFoundException, SQLException {
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (con != null) {
                String sql = "Select SeatID,SeatNumber,IsAvailable,SeatType,Price "
                        + "from dbo.Seat where ScreenID=? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    System.out.println("result");
                    int SeatID = rs.getInt("SeatID");
                    String SeatNumber = rs.getString("SeatNumber");
                    String SeatType = rs.getString("SeatType");
                    boolean IsAvailable=rs.getBoolean("IsAvailable");
                    float price=rs.getFloat("Price");
                    SeatDTO result=new SeatDTO(SeatID, id, SeatNumber, SeatType, IsAvailable, price);
                    if (this.seatList == null) {
                        this.seatList = new ArrayList<>();
                    }
                    seatList.add(result);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return seatList;
    }
}
