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
public class EditCustomer extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String firstname = request.getParameter("firstname");
            String middlename = request.getParameter("middlename");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String birthdate = request.getParameter("birthdate");
            String address = request.getParameter("address");
            
            DatabaseConnection dbc = new DatabaseConnection();
            dbc.setConnection();
            
            String queryString = "update zalada.customer ";
            queryString += "set firstname='"+firstname+"', middlename='"+middlename+"', lastname='"+lastname+"', ";
            queryString += "email='"+email+"', password='"+password+"', birthdate='"+birthdate+"', address='"+address+"'";
            
            dbc.runQuery(queryString);
            
            response.sendRedirect("admin/customer-index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(EditCustomer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditCustomer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EditCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
