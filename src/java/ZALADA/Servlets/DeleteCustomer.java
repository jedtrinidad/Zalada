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
public class DeleteCustomer extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        DatabaseConnection dbc = new DatabaseConnection();
        
        try {
            dbc.setConnection();
            dbc.runQuery("delete from zalada.customer where id="+id);
            
            response.sendRedirect("admin/customer-index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCustomer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteCustomer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DeleteCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
