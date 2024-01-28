<%@page import="java.util.List"%>
<%@page import="model.Cars"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Car</title>
    </head>
    <body>
        <a href="http://localhost:9999/workshop1/addcar.jsp">Create new</a>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Manufacturer</th>
                <th>Price</th>
                <th>ReleasedYear</th>
                <th></th>
            </tr>
            <%
                List<Cars> list = (List<Cars>) request.getAttribute("carList");
                if (list != null && !list.isEmpty()) {
                    for (Cars c : list) {
            %>
            <tr>
                <td><%=c.getCarID()%></td>
                <td><%=c.getCarName()%></td>
                <td><%=c.getManufacturer()%></td>
                <td><%=c.getPrice()%></td>
                <td><%=c.getReleasedYear()%></td>
                <td><a>Edit</a>|<a>Details</a>|<a>Delete</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>
