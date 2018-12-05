<%-- 
    Document   : index
    Created on : Oct 27, 2018, 11:29:31 PM
    Author     : jed cyril
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ZALADA.Objects.Customer" %>
<%@taglib prefix="a" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Customer c = new Customer();
    List<Customer> customers = c.getCustomers();
    pageContext.setAttribute("customers", customers);
    pageContext.setAttribute("count", customers.size());
%>


<a:admin pageTitle="Customers">
    <h1>${count} Customers</h1>
    <a href="new-customer.jsp" class="button">Add Customer</a>
    <table>
        <thead>
        <th>ID</th>
        <th>Email</th>
        <th>Fullname</th>
        <th>Address</th>
        <th>Birthdate</th>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td><c:out value="${customer.ID}"/></td>
                    <td>
                        <a href="edit-customer.jsp?id=${customer.ID}">
                            <c:out value="${customer.email}"/>
                        </a>
                    </td>
                    <td><c:out value="${customer.fullname}"/></td>
                    <td><c:out value="${customer.address}"/></td>
                    <td><c:out value="${customer.birthdate}"/></td>
                    <td>
                        <a href="/Zalada/DeleteCustomer?id=${customer.ID}" class="button is-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</a:admin>
