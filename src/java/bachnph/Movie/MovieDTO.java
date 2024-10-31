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
    String movieName, movieImage ;
    int movieDuration;
    String movieTitle, movieGenre, movieSynopsis;
    
    public MovieDTO(){
        
    }

    public MovieDTO(int movieID, String movieName, String movieImage, int movieDuration, String movieTitle, String movieGenre, String movieSynopsis) {
        this.movieID = movieID;
        this.movieName = movieName;
        this.movieImage = movieImage;
        this.movieDuration = movieDuration;
        this.movieTitle = movieTitle;
        this.movieGenre = movieGenre;
        this.movieSynopsis = movieSynopsis;
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

    public int getMovieDuration() {
        return movieDuration;
    }

    public void setMovieDuration(int movieDuration) {
        this.movieDuration = movieDuration;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getMovieGenre() {
        return movieGenre;
    }

    public void setMovieGenre(String movieGenre) {
        this.movieGenre = movieGenre;
    }

    public String getMovieSynopsis() {
        return movieSynopsis;
    }

    public void setMovieSynopsis(String movieSynopsis) {
        this.movieSynopsis = movieSynopsis;
    }

    
    



    
}
