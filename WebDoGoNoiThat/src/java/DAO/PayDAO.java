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
import model.Payment;

/**
 *
 * @author Admin
 */
public class PayDAO {
    Connection conn;
    PreparedStatement state ;
    ResultSet rs;
    
    public ArrayList<Payment> getAllPay(){
        DBContext db = new DBContext();
        
        try {
            conn=db.getConnection();
            state = conn.prepareStatement("select * from payment");
            rs = state.executeQuery();
            ArrayList<Payment> list = new ArrayList<>();
            while(rs.next()){
                list.add(new Payment(rs.getInt(1),rs.getString(2)));
            }
            return list ;
        } catch (Exception ex) {
            Logger.getLogger(PayDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
