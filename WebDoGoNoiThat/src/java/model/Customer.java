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
public class Customer {
    private int Id ;
    private String Name ;
    private String Address ;
    private String AddressShip ;
    private String Email ;
    private String Phone ;
    private String Date;
    private boolean Gender;
    private String DOB;

    public Customer () {
    }

    public Customer(int Id, String Name, String Address, String AddressShip, String Email, String Phone, String Date, boolean Gender, String DOB) {
        this.Id = Id;
        this.Name = Name;
        this.Address = Address;
        this.AddressShip = AddressShip;
        this.Email = Email;
        this.Phone = Phone;
        this.Date = Date;
        this.Gender = Gender;
        this.DOB = DOB;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setAddressShip(String AddressShip) {
        this.AddressShip = AddressShip;
    }

    public String getAddressShip() {
        return AddressShip;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public boolean isGender() {
        return Gender;
    }

    public void setGender(boolean Gender) {
        this.Gender = Gender;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }
    
    
    
    
    
}
