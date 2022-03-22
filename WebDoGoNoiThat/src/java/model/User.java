/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class User {
    private int userId;
    private String userName;
    private String password;
    private boolean Admin;
    private boolean Customer;
    private boolean Seller;
    private String userImg;
    private int userBanlance;
    private boolean Active;

    public User() {
    }

    public User(int userId, String userName, String password, boolean Admin, boolean Customer, boolean Seller, String userImg, int userBanlance) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.Admin = Admin;
        this.Customer = Customer;
        this.Seller = Seller;
        this.userImg = userImg;
        this.userBanlance = userBanlance;
    }

    public User(int userId, String userName, String password, boolean Admin, boolean Customer, boolean Seller, String userImg, int userBanlance, boolean Active) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.Admin = Admin;
        this.Customer = Customer;
        this.Seller = Seller;
        this.userImg = userImg;
        this.userBanlance = userBanlance;
        this.Active = Active;
    }
    

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return Admin;
    }

    public void setAdmin(boolean Admin) {
        this.Admin = Admin;
    }

    public boolean isCustomer() {
        return Customer;
    }

    public void setCustomer(boolean Customer) {
        this.Customer = Customer;
    }

    public boolean isSeller() {
        return Seller;
    }

    public void setSeller(boolean Seller) {
        this.Seller = Seller;
    }

    

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getUserImg() {
        return userImg;
    }

    public int getUserBanlance() {
        return userBanlance;
    }

    public void setUserBanlance(int userBanlance) {
        this.userBanlance = userBanlance;
    }

    public boolean isActive() {
        return Active;
    }

    public void setActive(boolean Active) {
        this.Active = Active;
    }
    

    

    

    

    
}
