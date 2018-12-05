/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ZALADA.Servlets;

import ZALADA.Objects.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jed cyril
 */
public class PlaceOrder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("uid"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        String pay = request.getParameter("pay");
        
        try {
            Order o = new Order(pid, cid, qty, pay);
            
            request.setAttribute("pid", pid);
            request.setAttribute("qty", qty);
            request.setAttribute("cid", cid);
            request.setAttribute("pay", pay);
            request.getRequestDispatcher("success.jsp").forward(request, response);
            response.sendRedirect("success.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PlaceOrder.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(PlaceOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
