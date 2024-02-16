<%-- 
    Document   : CarShop
    Created on : Jan 25, 2024, 7:34:55 PM
    Author     : vipha
--%>


<%@page import="model.Cars"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showroom Car</title>
        <link rel="stylesheet" href="./css/styleCarList.css"/>
    </head>
    <body>
        <img src="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/face_react/contact_us/over/contact_us_over_01_m.jpg" width="width" height="height" alt="alt"/>
        <h1>Home Page</h1>
        <div>
            <ul class="header">
                <li>AutomobileWebApp</li>
                <li>Home</li>
                <li>Privacy</li>
            </ul>
        </div>

        <h2 style="margin: 45px 0; font-size: 50px">Car List</h2>
        <span>${sessionScope.account.userName}</span>
        
        <form action="ProcessServlet">
            <table>
                <thead>
                    <tr>
                        <th>CarId</th>
                        <th>CarName</th>
                        <th>Manufacturer</th>
                        <th>Price</th>
                        <th>ReleasedYear</th>
                    </tr>
                </thead>
                <c:forEach var="c" items="${requestScope.carList}">
                    <c:set var="id" value="${c.carID}"/>
                    <tbody>
                        <tr>
                            <td>${id}</td>
                            <td>${c.carName}</td>
                            <td>${c.manufacturer}</td>
                            <td>${c.price}</td>
                            <td>${c.releasedYear}</td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </form>
    </body>
</html>