/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;

/**
 *
 * @author Admin
 */
public class BillDAO {
    Connection conn;
    PreparedStatement state ;
    ResultSet rs;
    
    public void insertBill(int customerId){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state = conn.prepareStatement("insert into bill(customerId) values('"+customerId+"')");
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public Bill getBill(int userId){
        
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from bill where customerId=" + userId);
            rs = state.executeQuery();
            while (rs.next()) {
                return new Bill(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getDate(6));
            }
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Bill> getAllBill(int userId){
        
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from bill where customerId=" + userId);
            rs = state.executeQuery();
            ArrayList<Bill> listbill = new ArrayList<>();
            while (rs.next()) {
                listbill.add(new Bill(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getDate(6)));
            }
            return listbill;
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Bill getBillEmpty(int userId){
        
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from bill where customerId=" + userId +" and billDateOrder is null");
            
            rs = state.executeQuery();
            
            while (rs.next()) {
                return new Bill(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getDate(6));
            }
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateBill(int billId, int total, String dateNow, int billPay) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update bill set billTotal = "+total + ",billPay="+ billPay +" , billDateOrder = '"+dateNow+"' where billId = "+billId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteBill(int userId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("delete bill where customerId="+userId+" and billPay is null " );
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteBillById(int userId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("delete bill where customerId="+userId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateShip(int billId , int status){
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update bill set ship = "+status+" where billId="+billId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
