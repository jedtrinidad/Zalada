<%-- 
    Document   : about
    Created on : Oct 27, 2018, 11:08:34 PM
    Author     : jed cyril
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ZALADA.Data.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="w" tagdir="/WEB-INF/tags" %>
<%
    DatabaseConnection dbc = new DatabaseConnection();
    dbc.setConnection();
    ResultSet rs = dbc.getResults("select content from zalada.aboutus order by created_at desc");
    String c = "";
    rs.first();
    c = rs.getString("content");
    
    pageContext.setAttribute("content", c);
%>
<w:web pageTitle="About Us">
    <section class="hero is-large is-success is-bold">
        <div class="container">
            <div class="hero-body">
                <h1 class="title has-text-centered">About Us</h1>
                <div class="columns is-centered">
                    <div class="column is-half box">
                        ${content}
                    </div>
                </div>
            </div>
        </div>
    </section>
</w:web>
