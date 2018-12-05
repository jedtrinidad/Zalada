<%-- 
    Document   : new
    Created on : Oct 28, 2018, 1:41:19 AM
    Author     : jed cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>

<a:admin pageTitle="New Customer">
    <h1>New Customer</h1>
    <form class="form" method="POST" action="/Zalada/AddCustomer">
        <input type="hidden" name="_source" value="Create">
        <div class="field">
            <label>Firstname</label>
            <input type="text" class="input" name="firstname">
        </div>
        <div class="field">
            <label>Middlename</label>
            <input type="text" class="input" name="middlename">
        </div>
        <div class="field">
            <label>Lastname</label>
            <input type="text" class="input" name="lastname">
        </div>
        <div class="field">
            <label>Email</label>
            <input type="text" class="input" name="email">
        </div>
        <div class="field">
            <label>Password</label>
            <input type="password" class="input" name="password">
        </div>
        <div class="field">
            <label>Address</label>
            <input type="text" class="input" name="address">
        </div>
        <div class="field">
            <label>Birthdate</label>
            <input type="date" class="input" name="birthdate">
        </div>
        <div class="field">
            <input type="submit" value="Add" class="button is-info">
        </div>
    </form>
</a:admin>
