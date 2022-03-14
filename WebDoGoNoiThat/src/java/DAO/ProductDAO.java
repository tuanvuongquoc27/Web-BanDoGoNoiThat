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
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection conn;
    PreparedStatement state;
    ResultSet rs;

    public ArrayList<Product> getAllProduct() {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from product");
            rs = state.executeQuery();
            ArrayList<Product> listproduct = new ArrayList<>();
            while (rs.next()) {
                listproduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getProduct(int productId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from product where productId=" + productId);
            rs = state.executeQuery();
            Product product = new Product();
            while (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProductbyShopId(int shopId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from product where shopId=" + shopId);
            rs = state.executeQuery();
            ArrayList<Product> productlist = new ArrayList<>();
            while (rs.next()) {
                productlist.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
            return productlist;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProductbyCategoryId(int categoryId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from product where productType=" + categoryId);
            rs = state.executeQuery();
            ArrayList<Product> productlist = new ArrayList<>();
            while (rs.next()) {
                productlist.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11)));
            }
            return productlist;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteProduct(int productId) {
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("delete product where productId = " + productId);
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void deleteProductByShopId(int shopId) {
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("delete product where shopId = " + shopId);
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateProduct(int productId, String productName, String productDescript,
            String productImg, int productQuantity, int productOldPrice, int productNewPrice,
            String productBrand, String productOrigin, int productType) {
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update product set "
                    + "productName =N'" + productName + "', "
                    + "productDescript=N'" + productDescript + "', "
                    + "productImg ='" + productImg + "', "
                    + "productQuantity=" + productQuantity + ", "
                    + "productOldPrice =" + productOldPrice + ", "
                    + "productNewPrice=" + productNewPrice + ", "
                    + " productBrand=N'" + productBrand + "',"
                    + "productOrigin=" + productOrigin + ", "
                    + " productType=" + productType + ""
                    + " where productId=" + productId);
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertProduct(String productName, String productDescript,
            String productImg, int productQuantity, int productNewPrice,
            String productBrand, String productOrigin, int productType) {
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("insert into product values('"
                    + productName + "', ''"
                    + productDescript + "', "
                    + productImg + "', "
                    + productQuantity + ", "
                    + productNewPrice + ", "
                    + productNewPrice + ", "
                    + productBrand + "','"
                    + productOrigin + ","
                    + productType+")");
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateQuantity(int quantity, int productId){
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update product set productQuantity = productQuantity- "+quantity+" where productId="+productId);
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
