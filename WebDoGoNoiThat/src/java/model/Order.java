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
public class Order {
    private int orderId ;
    private int customerId ;
    private int billId ;
    private int productId ;
    private int productPrice;
    private int productQuantity;
    private int productTotal ;
    private boolean sold;

    public Order() {
    }

    public Order(int orderId, int customerId, int billId, int productId, int productPrice, int productQuantity, int productTotal, boolean sold) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.billId = billId;
        this.productId = productId;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productTotal = productTotal;
        this.sold = sold;
    }

    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getProductTotal() {
        return productTotal;
    }

    public void setProductTotal(int productTotal) {
        this.productTotal = productTotal;
    }

    public boolean isSold() {
        return sold;
    }

    public void setSold(boolean sold) {
        this.sold = sold;
    }
    
    
            
}
