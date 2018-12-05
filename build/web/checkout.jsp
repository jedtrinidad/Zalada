<%-- 
    Document   : checkout
    Created on : Nov 1, 2018, 2:00:29 PM
    Author     : jed cyril
--%>

<%@page import="ZALADA.Objects.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="w" tagdir="/WEB-INF/tags" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int qty = Integer.parseInt(request.getParameter("qty"));
    Product product = new Product().getProduct(id);
    pageContext.setAttribute("product", product);
    pageContext.setAttribute("quantity", qty);
%>
<c:if test="${sessionScope.user == null}">
    <c:redirect url="login.jsp"/>
</c:if>
<w:web pageTitle="Checkout">
    <section class="section">
        <div class="container">
            <div class="columns">
                <div class="column">
                    <h1 class="title">1. Billing Address</h1>
                    <p class="subtitle">
                        Please check your details before proceeding.
                    </p>
                    <div class="field">
                        <label class="label">Fullname</label>
                        <p class="control">
                            <input type="text" class="input is-readonly" value="${sessionScope.user.fullname}"
                                   readonly>
                        </p>
                    </div>
                    <div class="field">
                        <label class="label">Address</label>
                        <p class="control">
                            <input type="text" class="input is-readonly" value="${sessionScope.user.address}"
                                   readonly>
                        </p>
                    </div>
                </div>
                <div class="column">
                    <h1 class="title">2. Payment Methods</h1>
                    <p class="subtitle">
                        Please select a payment method before proceeding.
                    </p>
                    <div class="field">
                        <label class="label">Payment Method</label>
                        <p class="select is-fullwidth">
                            <select class="input" id="payment">
                                <option>Credit Card</option>
                                <option>Cash on Delivery</option>
                            </select>
                        </p>
                    </div>
                </div>
                <div class="column">
                    <h1 class="title">3. Review Order</h1>
                    <p class="subtitle">
                        Please review you order before proceeding. You can also change the quantity.
                    </p>
                    <div class="box">
                        <form method="POST" action="/Zalada/PlaceOrder" name="order" id="orderForm">
                            <input type="hidden" id="uid" value="${sessionScope.user.ID}" name="uid">
                            <input type="hidden" id="pid" value="${product.id}" name="pid">
                            <input type="hidden" id="price" value="${product.price}" name="price">
                            <input type="hidden" id="pay" name="pay">
                            <div class="tile is-ancestor">
                                <div class="tile is-parent is-4">
                                    <div class="tile is-child">
                                        <img src="uploads/${product.image}" alt="${product.name}">
                                    </div>
                                </div>
                                <div class="tile is-parent">
                                    <div class="tile is-child">
                                        <p class="title is-size-6">${product.name}</p>
                                        <p class="subtitle is-size-6">
                                            <fmt:formatNumber type="currency" currencySymbol="₱" value="${product.price}"/> per unit
                                        </p>
                                        <div class="field has-addons">
                                            <p class="control">
                                                <button class="button is-static">
                                                    Quantity: 
                                                </button>
                                            </p>
                                            <p class="control">
                                                <input type="number" class="input" name="qty" id="qty" value=${quantity} min=1 max=${product.quantity}>
                                            </p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="box">
                        <p class="is-size-3" id="totalOutput"></p>
                        <p class="is-size-6" id="paymentOutput"></p>
                    </div>
                    <div class="field">
                        <p class="control">
                            <button class="button is-fullwidth is-success" onclick="placeOrder()">Place Order</button>
                        </p>
                    </div>                      
                </div>
            </div>
        </div>
    </section>
    <script src="js/accounting.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            var payment = document.querySelector("select#payment").value;
            var price = document.querySelector("input#price").getAttribute("value");
            var quantity = document.querySelector("input#qty").getAttribute("value");
            document.querySelector("input#qty").oninput = qtyChange;
            document.querySelector("select#payment").oninput = paymentChange;
            var total = price * quantity;
            document.querySelector("p#totalOutput").innerText = "Total: " + accounting.formatMoney(total, "₱");
            document.querySelector("p#paymentOutput").innerText = "Pay by " + payment;
            
            document.querySelector("input#pay").value = document.querySelector("select#payment").value;
        });
        function qtyChange(event) {
            var price = document.querySelector("input#price").getAttribute("value");
            document.querySelector("p#totalOutput").innerText = "Total: " + accounting.formatMoney(price * event.target.value, "₱");
        }
        function paymentChange(event) {
            document.querySelector("p#paymentOutput").innerText = "Pay by " + event.target.value;
            document.querySelector("input#pay").value = document.querySelector("select#payment").value;
        }
        function placeOrder(){
            var form = document.querySelector("form#orderForm");
            form.method = "POST";
            form.submit();
        }
    </script>
</w:web>