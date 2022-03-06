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
    ResultSet rs ;
    
    public ArrayList<Product> getAllProduct(){
        conn = BaseDAO.open();
        String sql = "select * from product";
        ArrayList<Product> listproduct = new ArrayList<>();
        try {
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while(rs.next()){
                listproduct.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
            return listproduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
