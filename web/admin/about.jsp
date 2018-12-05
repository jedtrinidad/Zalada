<%-- 
    Document   : about
    Created on : Oct 31, 2018, 1:01:39 PM
    Author     : jed cyril
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ZALADA.Data.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>
<%
    DatabaseConnection dbc = new DatabaseConnection();
    dbc.setConnection();
    ResultSet rs = dbc.getResults("select content, created_at from zalada.aboutus order by created_at desc");
    String c = "";
    Date d;
    rs.first();
    c = rs.getString("content");
    d = rs.getDate("created_at");

    pageContext.setAttribute("content", c);
    pageContext.setAttribute("created_at", d);
%>
<a:admin pageTitle="About">
    <h1>About</h1>
    <h4>Last Updated: ${created_at}</h4>
    <textarea class="input">${content}</textarea>
    <button class="button">Update</button>
</a:admin>
