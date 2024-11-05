/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.Booking;

import bachnph.Movie.MovieDTO;
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
public class BookingDAO implements Serializable{
    public boolean addBooking(int bookingID, int userID,int showtimeID,int ScreenID,String seats, String bookingTime,float total) 
            throws ClassNotFoundException, SQLException {

        Connection con = DBHelper.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try {
            String sql = " INSERT INTO dbo.Booking(UserID,ShowtimeID,ScreenID,Seats,TotalCost,BookingTime)"
                    + " VALUES(?,?,?,?,?,?)";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, userID);
            stmt.setInt(2, showtimeID);
            stmt.setInt(3, ScreenID);
            stmt.setString(4, seats);
            stmt.setString(5, bookingTime);
            stmt.setFloat(6, total);
            int affectedRow = stmt.executeUpdate();
            if (affectedRow > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error inserting screen: " + e.getMessage());
        }
        return false;
    }

}
