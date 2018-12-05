/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Objects;

import java.sql.Date;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import ZALADA.Data.DatabaseConnection;

/**
 *
 * @author jed cyril
 */
public class Customer {
    private String fname, mname, lname, address, email, password;
    private int Id;
    private Date birthdate;
    
    
    // Getters & Setters
    public void setFname(String v){
        fname = v;
    }
    
    public String getFname(){
        return fname;
    }
    
    public void setMname(String v){
        mname = v;
    }
    
    public String getMname(){
        return mname;
    }
    
    public void setLname(String v){
        lname = v;
    }
    
    public String getLname(){
        return lname;
    }
    
    public String getFullname(){
        return fname+" "+mname.charAt(0)+". "+lname;
    }
    
    public void setAddress(String v){
        address = v;
    }
    
    public String getAddress(){
        return address;
    }
    
    public void setEmail(String v){
        email = v;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setPassword(String v){
        password = v;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setID(int v){
        Id = v;
    }
    
    public int getID(){
        return Id;
    }
    
    public void setBirthdate(Date v){
        birthdate = v;
    }
    
    public Date getBirthdate(){
        return birthdate;
    }
    
    // Database Access Methods
    public List<Customer> getCustomers() throws Exception{
        DatabaseConnection dbc = new DatabaseConnection();
        dbc.setConnection();
        ResultSet rs = dbc.getResults("select * from zalada.customer");
        List<Customer> buffer = new ArrayList<>();
        
        while(rs.next()){
            Customer c = new Customer();
            c.setID(rs.getInt("id"));
            c.setFname(rs.getString("firstname"));
            c.setMname(rs.getString("middlename"));
            c.setLname(rs.getString("lastname"));
            c.setBirthdate(rs.getDate("birthdate"));
            c.setEmail(rs.getString("email"));
            c.setAddress(rs.getString("address"));
            buffer.add(c);
        }
        return buffer;
    }
    
    public Customer getCustomer(int id) throws Exception{
        DatabaseConnection dbc =  new DatabaseConnection();
        dbc.setConnection();
        ResultSet rs = dbc.getResults("select * from zalada.customer where id="+id);
        Customer c = new Customer();
        
        while(rs.next()){
            c.setID(rs.getInt("id"));
            c.setFname(rs.getString("firstname"));
            c.setMname(rs.getString("middlename"));
            c.setLname(rs.getString("lastname"));
            c.setBirthdate(rs.getDate("birthdate"));
            c.setEmail(rs.getString("email"));
            c.setAddress(rs.getString("address"));
            c.setPassword(rs.getString("password"));
        }
        
        return c;      
    }
    
    public Customer getCustomerByEmail(String email) throws Exception{
        DatabaseConnection dbc =  new DatabaseConnection();
        dbc.setConnection();
        ResultSet rs = dbc.getResults("select * from zalada.customer where email='"+email+"'");
        Customer c = new Customer();
        
        if(rs.next()){
            c.setID(rs.getInt("id"));
            c.setFname(rs.getString("firstname"));
            c.setMname(rs.getString("middlename"));
            c.setLname(rs.getString("lastname"));
            c.setBirthdate(rs.getDate("birthdate"));
            c.setEmail(rs.getString("email"));
            c.setAddress(rs.getString("address"));
            c.setPassword(rs.getString("password"));
            return c;
        }
        else{
            return null;
        }       
    }
}
