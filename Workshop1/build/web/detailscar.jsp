<%-- 
    Document   : Details
    Created on : Jan 28, 2024, 11:57:17 PM
    Author     : vipha
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Page</title>
        <link rel="stylesheet" href="./css/styleDetailsCar.css"/>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if (user == null || user.isIsAdmin() == false) {
            response.sendRedirect("carlist");
        }
    %>

    <body>
        <img src="./image/detailImg.jpg" alt="alt"/>
        <h1>Car Details</h1>
        <h3>Car</h3>
        <c:set var="c" value="${requestScope.dataCar}"/>
        <form action="process" method="post"> 
            <table>
                <tr>
                    <th>CarID</th>
                    <th>${c.carID}</th>
                </tr>
                <tr>
                    <td>CarName</td>
                    <td>${c.carName}</td>
                </tr>
                <tr>
                    <td>Manufacturer</td>
                    <td>${c.manufacturer}</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>${c.price}</td>
                </tr>
                <tr>
                    <td>ReleasedYear</td>
                    <td>${c.releasedYear}</td>
                </tr>
            </table>
            <div>
                <a href="update?id=${c.carID}">Edit</a>
                <a href="carlist">Back to List</a>
            </div>   
        </form>
    </body>


</html>