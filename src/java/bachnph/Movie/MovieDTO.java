/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachnph.Movie;

/**
 *
 * @author Admin
 */
public class MovieDTO {
    int movieID;
    String movieName, movieImage;

    public MovieDTO() {
    }

    public MovieDTO(int movieID, String movieName, String movieImage) {
        this.movieID = movieID;
        this.movieName = movieName;
        this.movieImage = movieImage;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieImage() {
        return movieImage;
    }

    public void setMovieImage(String movieImage) {
        this.movieImage = movieImage;
    }



    
}
