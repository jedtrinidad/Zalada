<%-- 
    Document   : new-product
    Created on : Oct 28, 2018, 10:54:42 PM
    Author     : jed cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>

<a:admin pageTitle="New Product">
     <h1>New Product</h1>
    <form class="form" method="POST" action="/Zalada/AddProduct"
          enctype="multipart/form-data">
        <input type="hidden" name="id">
        <div class="field">
            <label>Name: </label>
            <input class="input" type="text" name="name">
        </div>
        <div class="field">
            <label>Description: </label>
            <textarea class="input" name="desc"></textarea>
        </div>
        <div class="field">
            <label>Quantity: </label>
            <input type="number" class="input" name="qty">
        </div>
        <div class="field">
            <label>Price (₱)</label>
            <input type="number" min="1" step="any" name="price" class="input">
        </div>
        <div class="field">
            <label>Image</label>
            <input type="file" accept="image/jpeg, image/png" name="image" class="input">
        </div>
        <div class="field">
            <input type="submit" value="Add" class="button">
        </div>
    </form>
</a:admin>