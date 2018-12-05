<%-- 
    Document   : signup
    Created on : Oct 28, 2018, 10:21:22 AM
    Author     : jed cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="w" tagdir="/WEB-INF/tags" %>

<w:web pageTitle="Sign Up">
    <section class="hero is-success is-bold">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">Sign Up</h1>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="columns">
                <div class="column is-half">
                    <form class="form" method="POST" action="/Zalada/AddCustomer">
                        <input type="hidden" name="_source" value="Register">
                <div class="field">
                    <label class="label">Firstname</label>
                    <input type="text" name="firstname" class="input">
                </div>
                <div class="field">
                    <label class="label">Middlename</label>
                    <input type="text" name="middlename" class="input">
                </div>
                <div class="field">
                    <label class="label">Lastname</label>
                    <input type="text" name="lastname" class="input">
                </div>
                <div class="field">
                    <label class="label">Email</label>
                    <input type="text" name="email" class="input">
                </div>
                <div class="field">
                    <label class="label">Password</label>
                    <input type="password" name="password" class="input">
                </div>
                <div class="field">
                    <label class="label">Address</label>
                    <input type="text" name="address" class="input">
                </div>
                <div class="field">
                    <label class="label">Birthdate</label>
                    <input type="date" name="birthdate" class="input">
                </div>
                <div class="field">
                    <input type="submit" value="Register" class="button is-primary is-fullwidth">
                </div>
            </form>
                </div>
            </div>
        </div>
    </section>
</w:web>