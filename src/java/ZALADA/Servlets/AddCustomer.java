/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Servlets;

import ZALADA.Data.DatabaseConnection;
import java.io.IOException;
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
public class AddCustomer extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String firstname = request.getParameter("firstname");
            String middlename = request.getParameter("middlename");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String birthdate = request.getParameter("birthdate");
            String address = request.getParameter("address");
            String source = request.getParameter("_source");
            
            DatabaseConnection dbc = new DatabaseConnection();
            
            dbc.setConnection();
            
            
            String queryString = "insert into zalada.customer (firstname,middlename,lastname,email,password,birthdate,address)";
            queryString += "values ('"+firstname+"' , '"+middlename+"' , '"+lastname+"' , '"+email+"' , '"+password+"' , '"+birthdate+"' , '"+address+"')";
            
            dbc.runQuery(queryString);
            
            if(source.equalsIgnoreCase("register")){
                response.sendRedirect("index.jsp");
            }
            else{
                response.sendRedirect("admin/customer-index.jsp");
            }
        } catch (Exception ex) {
            
            Logger.getLogger(AddCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
