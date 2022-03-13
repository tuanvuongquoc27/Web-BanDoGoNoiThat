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
            state = conn.prepareStatement("select * from bill where billId=" + userId);
            rs = state.executeQuery();
            while (rs.next()) {
                return new Bill(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4));
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
            state = conn.prepareStatement("select * from bill where billId=" + userId);
            rs = state.executeQuery();
            ArrayList<Bill> listbill = new ArrayList<>();
            while (rs.next()) {
                listbill.add(new Bill(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4)));
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
            state = conn.prepareStatement("select * from bill where customerId=" + userId +" and billDate is null");
            
            rs = state.executeQuery();
            
            while (rs.next()) {
                return new Bill(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4));
            }
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
}
