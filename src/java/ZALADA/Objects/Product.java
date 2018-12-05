/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Objects;

import ZALADA.Data.DatabaseConnection;
import java.io.Serializable;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jed cyril
 */
public class Product implements Serializable{
    private int Id;
    private String name, description, imageFile;
    private Double price;
    private int quantity;
    private Date created_at;
    
    // Getters & Setters
    
    public void setId(int v){
        Id = v;
    }
    
    public int getId(){
        return Id;
    }
    
    public void setName(String v){
        name = v;
    }
    
    public String getName(){
        return name;
    }
    
    public void setDescription(String v){
        description = v;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setImage(String v){
        imageFile = v;
    }
    
    public String getImage(){
        return imageFile;
    }
    
    public void setPrice(Double v){
        price = v;
    }
    
    public Double getPrice(){
        return price;
    }
    
    public void setQuantity(int v){
        quantity = v;
    }
    
    public int getQuantity(){
        return quantity;
    }
    
    public Date getCreatedAt(){
        return created_at;
    }
    
    public List<Product> getProducts() throws Exception{
        DatabaseConnection dbc = new DatabaseConnection();
        dbc.setConnection();
        ResultSet rs = dbc.getResults("select * from zalada.products");
        List<Product> buffer = new ArrayList<>();
        
        while(rs.next()){
            Product p = new Product();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setDescription(rs.getString("description"));
            p.setImage(rs.getString("image"));
            p.setPrice(rs.getDouble("price"));
            p.setQuantity(rs.getInt("quantity"));
            buffer.add(p);
        }
        return buffer;
    }
    
    public Product getProduct(int id) throws Exception{
        DatabaseConnection dbc = new DatabaseConnection();
        dbc.setConnection();
        ResultSet rs = dbc.getResults("select * from zalada.products where id="+id);
        
        Product p = new Product();
        
        if (rs.next()){
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setDescription(rs.getString("description"));
            p.setImage(rs.getString("image"));
            p.setPrice(rs.getDouble("price"));
            p.setQuantity(rs.getInt("quantity"));
            return p;
        }
        else{
            return null;
        }
    }
}
