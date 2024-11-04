package huypn.Screen;

import bachnph.Movie.MovieDTO;
import huypn.util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author hien
 */
public class ScreenDAO {

    private ArrayList<ScreenDTO> screenList;

    /**
     *
     * @return
     */
    public ArrayList<ScreenDTO> getScreen() {

        return screenList;

    }

    public ArrayList<ScreenDTO> showAllScreen()
            throws ClassNotFoundException, SQLException {
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try {
            if (con != null) {
                String sql = "Select ScreenID, ScreenNumber, TotalSeats from dbo.Screen ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int ScreenID = rs.getInt("ScreenID");
                    int ScreenNumber = rs.getInt("ScreenNumber");
                    int TotalSeats = rs.getInt("TotalSeats");
                    ScreenDTO dto = new ScreenDTO(ScreenID, ScreenNumber, TotalSeats);
                    if (this.screenList == null) {
                        this.screenList = new ArrayList<>();
                    }
                    screenList.add(dto);
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
        return screenList;
    }

    public ScreenDTO showDetail(int id)
            throws ClassNotFoundException, SQLException {
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        ScreenDTO result = null;
        try {
            if (con != null) {
                String sql = "Select ScreenID,ScreenNumber, TotalSeats from dbo.Screen where ScreenID=?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int ScreenID = rs.getInt("ScreenID");
                    int ScreenNumber = rs.getInt("ScreenNumber");
                    int TotalSeats = rs.getInt("TotalSeats");
                    result = new ScreenDTO(ScreenID,ScreenNumber, TotalSeats);
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
        return result;
    }

    public boolean addMovie(int number, int total) throws ClassNotFoundException, SQLException {

        Connection con = DBHelper.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try {
            String sql = " INSERT INTO dbo.Screen( ScreenNumber, TotalSeats) VALUES(?,?)";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, number);
            stmt.setInt(2, total);
            int affectedRow = stmt.executeUpdate();
            if (affectedRow > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error inserting screen: " + e.getMessage());
        }
        return false;
    }

    public boolean updateScreen(int id, int number, int total) throws ClassNotFoundException, SQLException {
        Connection con = DBHelper.getConnection();
        PreparedStatement stmt = null;
        try {
            if(con!=null){
                System.out.println("connect");
                String sql = "UPDATE dbo.Screen SET ScreenNumber = ?, "
                    + "TotalSeats = ? "
                    + "WHERE ScreenID = ? ";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, number);
            stmt.setInt(2, total);
            stmt.setInt(3, id);
            int affectedRow = stmt.executeUpdate();
            if (affectedRow > 0) {
                System.out.println("rs");
                return true;
            }
            }
        }finally{
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteMovie(int movieID) throws ClassNotFoundException, SQLException {
        String deleteDetailSql = "DELETE FROM dbo.MovieDetails WHERE MovieID = ? "
                + "DELETE FROM dbo.Movies WHERE MovieID = ?";

        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(deleteDetailSql);
            stm.setInt(1, movieID);
            stm.setInt(2, movieID);
            int afftedRow = stm.executeUpdate();
            if (afftedRow > 0) {
                return true;
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public void updateMovie(int movieID, String name, String title, String genre, String synopis, int duration)
            throws ClassNotFoundException, SQLException {
        String deleteDetailSql = "UPDATE dbo.Movies "
                + "set MovieName = ? "
                + "WHERE MovieID=? "
                + "UPDATE dbo.MovieDetails "
                + "set Title=?, "
                + "Genre=?, "
                + "Duration=?, "
                + "Synopsis=? "
                + "WHERE MovieID=? ";

        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        try {
            stm = con.prepareStatement(deleteDetailSql);
            stm.setString(1, name);
            stm.setInt(2, movieID);
            stm.setString(3, title);
            stm.setString(4, genre);
            stm.setInt(5, duration);
            stm.setString(6, synopis);
            stm.setInt(7, movieID);
            stm.executeUpdate();
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
    }

}
