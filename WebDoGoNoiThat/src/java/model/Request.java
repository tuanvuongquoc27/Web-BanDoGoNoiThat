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
    private int shopId;
    private boolean isRequestSell;
    private boolean isRequestBuy;
    private boolean isRequestNew;
    private boolean requestState;
    

    public Request() {
    }

    public Request(int customerId, String requestSeller, String reponse, int shopId, boolean isRequestSell, boolean isRequestBuy, boolean isRequestNew, boolean requestState) {
        this.customerId = customerId;
        this.requestSeller = requestSeller;
        this.reponse = reponse;
        this.shopId = shopId;
        this.isRequestSell = isRequestSell;
        this.isRequestBuy = isRequestBuy;
        this.isRequestNew = isRequestNew;
        this.requestState = requestState;
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

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public boolean isRequestSell() {
        return isRequestSell;
    }

    public void setRequestSell(boolean isRequestSell) {
        this.isRequestSell = isRequestSell;
    }

    public boolean isRequestBuy() {
        return isRequestBuy;
    }

    public void setRequestBuy(boolean isRequestBuy) {
        this.isRequestBuy = isRequestBuy;
    }

    public boolean isRequestNew() {
        return isRequestNew;
    }

    public void setRequestNew(boolean isRequestNew) {
        this.isRequestNew = isRequestNew;
    }

    public boolean isRequestState() {
        return requestState;
    }

    public void setRequestState(boolean requestState) {
        this.requestState = requestState;
    }

    
    
    
}
