/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.Booking;

import java.io.Serializable;

/**
 *
 * @author hien
 */
public class BookingDTO implements Serializable{
    int bookingID,userID,showtimeID,screenID;
    String seats,bookingTime;
    float totalCost;

    public BookingDTO() {
    }

    public BookingDTO(int bookingID, int userID, int showtimeID, int screenID, String seats, String bookingTime, float totalCost) {
        this.bookingID = bookingID;
        this.userID = userID;
        this.showtimeID = showtimeID;
        this.screenID = screenID;
        this.seats = seats;
        this.bookingTime = bookingTime;
        this.totalCost = totalCost;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getShowtimeID() {
        return showtimeID;
    }

    public void setShowtimeID(int showtimeID) {
        this.showtimeID = showtimeID;
    }

    public int getScreenID() {
        return screenID;
    }

    public void setScreenID(int screenID) {
        this.screenID = screenID;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }

    public float getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(float totalCost) {
        this.totalCost = totalCost;
    }
    
}
