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
public class Product {
    private int productId ;
    private String productName ;
    private String productDescript ;
    private String productImg ;
    private int shopId ;
    private int productQuantity ;
    private int productOldPrice ;
    private int productNewPrice ;
    private String productBrand;
    private String productOrigin;
    private int productType ;	
    

    public Product() {
    }

    public Product(int productId, String productName, String productDescript, String productImg, int shopId, int productQuantity, int productOldPrice, int productNewPrice, String productBrand, String productOrigin, int productType) {
        this.productId = productId;
        this.productName = productName;
        this.productDescript = productDescript;
        this.productImg = productImg;
        this.shopId = shopId;
        this.productQuantity = productQuantity;
        this.productOldPrice = productOldPrice;
        this.productNewPrice = productNewPrice;
        this.productBrand = productBrand;
        this.productOrigin = productOrigin;
        this.productType = productType;
    }

    

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescript() {
        return productDescript;
    }

    public void setProductDescript(String productDescript) {
        this.productDescript = productDescript;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getProductOldPrice() {
        return productOldPrice;
    }

    public void setProductOldPrice(int productOldPrice) {
        this.productOldPrice = productOldPrice;
    }

    public int getProductNewPrice() {
        return productNewPrice;
    }

    public void setProductNewPrice(int productNewPrice) {
        this.productNewPrice = productNewPrice;
    }

    public String getProductBrand() {
        return productBrand;
    }

    public void setProductBrand(String productBrand) {
        this.productBrand = productBrand;
    }

    public String getProductOrigin() {
        return productOrigin;
    }

    public void setProductOrigin(String productOrigin) {
        this.productOrigin = productOrigin;
    }

    public int getProductType() {
        return productType;
    }

    public void setProductType(int productType) {
        this.productType = productType;
    }
    
    

    
}
