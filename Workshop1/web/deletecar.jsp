<%-- 
    Document   : Details
    Created on : Jan 28, 2024, 11:57:17 PM
    Author     : vipha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
        <link rel="stylesheet" href="./css/styleDeleteCar.css"/>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete?")) {
                    var form = document.createElement("form");
                    form.setAttribute("method", "post");
                    form.setAttribute("action", "delete");

                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "txtCarID");
                    hiddenField.setAttribute("value", id);

                    form.appendChild(hiddenField);
                    document.body.appendChild(form);

                    form.submit();
                }
            }
        </script>
    </head>

    <body>
        <img src="https://png.pngtree.com/thumb_back/fw800/background/20230425/pngtree-parking-lot-with-cars-in-it-image_2515654.jpg" alt="alt"/>
        <h1>Delete Car</h1>
        <h3>Car</h3>
        <c:set var="c" value="${requestScope.dataCar}"/>
        <form action="process" method="post"> 
            <table>
                <tr>
                    <th>CarID</th>
                    <th><input type="hidden" name="txtCarID" value="${c.carID}">${c.carID}</th>
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
                <input onclick="doDelete('${c.carID}')" type="button" name="btnAction" value="Delete">
                <a  href="carlist">Back to List</a>
            </div>   
        </form>
    </body>


</html>