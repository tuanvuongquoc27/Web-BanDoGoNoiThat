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
import model.Shop;

/**
 *
 * @author Admin
 */
public class ShopDAO {
    Connection conn;
    PreparedStatement state;
    ResultSet rs ;
    
    public ArrayList<Shop> getAllShop(){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from shop");
            rs = state.executeQuery();
            ArrayList<Shop> listshop = new ArrayList<>();
            while(rs.next()){
                listshop.add(new Shop(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getBoolean(11)));
            }
            return listshop;
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Shop getShop(int shopId){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from shop where shopId="+shopId);
            rs = state.executeQuery();
            while(rs.next()){
                return new Shop(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getBoolean(11));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void deleteShop(int shopId){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("delete shop where shopId="+shopId);
            state.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void insertShop (int shopId,String shopName, String ShopAddress,String shopPhone, String shopEmail, String shopDate){
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("insert into shop values("
                    + shopId + ",N'"
                    + shopName + "',N'"
                    + ShopAddress +"',0,0,'"
                    + shopPhone + "','"
                    + shopEmail + "','"
                    + shopDate + "',0,0,0)");
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
