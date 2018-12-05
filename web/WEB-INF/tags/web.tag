<%-- 
    Document   : web
    Created on : Oct 27, 2018, 10:05:31 PM
    Author     : jed cyril
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="Web Wrapper Tag" pageEncoding="UTF-8"%>
<%@attribute name="pageTitle" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${pageTitle} - ZALADA</title>
        <link rel="stylesheet" href="css/bulma.css">
    </head>
    <body>
        <nav class="navbar has-shadow">
            <div class="container">
                <div class="navbar-brand">
                    <a class="navbar-item" href="/Zalada">
                        <img src="img/zalada_logo.png">
                    </a>
                </div>
                <div class="navbar-menu">
                    <div class="navbar-start">
                        <a class="navbar-item" href="products.jsp">Products</a>
                        <a class="navbar-item" href="about.jsp">About Us</a>
                        <a class="navbar-item" href="contact.jsp">Contact Us</a>
                    </div>
                    <div class="navbar-end">
                        <c:choose>
                            <c:when test="${sessionScope.user == null}">
                                <div class="navbar-item">
                                    <a href="login.jsp" class="button is-success is-outlined">Login</a>
                                </div>
                                <div class="navbar-item">
                                    <a href="signup.jsp">Sign Up</a>
                                </div> 
                            </c:when>
                            <c:otherwise>
                                <div class="navbar-item">
                                    ${sessionScope.user.fullname}
                                </div>
                                <div class="navbar-item">
                                    <a href="Logout" class="button is-danger">Logout</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </nav>
        <jsp:doBody/>
    </body>
</html>