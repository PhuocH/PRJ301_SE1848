

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i>Producers</div>
        <ul class="list-group category_block">
            <c:forEach items="${listP}" var="p">
                <li class="list-group-item text-white ${tag == p.id ? "active" : ""}"><a href="producer?id=${p.id}">${p.name}</a></li>
                </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last product</div>
        <div class="card-body">
            <img class="img-fluid" src="${lastM.image}" />
            <h5 class="card-title">${lastM.mobileName}</h5>
            <p class="card-text">${lastM.description}</p>
            <p class="bloc_left_price">${lastM.price}.000 VND</p>
        </div>
    </div>
</div>