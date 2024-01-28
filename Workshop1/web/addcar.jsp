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
                    document.getElementById("successMessage").innerHTML = "";
                    document.getElementById("errorMessage").innerHTML = "CarName and Manufacturer cannot be empty.";
                    return false;
                }

                document.getElementById("errorMessage").innerHTML = "";
                showSuccessMessage();
                return true;
            }

            function showSuccessMessage() {
                document.getElementById("successMessage").innerHTML = "Car added successfully!";
            }
        </script>
    </head>

    <% CarDAO carDao = new CarDAO();
        List<Cars> list = carDao.getAllCar();
        int countCarID = 1 + carDao.countListCar(list);
    %>

    <body>
        <span id="title">Add Car</span>
        <div class="form--create">
            <img
                src="https://img.freepik.com/free-vector/realistic-car-headlights-ad-composition-headlights-with-green-purple-illumination_1284-56577.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706227200&semt=ais"
                alt=""
                />
            <form action="process" name="addCarForm" onsubmit="return validateForm()" method="post">
                <div class="form--add">
                    <div class="carId">
                        <span>CarID</span><br />
                        <input type="text" name="txtCarID" value="<%=countCarID%>" readonly /><br />
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
                    <input id="create" type="submit" value="Create" name="btnAction" />
                    <div id="errorMessage" style="color: red;"></div>
                    <div id="successMessage" style="color: green;"></div>
                </div>

            </form>


        </div>
    </body>
</html>
