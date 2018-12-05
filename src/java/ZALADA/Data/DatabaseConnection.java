/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author jed cyril
 */
public class DatabaseConnection {
    public Connection conn;
    public Statement stmt;
    
    public void setConnection() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/zalada", "root", "root");
    }
    
    // INSERT, UDPATE, DELETE
    public void runQuery(String query) throws Exception{
        stmt = conn.createStatement();
        stmt.executeUpdate(query);
    }
    
    public ResultSet getResults(String query) throws Exception{
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        return rs;
    }
}
