/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Objects;

import ZALADA.Data.DatabaseConnection;
import java.sql.SQLException;

/**
 *
 * @author jed cyril
 */
public class Order {
    private int Id;
    private int ProductId;
    private int CustomerId;
    private int Quantity;
    private String PaymentMethod;
    
    public Order(){
        
    }
    
    public Order(int pid, int cid,int qty, String pay) throws SQLException, ClassNotFoundException, Exception{
        DatabaseConnection dbc = new DatabaseConnection();
        dbc.setConnection();
        String q = "insert into zalada.orders (product_id, customer_id, quantity, payment_method) ";
        q += "values ("+pid+", "+cid+", "+qty+", '"+pay+"')";
        dbc.runQuery(q);
    }
    
    public void setId(int v){
        Id = v;
    }
    
    public int getId(){
        return Id;
    }
    
    public void setProductId(int v){
        ProductId = v;
    }
    
    public int getProductId(){
        return ProductId;
    }
    
    public void setCustomerId(int v){
        CustomerId = v;
    }
    
    public int getCustomerId(){
        return CustomerId;
    }
    
    public void setQuantity(int v){
        Quantity = v;
    }
    
    public int getQuantity(){
        return Quantity;
    }
    
    public void setPaymentMethod(String v){
        PaymentMethod = v;
    }
    
    public String getPaymentMethod(){
        return PaymentMethod;
    }
}
