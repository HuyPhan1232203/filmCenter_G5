/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachnph.Movie;

import huypn.User.UserDTO;
import huypn.util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MovieDAO {

    private ArrayList<MovieDTO> movieList;

    /**
     *
     * @return
     */
    public ArrayList<MovieDTO> getMovie() {

        return movieList;

    }

    public ArrayList<MovieDTO> showAllMovie()
            throws ClassNotFoundException, SQLException {
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try {
            if (con != null) {
                String sql = " SELECT d.Title, m.MovieName,d.Genre, d.Duration, d.Synopsis,m.MovieImage "
                        + " FROM Movies m "
                        + " JOIN MovieDetails d ON m.MovieID = d.MovieID; ";
                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    int MovieID = rs.getInt("MovieID");
                    String MovieTitle = rs.getString("MovieTitle");
                    String MovieName = rs.getString("MovieName");
                    String Genre = rs.getString("MovieGenre");
                    int Duration = rs.getInt("MovieDuration");
                    String Synopsis = rs.getString("MovieSynopsis");               
                    String MovieImage = rs.getString("MovieImage");
                    MovieDTO dto = new MovieDTO(MovieID, MovieName, MovieImage, Duration, MovieTitle, Genre, Synopsis);
                    if (this.movieList == null) {
                        this.movieList = new ArrayList<>();
                    }
                    movieList.add(dto);
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
        return movieList;
    }

    public boolean addMovie(String name, String title, String image, String genre, int duration, String synopsis) throws ClassNotFoundException, SQLException {

        Connection con = DBHelper.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try {
            String sql = " INSERT INTO dbo.Movies( MovieName, MovieImage) VALUES(?,?); "
                    + " DECLARE @MovieID INT "
                    + " SET @MovieID = (SELECT TOP 1 MovieID FROM dbo.Movies ORDER BY MovieID DESC); "
                    + " INSERT INTO dbo.MovieDetails (MovieID, Title, Genre, Duration, Synopsis) VALUES (@MovieID, ?, ?, ?, ?); ";

            stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, image);
            stmt.setString(3, title);
            stmt.setString(4, genre);
            stmt.setInt(5, duration);
            stmt.setString(6, synopsis);
            int affectedRow = stmt.executeUpdate();
            if (affectedRow > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error inserting movie: " + e.getMessage());
        }
        return false;
    }

    public void updateMovie(MovieDTO movie) throws ClassNotFoundException, SQLException {
        String sql = " UPDATE dbo.Movies SET MovieID = ?, MovieName = ?, MovieImage = ? WHERE MovieID = ? ";
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, movie.getMovieID());
            stmt.setString(2, movie.getMovieName());
            stmt.setString(3, movie.getMovieImage());
            stmt.executeUpdate();
            System.out.println("Movie updated successfully.");
        }
    }

    public void deleteMovie(int id) throws ClassNotFoundException, SQLException {
        String sql = " DELETE FROM dbo.Movies WHERE MovieID = ? ";
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
