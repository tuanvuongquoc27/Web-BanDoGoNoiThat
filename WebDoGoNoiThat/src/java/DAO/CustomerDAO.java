/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author Admin
 */
public class CustomerDAO {

    Connection conn;
    PreparedStatement state;
    ResultSet rs;

    public ArrayList<Customer> getAllCustomer() {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from customer");
            rs = state.executeQuery();
            ArrayList<Customer> list = new ArrayList<>();
            while (rs.next()) {
                list.add( new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getBoolean(10)));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Customer getCustomerById(int customerId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from customer where customerId=" + customerId);
            rs = state.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getBoolean(10));
            }
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer getCustomerByEmail(String email) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from customer where customerEmail='" + email + "'");
            rs = state.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getBoolean(10));
            }
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertCustomer(int customerId, String customerName,
            String customerAddress,String customerAddressShip, String customerEmail, String customerPhone,
            String customerDate, String customerGender, String customerDOB, int active) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("insert into customer values("
                    + customerId                    + ",'"
                    + customerName                  + "',"
                    + customerAddress               + ","
                    + customerAddressShip           + ",'"
                    + customerEmail                 + "',"
                    + customerPhone                 + ",'"
                    + customerDate                  + "',"
                    + customerGender +","
                    + customerDOB +","
                    + active +")");
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void updateCustomer(int customerId, String customerName,
            String customerAddress,String customerAddressShip, String customerEmail, String customerPhone,
            String customerGender, String customerDOB, int active) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update customer set "
                    + "customerName=N'"   + customerName + "',"
                    + "customerAddress=N'"+ customerAddress + "',"
                    + "customerAddressShip=N'"+ customerAddressShip + "',"
                    + "customerEmail='"  + customerEmail + "',"
                    + "customerPhone='"  + customerPhone + "',"
                    + "customerGender="  + convertGender(customerGender) +","
                    + "customerDOB='"    + customerDOB +"',"
                    + "isActive = "+ active +" where customerId=" + customerId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int convertGender(String gender) {
        if (gender.equals("nam")) {
            return 1;
        }
        return 0;
    }

    public void deleteCustomer(int customerId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("delete customer where customerId=" + customerId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAddress(String addressship, int userId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update customer set customerAddressShip =N'"+addressship+"' where customerId=" + userId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateActive(int id, int i) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update customer set isActive ="+i+" where customerId=" + id);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
}
