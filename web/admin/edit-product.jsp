<%-- 
    Document   : edit-product
    Created on : Oct 28, 2018, 7:50:38 PM
    Author     : jed cyril
--%>

<%@page import="ZALADA.Objects.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Product currentProduct = new Product().getProduct(id);
    pageContext.setAttribute("currentProduct", currentProduct);
%>
<a:admin pageTitle="Edit ${currentProduct.name}">
    <img src="../uploads/${currentProduct.image}">
    <h1>${currentProduct.name}</h1>
    <form class="form" method="POST" action="/Zalada/EditProduct">
        <input type="hidden" name="id" value="${currentProduct.id}">
        <div class="field">
            <label>Name: </label>
            <input class="input" type="text" name="name" value="${currentProduct.name}">
        </div>
        <div class="field">
            <label>Description: </label>
            <textarea class="input" name="desc">${currentProduct.description}</textarea>
        </div>
        <div class="field">
            <label>Quantity: </label>
            <input type="number" class="input" name="qty" value=${currentProduct.quantity}>
        </div>
        <div class="field">
            <label>Price (₱)</label>
            <input type="number" min="1" step="any" name="price" class="input" value=${currentProduct.price}>
        </div>
        <div class="field">
            <input type="submit" value="Add" class="button">
        </div>
    </form>
</a:admin>
