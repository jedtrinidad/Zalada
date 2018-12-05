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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author jed cyril
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 5, 
  maxRequestSize = 1024 * 1024 * 5 * 5, location="C:\\Users\\jed cyril\\Documents\\NetBeansProjects\\Zalada\\build\\web\\uploads")
public class AddProduct extends HttpServlet {

    private static final String UPLOAD_DIR = "img";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String dsc = request.getParameter("desc");
        Double price = Double.parseDouble(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        String filename = request.getPart("image").getSubmittedFileName();
        DatabaseConnection dbc = new DatabaseConnection();
        
        for(Part part : request.getParts()){
                part.write(filename);
        }

        try {
            dbc.setConnection();
            String q = "insert into zalada.products (name,description,image,quantity,price) ";
            q += "values ('" + name + "', '" + dsc + "', '" + filename + "', " + qty + ", " + price + ")";
            dbc.runQuery(q);
            response.sendRedirect("admin/product-index.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
