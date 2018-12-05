<%-- 
    Document   : product-index
    Created on : Oct 28, 2018, 6:16:22 PM
    Author     : jed cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ZALADA.Objects.Product"%>
<%@page import="java.util.List" %>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Product> products = new Product().getProducts();
    
    pageContext.setAttribute("products", products);
    pageContext.setAttribute("count", products.size());
%>
<a:admin pageTitle="Products">
    <h1>${count} Products</h1>
    <a href="new-product.jsp" class="button">Add Product</a>
    <table>
        <thead>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Quantity</th>
        <th>Price</th>
        </thead>
        <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td><a href="edit-product.jsp?id=${product.id}">${product.name}</a></td>
                    <td>${product.description}</td>
                    <td>${product.quantity}</td>
                    <td>₱ ${product.price}</td>
                    <td>
                        <a href="/Zalada/DeleteProduct?id=${product.id}" class="button is-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</a:admin>
