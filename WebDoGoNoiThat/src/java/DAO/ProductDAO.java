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

    public ArrayList<Product> getAllProductQuanity(int start, int end ) {
        DBContext db = new DBContext();
        try {
            ArrayList<Product> listproduct = new ArrayList<>();
            conn = db.getConnection();
            state = conn.prepareStatement("WITH CTEResults AS  (SELECT * , ROW_NUMBER() OVER (ORDER BY productid) AS RowNum FROM product where productQuantity>0) "
                    + "SELECT *  FROM CTEResults WHERE RowNum BETWEEN "+start+" AND "+end);
            rs = state.executeQuery();
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public ArrayList<Product> getAllProduct(int start, int end ) {
        DBContext db = new DBContext();
        try {
            ArrayList<Product> listproduct = new ArrayList<>();
            conn = db.getConnection();
            state = conn.prepareStatement("WITH CTEResults AS  (SELECT * , ROW_NUMBER() OVER (ORDER BY productid) AS RowNum FROM product) "
                    + "SELECT *  FROM CTEResults WHERE RowNum BETWEEN "+start+" AND "+end);
            rs = state.executeQuery();
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Product> getAllCategory(int start, int end,String param) {
        DBContext db = new DBContext();
        try {
            ArrayList<Product> listproduct = new ArrayList<>();
            conn = db.getConnection();
            state = conn.prepareStatement("WITH CTEResults AS  (SELECT * , ROW_NUMBER() OVER (ORDER BY productid) AS RowNum FROM product where shopId= "+param+"  and productQuantity>0) "
                    + "SELECT *  FROM CTEResults WHERE RowNum BETWEEN "+start+" AND "+end);
            rs = state.executeQuery();
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Product> getAllProductSale(int start, int end) {
        DBContext db = new DBContext();
        try {
            ArrayList<Product> listproduct = new ArrayList<>();
            conn = db.getConnection();
            state = conn.prepareStatement("WITH CTEResults AS  (SELECT * , ROW_NUMBER() OVER (ORDER BY productid) AS RowNum FROM product where productOldPrice not like productNewPrice  and productQuantity>0) "
                    + "SELECT *  FROM CTEResults WHERE RowNum BETWEEN "+start+" AND "+end);
            rs = state.executeQuery();
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public ArrayList<Product> getAllCategoryType(int start, int end,String param,String query ) {
        DBContext db = new DBContext();
        try {
            ArrayList<Product> listproduct = new ArrayList<>();
            conn = db.getConnection();
            state = conn.prepareStatement("WITH CTEResults AS  (SELECT * , ROW_NUMBER() OVER (ORDER BY productid) AS RowNum FROM product where productType="+param +" and productQuantity>0) "
                    + "SELECT *  FROM CTEResults WHERE RowNum BETWEEN "+start+" AND "+end);
            rs = state.executeQuery();
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    
    
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12));
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
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
            String productImg, int productQuantity,int productQuantitySold, int productOldPrice, int productNewPrice,
            String productBrand, String productOrigin, int productType) {
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update product set "
                    + "productName =N'" + productName + "', "
                    + "productDescript=N'" + productDescript + "', "
                    + "productImg ='" + productImg + "', "
                    + "productQuantity=" + productQuantity + ", "
                    + "productQuantitySold=" + productQuantitySold + ", "
                    + "productOldPrice =" + productOldPrice + ", "
                    + "productNewPrice=" + productNewPrice + ", "
                    + " productBrand=N'" + productBrand + "',"
                    + "productOrigin=N'" + productOrigin + "', "
                    + " productType=" + productType + ""
                    + " where productId=" + productId);
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertProduct(String productName, String productDescript,
            String productImg,int shopId, int productQuantity, int productQuantitySold,int productEntryPrice, int productNewPrice,
            String productBrand, String productOrigin, int productType) {
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("insert into product values(N'"
                    + productName     + "',N'"
                    + productDescript + "','"
                    + productImg      + "', "
                    + shopId          + " , "
                    + productQuantity + " , "
                    + productQuantitySold + ", "
                    + productNewPrice + " , "
                    + productNewPrice + " ,N'"
                    + productBrand    + "',N'"
                    + productOrigin   + "',"
                    + productType+", "
                    + productEntryPrice +")");
            state.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateQuantity(int quantity, int productId){
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update product set productQuantity = productQuantity-"+quantity+" where productId="+productId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateQuantityProductSold(int productId) {
        DBContext db = new DBContext();
        try {
            String query = "update product set productQuantitySold = (select sum(a.productQuantity) from [order] as a where a.productId ="+productId+") where productId="+productId;
            conn = db.getConnection();
            
            state = conn.prepareStatement(query);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int checkProduct(String productName, String productDescript, String productImg, int shopId, String productBrand, String productOrigin, int convertType) {
        DBContext db = new DBContext();

        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from product where "
                    + "productName =N'" + productName + "' and "
                    + "productDescript=N'" + productDescript + "' and "
                    + "productImg ='" + productImg + "' and "
                    + "shopId =" + shopId + " and "        
                    + " productBrand=N'" + productBrand + "' and "
                    + "productOrigin=N'" + productOrigin + "' and "
                    + " productType=" + convertType);
            rs = state.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int count() {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select count(*) from product");
            rs = state.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int countProductShop(int shopId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select count(*) from product where shopId="+shopId);
            rs = state.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int countCategory(int productType) {//dếm số sp của 1 loại category
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select count(*) from product where productType= "+productType);
            rs = state.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Product> getProductSales() {
        DBContext db = new DBContext();
        try {
            ArrayList<Product> listproduct = new ArrayList<>();
            conn = db.getConnection();
            state = conn.prepareStatement("select * from product where productOldPrice=productNewPrice");
            rs = state.executeQuery();
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
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
