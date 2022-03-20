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
    ResultSet rs;

    public ArrayList<Shop> getAllShop() {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from shop");
            rs = state.executeQuery();
            ArrayList<Shop> listshop = new ArrayList<>();
            while (rs.next()) {
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

    public Shop getShop(int shopId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from shop where shopId=" + shopId);
            rs = state.executeQuery();
            while (rs.next()) {
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

    public void deleteShop(int shopId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("delete shop where shopId=" + shopId);
            state.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insertShop(int shopId, String shopName, String ShopAddress, String shopPhone, String shopEmail, String shopDate) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("insert into shop values("
                    + shopId + ",N'"
                    + shopName + "',N'"
                    + ShopAddress + "',0,0,'"
                    + shopPhone + "','"
                    + shopEmail + "',"
                    + shopDate + ",0,0,0)");
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateActice(int shopId, int shopActive) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update shop set shopActive=" + shopActive + " where shopId = " + shopId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantity(int shopId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update shop set shopProductQuantity = ( select SUM(productQuantity) from product where shopId= " + shopId + " ) where shopId = " + shopId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProductSold(int shopId) {

        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select SUM(a.productQuantity) from [order] as a,product as b where b.shopId = " + shopId + " and b.productId=a.productId");
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDate(int userId, String dateNow) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update shop set shopDate='" + dateNow + "' where shopId=" + userId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantitySold(int shopId) {
        DBContext db = new DBContext();
        try {
            String query = "(select sum(a.productQuantity) from [order] as a where a.productId in (select a.productId from product as a where a.shopId =" + shopId + ")and a.sold = 1) where shopId = " + shopId;
            conn = db.getConnection();

            state = conn.prepareStatement("update shop set shopProductSold = " + query);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Shop> getAll(int start, int end) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("WITH CTEResults AS  (SELECT * , ROW_NUMBER() OVER (ORDER BY shopId) AS RowNum FROM shop ) "
                    + "SELECT *  FROM CTEResults WHERE RowNum BETWEEN " + start + " AND " + end);
            rs = state.executeQuery();
            ArrayList<Shop> listshop = new ArrayList<>();
            while (rs.next()) {
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

    public int count() {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select count(*) from shop");
            rs = state.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void updateShop(String shopid, String name, String address, String email, String phone) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update shop set "
                    + "shopName = N'" + name + "',"
                    + " shopAddress=N'" + address + "',"
                    + "shopPhone='" + phone + "',"
                    + " shopEmail = '" + email + "'"
                    + " where shopId =" + shopid);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateShopRevenue(int shopId) {//billcontroller

        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update shop set shopRevenue = \n" +
                    "(select SUM(a.productTotal) from [order] as a, bill as b , product as c where a.billId = b.billId"
                    + " and a.productId = c.productId and c.shopId = "+shopId+" group by c.shopId) where shopId = "+shopId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateShopProfit(int shopId) {//billcontroller

        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update shop set shopProfit ="
                    + " shopRevenue - (select SUM(a.productEntryPrice) from product as a where a.shopId ="+shopId+"group by a.shopId) where shopId="+shopId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    


}
