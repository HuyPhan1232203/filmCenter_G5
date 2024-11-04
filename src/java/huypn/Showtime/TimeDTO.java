/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.Showtime;

import java.io.Serializable;

/**
 *
 * @author hien
 */
public class TimeDTO implements Serializable{
    int showTimeID,movieID,screenID;
    String dateTime;

    public TimeDTO() {
    }

    public TimeDTO(int showTimeID, int movieID, int screenID, String dateTime) {
        this.showTimeID = showTimeID;
        this.movieID = movieID;
        this.screenID = screenID;
        this.dateTime = dateTime;
    }

    public int getShowTimeID() {
        return showTimeID;
    }

    public void setShowTimeID(int showTimeID) {
        this.showTimeID = showTimeID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public int getScreenID() {
        return screenID;
    }

    public void setScreenID(int screenID) {
        this.screenID = screenID;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
    
}
