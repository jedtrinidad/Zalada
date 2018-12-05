<%-- 
    Document   : product
    Created on : Oct 28, 2018, 8:56:44 PM
    Author     : jed cyril
--%>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ZALADA.Objects.Product" %>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Product product = new Product().getProduct(id);
    pageContext.setAttribute("product", product);
%>
<a:web pageTitle="${product.name}">
    <div class="section">
        <div class="container">
            <div class="tile is-ancestor">
                <div class="tile is-parent">
                    <div class="title is-child notification">
                        <img src="uploads/${product.image}">
                    </div>
                </div>
                <div class="tile is-parent is-vertical is-8">
                    <div class="tile is-child box">
                        <p class="title">${product.name}</p>
                        <p class="subtitle is-3"><fmt:formatNumber type="currency" currencySymbol="₱" value="${product.price}"/></p>
                        <form method="POST" action="checkout.jsp">
                            <input type="hidden" name="id" value="${product.id}">
                            <div class="field has-addons">
                                <p class="control">
                                    <button class="button is-static">
                                        Quantity: 
                                    </button>
                                </p>
                                <p class="control">
                                    <input type="number" class="input" name="qty" value=1 min=1 max=${product.quantity}>
                                </p>
                            </div>
                            <div class="field">
                                <p class="is-italic">${product.quantity} in stock</p>
                            </div>
                            <div class="field is-grouped">
                                <p class="control">
                                    <input type="submit" class="button is-success"
                                           value="Buy">
                                </p>
                            </div>
                        </form>
                    </div>
                    <div class="tile is-child box">
                        <p class="title">Description</p>
                        <p>${product.description}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</a:web>
