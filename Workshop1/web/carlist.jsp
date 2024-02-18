<%-- 
    Document   : CarShop
    Created on : Jan 25, 2024, 7:34:55 PM
    Author     : vipha
--%>


<%@page import="dal.CarDAO"%>
<%@page import="model.User"%>
<%@page import="model.Cars"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/styleCarList.css"/>
    </head>
    <body>

        <%
            User user = (User) session.getAttribute("account");
            if (user == null || user.isIsAdmin() == false) {
                response.sendRedirect("carlist");
            }
        %>

        <img src="./image/showroom.jpg" width="width" height="height" alt="alt"/>
        <h1>Home Page</h1>
        <div>
            <ul class="header">
                <li>AutomobileWebApp</li>
                <li>Home</li>
                <li>Privacy</li>
            </ul>
        </div>

        <h2>Car List</h2>
        <h2 style="color: red">Welcome to ${sessionScope.account.lastname}</h2>

        <form action="process">
            <a href="process?action=add" >Create New</a>
            <a href="process?action=logout">Logout</a>
            <a href="carlist?user=${sessionScope.user.lastname}&action=viewUser">Check View User</a>
            <table>
                <thead>
                    <tr>
                        <th>CarId</th>
                        <th>CarName</th>
                        <th>Manufacturer</th>
                        <th>Price</th>
                        <th>ReleasedYear</th>
                        <th >
                            <div class="header-app">
                                Application
                            </div>
                        </th>
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
                            <td class="app">
                                <div class="Edit">
                                    <a href="update?id=${id}">Edit</a>
                                </div>

                                <div class="Details">
                                    <a href="details?id=${id}">Details</a>
                                </div>

                                <div class="Delete">
                                    <a href="delete?id=${id}">Delete</a>
                                </div>
                            </td>   
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </form>
    </body>
</html>