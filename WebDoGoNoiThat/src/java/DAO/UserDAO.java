/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO {

    Connection conn;
    PreparedStatement state;
    ResultSet rs;

    public ArrayList<User> getAllUser() {
        DBContext db = new DBContext();
        ArrayList<User> listacc = new ArrayList<>();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from product");
            rs = state.executeQuery();
            
            while (rs.next()) {
                User acc = new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4));
                listacc.add(acc);
            }
            return listacc;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public User getUser(String username, String password){
        DBContext db = new DBContext();
        ArrayList<User> listacc = new ArrayList<>();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from User where username = '"+username+"'"
                    + " and password='"+password+"'");
            rs = state.executeQuery();
            
            while (rs.next()) {
                return new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4)); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
}