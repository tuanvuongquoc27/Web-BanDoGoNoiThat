/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Request {
    private int customerId;
    private String requestSeller;
    private String reponse;

    public Request() {
    }

    public Request(int customerId, String requestSeller, String reponse) {
        this.customerId = customerId;
        this.requestSeller = requestSeller;
        this.reponse = reponse;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getRequestSeller() {
        return requestSeller;
    }

    public void setRequestSeller(String requestSeller) {
        this.requestSeller = requestSeller;
    }

    public String getReponse() {
        return reponse;
    }

    public void setReponse(String reponse) {
        this.reponse = reponse;
    }
    
    
    
}
