/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Shop {
    private int shopId ;
    private String shopName ;
    private String shopAddress ;
    private int shopProductQuantity ;
    private int shopProductSold ;
    private String shopPhone ;
    private String shopEmail;
    private String shopDate;
    private int shopRevenue;
    private int shopProfit;
    private boolean shopActive;

    public Shop() {
    }

    public Shop(int shopId, String shopName, String shopAddress, int shopProductQuantity, int shopProductSold, String shopPhone, String shopEmail, String shopDate, int shopRevenue, int shopProfit, boolean shopActive) {
        this.shopId = shopId;
        this.shopName = shopName;
        this.shopAddress = shopAddress;
        this.shopProductQuantity = shopProductQuantity;
        this.shopProductSold = shopProductSold;
        this.shopPhone = shopPhone;
        this.shopEmail = shopEmail;
        this.shopDate = shopDate;
        this.shopRevenue = shopRevenue;
        this.shopProfit = shopProfit;
        this.shopActive = shopActive;
    }
    
    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopAddress() {
        return shopAddress;
    }

    public void setShopAddress(String shopAddress) {
        this.shopAddress = shopAddress;
    }

    public int getShopProductQuantity() {
        return shopProductQuantity;
    }

    public void setShopProductQuantity(int shopProductQuantity) {
        this.shopProductQuantity = shopProductQuantity;
    }

    public int getShopProductSold() {
        return shopProductSold;
    }

    public void setShopProductSold(int shopProductSold) {
        this.shopProductSold = shopProductSold;
    }

    public String getShopPhone() {
        return shopPhone;
    }

    public void setShopPhone(String shopPhone) {
        this.shopPhone = shopPhone;
    }

    public String getShopEmail() {
        return shopEmail;
    }

    public void setShopEmail(String shopEmail) {
        this.shopEmail = shopEmail;
    }

    public void setShopDate(String shopDate) {
        this.shopDate = shopDate;
    }

    public String getShopDate() {
        return shopDate;
    }

    public int getShopRevenue() {
        return shopRevenue;
    }

    public void setShopRevenue(int shopRevenue) {
        this.shopRevenue = shopRevenue;
    }

    public int getShopProfit() {
        return shopProfit;
    }

    public void setShopProfit(int shopProfit) {
        this.shopProfit = shopProfit;
    }

    public boolean isShopActive() {
        return shopActive;
    }

    public void setShopActive(boolean shopActive) {
        this.shopActive = shopActive;
    }
    
    
    
    
    
}
