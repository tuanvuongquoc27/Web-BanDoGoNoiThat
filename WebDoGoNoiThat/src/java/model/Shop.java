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
    private Date shopDate;

    public Shop() {
    }

    public Shop(int shopId, String shopName, String shopAddress, int shopProductQuantity, int shopProductSold, String shopPhone, Date shopDate) {
        this.shopId = shopId;
        this.shopName = shopName;
        this.shopAddress = shopAddress;
        this.shopProductQuantity = shopProductQuantity;
        this.shopProductSold = shopProductSold;
        this.shopPhone = shopPhone;
        this.shopDate = shopDate;
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

    public void setShopDate(Date shopDate) {
        this.shopDate = shopDate;
    }

    public Date getShopDate() {
        return shopDate;
    }
    
    
    
}
