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
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO {
    
    Connection conn;
    PreparedStatement state;
    ResultSet rs;
    
    public ArrayList<Category> getAllCategory(){
        DBContext db = new DBContext();
        ArrayList<Category> list = new ArrayList<>();
        try {
            conn=db.getConnection();
            state = conn.prepareStatement("select * from category");
            rs=state.executeQuery();
            while(rs.next()){
                list.add(new Category(rs.getInt(1),rs.getString(2)));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
