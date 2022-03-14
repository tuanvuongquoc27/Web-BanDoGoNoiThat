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
public class Seller {
    private int sellerId ;
    private String sellerName ;
    private String sellerAddress ;
    private String sellerEmail ;
    private String sellerPhone ;
    private String sellerDate;
    private boolean sellerGender;
    private String sellerDOB;

    public Seller() {
    }

    public Seller(int sellerId, String sellerName, String sellerAddress, String sellerEmail, String sellerPhone, String sellerDate, boolean sellerGender, String sellerDOB) {
        this.sellerId = sellerId;
        this.sellerName = sellerName;
        this.sellerAddress = sellerAddress;
        this.sellerEmail = sellerEmail;
        this.sellerPhone = sellerPhone;
        this.sellerDate = sellerDate;
        this.sellerGender = sellerGender;
        this.sellerDOB = sellerDOB;
    }

    

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getSellerAddress() {
        return sellerAddress;
    }

    public void setSellerAddress(String sellerAddress) {
        this.sellerAddress = sellerAddress;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public String getSellerPhone() {
        return sellerPhone;
    }

    public void setSellerPhone(String sellerPhone) {
        this.sellerPhone = sellerPhone;
    }

    public String getSellerDate() {
        return sellerDate;
    }

    public void setSellerDate(String sellerDate) {
        this.sellerDate = sellerDate;
    }

    public boolean isSellerGender() {
        return sellerGender;
    }

    public void setSellerGender(boolean sellerGender) {
        this.sellerGender = sellerGender;
    }

    public String getSellerDOB() {
        return sellerDOB;
    }

    public void setSellerDOB(String sellerDOB) {
        this.sellerDOB = sellerDOB;
    }
    
    
}
