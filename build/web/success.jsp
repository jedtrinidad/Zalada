<%-- 
    Document   : success
    Created on : Nov 4, 2018, 1:44:56 PM
    Author     : jed cyril
--%>

<%@page import="ZALADA.Objects.Product"%>
<%@page import="ZALADA.Objects.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="w"  tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
    int cid = Integer.parseInt(request.getAttribute("cid").toString());
    int pid = Integer.parseInt(request.getAttribute("pid").toString());
    Customer customer = new Customer().getCustomer(cid);
    Product product = new Product().getProduct(pid);
    pageContext.setAttribute("customer", customer);
    pageContext.setAttribute("product", product);
%>
<c:if test="${sessionScope.user == null}">
    <c:redirect url="login.jsp"/>
</c:if>
<w:web pageTitle="Purchase Complete">
    <section class="hero is-success is-bold">
        <div class="container">
            <div class="hero-body">
                <h1 class="title has-text-centered">Thank You for your Purchase! ${customer.fullname}</h1>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="columns is-centered">
                <div class="column is-four-fifths box has-text-centered">
                    <div class="tile is-ancestor">
                        <div class="tile is-parent is-4">
                            <div class="tile is-child">
                                <img src="uploads/${product.image}" alt="${product.name}">
                            </div>
                        </div>
                        <div class="tile is-parent">
                            <div class="tile is-child">
                                <p class="title is-size-4">${qty} X ${product.name}</p>
                            </div>
                            <div class="tile is-child">
                                <p class="title is-size-4">
                                    Total: 
                                    <fmt:formatNumber type="currency" currencySymbol="₱" value="${product.price * qty}" />
                                </p>
                                <p class="subtitle is-size-6 is-italic">
                                    Pay by ${pay}
                                </p>
                                <p class="subtitle is-size-6">
                                    Deliver to: ${customer.address}
                                </p>
                            </div>
                        </div>
                    </div>
                    <a href="products.jsp">Continue Shopping</a>
                </div>
            </div>
        </div>
    </section>
</w:web>
