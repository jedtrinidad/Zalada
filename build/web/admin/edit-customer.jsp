<%-- 
    Document   : edit
    Created on : Oct 28, 2018, 1:31:13 AM
    Author     : jed cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ZALADA.Objects.Customer" %>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>

<%
    String id = request.getParameter("id");
    Customer c = new Customer();
    Customer current = c.getCustomer(Integer.parseInt(id));
    
    pageContext.setAttribute("currentCustomer", current);
%>

<a:admin pageTitle="Edit ${currentCustomer.fullname}">
    <h1>${currentCustomer.fullname}</h1>
    <form class="form" method="POST" action="/Zalada/EditCustomer">
        <input type="hidden" name="id" value="${currentCustomer.ID}">
        <div class="field">
            <label>Firstname</label>
            <input type="text" class="input" name="firstname" value="${currentCustomer.fname}">
        </div>
        <div class="field">
            <label>Middlename</label>
            <input type="text" class="input" name="middlename" value="${currentCustomer.mname}">
        </div>
        <div class="field">
            <label>Lastname</label>
            <input type="text" class="input" name="lastname" value="${currentCustomer.lname}">
        </div>
        <div class="field">
            <label>Email</label>
            <input type="text" class="input" name="email" value="${currentCustomer.email}">
        </div>
        <div class="field">
            <label>Password</label>
            <input type="password" class="input" name="password" value="${currentCustomer.password}">
        </div>
        <div class="field">
            <label>Address</label>
            <input type="text" class="input" name="address" value="${currentCustomer.address}">
        </div>
        <div class="field">
            <label>Birthdate</label>
            <input type="date" class="input" name="birthdate" value=${currentCustomer.birthdate}>
        </div>
        <div class="field">
            <input type="submit" value="Edit" class="button is-info">
        </div>
    </form>
</a:admin>
