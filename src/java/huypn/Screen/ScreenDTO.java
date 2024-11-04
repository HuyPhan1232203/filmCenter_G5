/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.Screen;

/**
 *
 * @author hien
 */
public class ScreenDTO {
    int screenID,screenNumber,totalSeat;

    public ScreenDTO() {
    }

    public ScreenDTO(int screenID, int screenNumber, int totalSeat) {
        this.screenID = screenID;
        this.screenNumber = screenNumber;
        this.totalSeat = totalSeat;
    }
    public ScreenDTO( int screenNumber, int totalSeat) {
        this.screenNumber = screenNumber;
        this.totalSeat = totalSeat;
    }

    public int getScreenID() {
        return screenID;
    }

    public void setScreenID(int screenID) {
        this.screenID = screenID;
    }

    public int getScreenNumber() {
        return screenNumber;
    }

    public void setScreenNumber(int screenNumber) {
        this.screenNumber = screenNumber;
    }

    public int getTotalSeat() {
        return totalSeat;
    }

    public void setTotalSeat(int totalSeat) {
        this.totalSeat = totalSeat;
    }
    
}
