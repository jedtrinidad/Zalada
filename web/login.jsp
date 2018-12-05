<%-- 
    Document   : login
    Created on : Oct 28, 2018, 10:20:03 AM
    Author     : jed cyril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="w" tagdir="/WEB-INF/tags" %>
<w:web pageTitle="Login">
    <section class="hero is-success is-bold">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">Login</h1>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="columns">
                <div class="column is-half">
                    <form class="form" method="POST" action="/Zalada/Login">
                        <div class="field">
                            <label class="label">Email</label>
                            <input type="email" name="email" class="input" required>
                        </div>
                        <div class="field">
                            <label class="label">Password</label>
                            <input type="password" name="password" class="input" required>
                        </div>
                        <div class="field">
                            <input type="submit" value="Login" class="button is-primary is-fullwidth">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</w:web>