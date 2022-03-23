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
public class Bill {
    private int billId;
    private int customerId;
    private int billPay;
    private int billTotal;
    private Date billDate;
    private Date billDateShip;
    private boolean ship;

    public Bill(int billId, int customerId, int billPay, int billTotal, Date billDate, Date billDateShip, boolean ship) {
        this.billId = billId;
        this.customerId = customerId;
        this.billPay = billPay;
        this.billTotal = billTotal;
        this.billDate = billDate;
        this.billDateShip = billDateShip;
        this.ship = ship;
    }
    
    public Bill() {
    }

    public Bill(int billId, int customerId, int billPay, int billTotal, Date billDate, Date billDateShip) {
        this.billId = billId;
        this.customerId = customerId;
        this.billPay = billPay;
        this.billTotal = billTotal;
        this.billDate = billDate;
        this.billDateShip = billDateShip;
    }

    public boolean isShip() {
        return ship;
    }

    public void setShip(boolean ship) {
        this.ship = ship;
    }
    

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getBillPay() {
        return billPay;
    }

    public void setBillPay(int billPay) {
        this.billPay = billPay;
    }

    public int getBillTotal() {
        return billTotal;
    }

    public void setBillTotal(int billTotal) {
        this.billTotal = billTotal;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public Date getBillDateShip() {
        return billDateShip;
    }

    public void setBillDateShip(Date billDateShip) {
        this.billDateShip = billDateShip;
    }

   

    
    
    
}
