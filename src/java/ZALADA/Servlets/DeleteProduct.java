/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Servlets;

import ZALADA.Data.DatabaseConnection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jed cyril
 */
public class DeleteProduct extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        DatabaseConnection dbc = new DatabaseConnection();
        
        try {
            dbc.setConnection();
            dbc.runQuery("delete from zalada.products where id="+id);
            
            response.sendRedirect("admin/product-index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
