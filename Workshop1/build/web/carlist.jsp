<%@page import="java.util.List"%>
<%@page import="model.Cars"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Car</title>
    </head>
    <body>
        <a href="addcar.jsp">Create new</a>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Manufacturer</th>
                <th>Price</th>
                <th>ReleasedYear</th>
                <th></th>
            </tr>
            <c:forEach var="c" items="${requestScope.carList}">
                <c:set var="id" value="${c.carID}"/>
                <tr>
                    <td>${id}</td>
                    <td>${c.carName}</td>
                    <td>${c.manufacturer}</td>
                    <td>${c.price}</td>
                    <td>${c.releasedYear}</td>
                    <td><a href="update?id=${id}">Edit</a>|<a>Details</a>|<a>Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
