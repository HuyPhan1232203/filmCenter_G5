/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachnph.Seat;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class SeatDTO implements Serializable{
    private int seatID,screenID;
    private String seatNumber,seatType;
    private boolean isAvailable;
    private float price;

    public SeatDTO(int seatID, int screenID, String seatNumber, String seatType, boolean isAvailable, float price) {
        this.seatID = seatID;
        this.screenID = screenID;
        this.seatNumber = seatNumber;
        this.seatType = seatType;
        this.isAvailable = isAvailable;
        this.price = price;
    }

    public SeatDTO() {
    }

    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public int getScreenID() {
        return screenID;
    }

    public void setScreenID(int screenID) {
        this.screenID = screenID;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

   
    
}
