/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Servlets;

import ZALADA.Objects.Customer;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jed cyril
 */
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       HttpSession session = request.getSession();
       
        try {
            Customer c = new Customer().getCustomerByEmail(email);
            if (c != null ){
                String dbPassword = c.getPassword();
                if(!password.equalsIgnoreCase(dbPassword)){
                    response.sendError(403, password);
                }
                else{
                    session.setAttribute("user", c);
                    response.sendRedirect("index.jsp");
                }
            }
            else{
                response.sendError(404);
            }
        } catch (Exception ex) {
            response.sendError(500);
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
