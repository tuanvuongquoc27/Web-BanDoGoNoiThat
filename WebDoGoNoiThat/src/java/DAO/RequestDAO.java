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
import model.Request;

/**
 *
 * @author Admin
 */
public class RequestDAO {
    Connection conn;
    PreparedStatement state;
    ResultSet rs;
    
    public ArrayList<Request> getAllRequest(){
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state =conn.prepareStatement("select * from request");
            rs = state.executeQuery();
            ArrayList<Request> list = new ArrayList<>();
            while(rs.next()){
                list.add(new Request(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3)));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Request> getAllRequestById(int customerId){
        DBContext db = new DBContext();
        try {
            conn = db.getConnection();
            state =conn.prepareStatement("select * from request where customerId="+customerId);
            rs = state.executeQuery();
            ArrayList<Request> list = new ArrayList<>();
            while(rs.next()){
                list.add(new Request(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3)));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void updateRequest(int customerId , String request){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("update request set request="+ request +" where customerId="+customerId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateResponse(int customerId , String response){
        DBContext db = new DBContext();
        try {
            conn=db.getConnection();
            state=conn.prepareStatement("update request set response="+ response +" where customerId="+customerId);
            state.executeUpdate();  
        } catch (Exception ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
