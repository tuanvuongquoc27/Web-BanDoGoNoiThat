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
    private String role;
    private int userBanlance;

    public User() {
    }

    public User(int userId, String userName, String password, String role, int userBanlance) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.role = role;
        this.userBanlance = userBanlance;
    }

    

    

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getUserBanlance() {
        return userBanlance;
    }

    public void setUserBanlance(int userBanlance) {
        this.userBanlance = userBanlance;
    }
}
