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
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    Connection conn;
    PreparedStatement state;
    ResultSet rs;

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> listacc = new ArrayList<>();
        conn = BaseDAO.open();
        String sql = "select * from account";
        try {
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                Account acc = new Account(
                rs.getString(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4));
                listacc.add(acc);
            }
            return listacc;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Account getAccount(String username, String password, String email){
        try {
            String sql = "select * from account where username = '"+username+"'"
                    + " and password='"+password+"' and email='"+email+"'";
            conn = BaseDAO.open();
            state=conn.prepareStatement(sql);
            rs = state.executeQuery();
            while(rs.next()){
                return new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void signupAccount ( String username, String password, String email) {
        String sql = "insert into account values('"+username+"','"+password+"','buyer','"+email+"')";
        
        try {
            conn = BaseDAO.open();
            state=conn.prepareStatement(sql);
            rs=state.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
