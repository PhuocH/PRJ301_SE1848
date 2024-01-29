<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="model.Cars"%>
<%@page import="dal.CarDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Car</title>
        <link rel="stylesheet" href="./css/styleUpdateCar.css"/>
        <script>
            function validateForm() {
                var carName = document.forms["updateCarForm"]["txtCarName"].value;
                var manufacturer = document.forms["updateCarForm"]["txtManufacturner"].value;

                if (carName === "" || manufacturer === "") {
                    alert("CarName or Manufacturer cannot be empty.");
                    return false;
                }

                alert("Car created successfully!");
                return true;
            }
        </script>
    </head>

    <body>
        <span id="title">Update Car</span>
        <div class="form--create">
            <img
                src="https://segalas.es/wp-content/uploads/2021/02/portada-taller.jpg"
                alt=""
                />
            <c:set var="c" value="${requestScope.updateByID}"/>
                <form action="process" name="updateCarForm" onsubmit="return validateForm()" method="post">
                    <div class="form--add">
                        <div class="carId">
                            <span>CarID</span><br />
                            <input type="text" name="txtCarID" value="${c.carID}" readonly /><br />
                        </div>
                        <div class="carName">
                            <span>CarName</span><br />
                            <input type="text" name="txtCarName" value="${c.carName}" placeholder="BMW i8"/><br />
                        </div>
                        <div class="manufacturer">
                            <span>Manufacturer</span><br />
                            <input type="text" name="txtManufacturner"value="${c.manufacturer}" placeholder="BMW" /><br />
                        </div>
                        <div class="price">
                            <span>Price</span><br />
                            <input type="text" name="txtPrice" value="${c.price}" placeholder="9999.00" /><br />
                        </div>
                        <div class="releasedYear">
                            <span>ReleasedYear</span><br />
                            <input type="text" name="txtReleasedYear" value="${c.releasedYear}" placeholder="2024" /><br />
                        </div>
                    </div>
                    <div class="submit">
                        <a href="carlist">Back</a>
                        <input id="create" type="submit" value="Save" name="btnAction" />
                    </div>
                </form>
        </div>
    </body>
</html>
