/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minht.status;

/**
 *
 * @author MinhT
 */
public class StatusDTO {
    private int statusID;
    private String statusName;

    @Override
    public String toString() {
        return "StatusDTO{" + "statusID=" + statusID + ", statusName=" + statusName + '}';
    }

    public StatusDTO(int statusID, String statusName) {
        this.statusID = statusID;
        this.statusName = statusName;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
    
}
