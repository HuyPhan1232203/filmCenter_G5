/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.Showtime;

import huypn.Screen.ScreenDTO;
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
public class TimeDAO implements Serializable{
      private ArrayList<TimeDTO> showTimeList;

    /**
     *
     * @return
     */
    public ArrayList<TimeDTO> getShowTimes() {

        return showTimeList;

    }

    public ArrayList<TimeDTO> showAllTime(int movie,int screen)
            throws ClassNotFoundException, SQLException {
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (con != null) {
                String sql = "Select ShowtimeID, MovieID, ScreenID,ShowDateTime from dbo.Showtime "
                        + "where MovieID=? and ScreenID=? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, movie);
                stm.setInt(2, screen);
                rs = stm.executeQuery();
                while (rs.next()) {
                    System.out.println("resultTime");
                    int ScreenID = rs.getInt("ScreenID");
                    int ShowtimeID = rs.getInt("ShowtimeID");
                    int MovieID = rs.getInt("MovieID");
                    String dateTime= rs.getString("ShowDateTime");
                    TimeDTO dto=new TimeDTO(ShowtimeID, MovieID, ScreenID, dateTime);
                    if (this.showTimeList == null) {
                        this.showTimeList = new ArrayList<>();
                    }
                    showTimeList.add(dto);
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
        return showTimeList;
    }
}
