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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
            state=conn.prepareStatement("select * from [user]");
            rs = state.executeQuery();
            
            while (rs.next()) {
                User acc = new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getBoolean(4),
                rs.getBoolean(5),
                rs.getBoolean(6),
                rs.getString(7),
                rs.getInt(8),
                rs.getBoolean(9));
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
    
    public User getUserByNameAndPass(String username,String password){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from [user] where username = '"+username+"' and password='"+password+"'");
            rs = state.executeQuery();
            while (rs.next()) {
                return new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getBoolean(4),
                rs.getBoolean(5),
                rs.getBoolean(6),
                rs.getString(7),
                rs.getInt(8),
                rs.getBoolean(9)); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public User getUserByUserName(String username){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from [user] where username = '"+username+"'");
            rs = state.executeQuery();
            while (rs.next()) {
                return new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getBoolean(4),
                rs.getBoolean(5),
                rs.getBoolean(6),
                rs.getString(7),
                rs.getInt(8),
                rs.getBoolean(9)); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public User getUserByUserId(int userId){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from [user] where userId = "+userId);
            rs = state.executeQuery();
            while (rs.next()) {
                return new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getBoolean(4),
                rs.getBoolean(5),
                rs.getBoolean(6),
                rs.getString(7),
                rs.getInt(8),
                rs.getBoolean(9)); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insertUserRoleCustomer(String username, String password) {
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("insert into [user] values('"+username+"','"+password+"',0,1,0,null,0,1)");
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePassword(String newPass, int userId){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("update [user] set password='"+newPass+"' where userId="+userId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteUser(int userId){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("delete [user] where userId="+userId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateBalance(int userId , int balance){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("update [user] set userBalance=userBalance+"+ balance +" where userId="+userId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    public void updateRole(int userId ,String role, int newrole){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("update [user] set "+role+" = "+ newrole +" where userId="+userId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateActice(int userId, int active){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("update [user] set isActive = "+ active +" where userId="+userId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateImg(int userId, String image) {
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("update [user] set userImg = '"+ image +"' where userId="+userId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
