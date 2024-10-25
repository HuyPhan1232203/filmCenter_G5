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
    private List<MovieDTO> movie;
    public List<MovieDTO> getMovie() {
        
        return movie;

    }

    public MovieDTO showAllMovie()
            throws ClassNotFoundException, SQLException {
        Connection con = DBHelper.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        MovieDTO result = null;
        try {
            if (con != null) {
                String sql = "SELECT MovieID, MovieName, MovieImage FROM dbo.Movies";
                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                
                while (rs.next()) {
                    int MovieID=rs.getInt("MovieID");
                    String MovieName=rs.getString("MovieName");
                    String MovieImage=rs.getString("MovieImage");
                    MovieDTO dto= new MovieDTO(MovieID, MovieName, MovieImage);
                    if(this.movie==null){
                        this.movie=new ArrayList<>();
                    }
                    movie.add(dto);
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
}
