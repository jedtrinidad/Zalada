<%-- 
    Document   : admin
    Created on : Oct 27, 2018, 11:20:29 PM
    Author     : jed cyril
--%>

<%@tag description="Admin" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle"%>
<!DOCTYPE html>
<html>
    <head>
        <title>${pageTitle} - ZALADA::Admin</title>
        <link rel="stylesheet" href="../css/style.css">
    <body>
        <div class="sidebar">
    <h1>ZALADA<BR>dashboard</h1>
    <a href="index.jsp">Home</a>
    <h4>Pages</h4>
    <a href="about.jsp">About Us</a>
    <h4>Monitoring</h4>
    <a href="product-index.jsp">Products</a>
    <a href="customer-index.jsp">Customers</a>
</div>

        <div class="container has-sidebar">
            <jsp:doBody/>
        </div>
    </body>
</html>