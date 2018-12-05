<%-- 
    Document   : products
    Created on : Oct 28, 2018, 8:18:20 PM
    Author     : jed cyril
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ZALADA.Objects.Product" %>
<%@taglib prefix="w" tagdir="/WEB-INF/tags" %>
<%
    List<Product> products = new Product().getProducts();
    pageContext.setAttribute("products", products);
%>
<w:web pageTitle="Products">
    <section class="hero is-success is-bold">
        <div class="container">
            <div class="hero-body">
                <h1 class="title">Products</h1>
                
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="columns is-multiline">
                <c:forEach items="${products}" var="product">
                    <div class="column is-one-quarter">
                    <div class="card">
                        <div class="card-image">
                            <img src="uploads/${product.image}">
                        </div>
                        <div class="card-content">
                            <p class="title is-5"><fmt:formatNumber type="currency" currencySymbol="₱" value="${product.price}" /></p>
                            <p class="subtitle is-6">
                                <a href="product.jsp?id=${product.id}">${product.name}</a>
                            </p>
                        </div>
                            <div class="card-footer">
                                <div class="card-footer-item">
                                    <a href="checkout.jsp?id=${product.id}&qty=1">BUY</a>
                                </div>
                            </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</w:web>
