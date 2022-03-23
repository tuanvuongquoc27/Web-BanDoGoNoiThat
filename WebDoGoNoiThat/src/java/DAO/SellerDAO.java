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
import model.Seller;

/**
 *
 * @author Admin
 */
public class SellerDAO {
    
    Connection conn;
    PreparedStatement state;
    ResultSet rs; 
    
    public Seller getSellerById(int sellerId) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("select * from seller where sellerId=" + sellerId);
            rs = state.executeQuery();
            while (rs.next()) {
                return new Seller(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8),
                        rs.getBoolean(9));
            }
        } catch (Exception ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Seller> getAllSeller( String query) {
        DBContext db = new DBContext();
        ArrayList<Seller> sellerlist = new ArrayList<>();
        try {   
            conn=db.getConnection();//select * from seller as a, shop as b where a.sellerId = b.shopId and b.shopActive=1
            state=conn.prepareStatement(query);
            rs = state.executeQuery();
            
            while (rs.next()) {
                Seller seller = new Seller(
                rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getBoolean(7),
                    rs.getString(8),
                        rs.getBoolean(9));
                sellerlist.add(seller);
            }
            return sellerlist;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    
    public void deleteSeller( int sellerId){
        DBContext db = new DBContext();
        try {   
            conn=db.getConnection();
            state=conn.prepareStatement("delete seller where sellerId = "+sellerId);
            state.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertSeller(int sellerId, String sellerName, String sellerAddress, String sellerEmail,
            String sellerPhone, String sellerDate, String sellerGender, String sellerDOB,int active) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("insert into seller values("
                    + sellerId + ",N'"
                    + sellerName + "',N'"
                    + sellerAddress + "','"
                    + sellerEmail + "','"
                    + sellerPhone + "','"
                    + sellerDate +"',"
                    + convertGender(sellerGender)+",'"
                    + sellerDOB +"', "
                    + active+")");
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertSellerNull(int sellerId, String sellerName, String sellerAddress,
            String sellerEmail, String sellerPhone, String sellerDate,
            String sellerGender, String sellerDOB, int active) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("insert into seller values("
                    + sellerId + ",N'"
                    + sellerName + "',"
                    + sellerAddress + ",'"
                    + sellerEmail + "',"
                    + sellerPhone + ","
                    + sellerDate +","
                    + sellerGender+","
                    + sellerDOB +","
                    + active+ ")");
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateDate(int sellerId , String date){
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update seller set sellerDate='"+date+"' where sellerId=" + sellerId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateSeller(int sellerId, String sellerName,
            String sellerAddress, String sellerEmail, String sellerPhone,
            String sellerGender, String sellerDOB, int active) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update seller set "
                    + "sellerName=N'"   + sellerName + "',"
                    + "sellerAddress=N'"+ sellerAddress + "',"
                    + "sellerEmail='"  + sellerEmail + "',"
                    + "sellerPhone='"  + sellerPhone + "',"
                    + "sellerGender="  + convertGender(sellerGender) +","
                    + "sellerDOB='"    + sellerDOB +"', "
                    + "isActive = "+active+" where sellerId=" + sellerId);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public void updateActive(int id,int active) {
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state = conn.prepareStatement("update seller set isActive = "+active+" where sellerId=" + id);
            state.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public int convertGender(String gender){
        if(gender.equals("nam")){
            return 1;
        }
        return 0;
    }

    public Object getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
