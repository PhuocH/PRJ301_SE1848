<%@page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.Cars"%>
<%@page import="dal.CarDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Car</title>
        <link rel="stylesheet" href="./css/styleAddCar.css"/>
        <script>
            function validateForm() {
                var carName = document.forms["addCarForm"]["txtCarName"].value;
                var manufacturer = document.forms["addCarForm"]["txtManufacturner"].value;

                if (carName === "" || manufacturer === "") {
                    alert("CarName or Manufacturer cannot be empty.");
                    return false;
                }

                alert("Car created successfully!");
                return true;
            }
        </script>
    </head>

    <%
        User user = (User) session.getAttribute("account");
        if (user == null || user.isIsAdmin() == false) {
            response.sendRedirect("carlist");
        }
    %>
    

    <body>
        <span id="title">Add Car</span>
        <div class="form--create">
            <img
                src="./image/addimg.avif"
                alt=""
                />
            <form action="process" name="addCarForm" onsubmit="return validateForm()" method="post">
                <div class="form--add">
                    <div class="carId">
                        <span>CarID</span><br />
                        <input type="text" name="txtCarID" value="${requestScope.countCarID}" readonly /><br />
                    </div>
                    <div class="carName">
                        <span>CarName</span><br />
                        <input type="text" name="txtCarName" value="" placeholder="BMW i8"/><br />
                    </div>
                    <div class="manufacturer">
                        <span>Manufacturer</span><br />
                        <input type="text" name="txtManufacturner"value="" placeholder="BMW" /><br />
                    </div>
                    <div class="price">
                        <span>Price</span><br />
                        <input type="text" name="txtPrice" value="0" placeholder="9999.00" /><br />
                    </div>
                    <div class="releasedYear">
                        <span>ReleasedYear</span><br />
                        <input type="text" name="txtReleasedYear" value="2000" placeholder="2024" /><br />
                    </div>
                </div>
                <div class="submit">
                    <a href="carlist">Back</a>
                    <input id="create" type="submit" value="Create" name="btnAction" />
                </div>
            </form>
        </div>
    </body>
</html>
