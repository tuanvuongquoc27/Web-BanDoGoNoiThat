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
                        rs.getDate(7)));
            }
            return listshop;
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Shop getProduct(int shopId){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("select * from shop where shopId="+shopId);
            rs = state.executeQuery();
            Shop product = new Shop();
            while(rs.next()){
                return new Shop(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDate(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
