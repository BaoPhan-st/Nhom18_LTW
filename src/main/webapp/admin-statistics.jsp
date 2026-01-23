<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="cards-manager">
    <div class="card">
        <h3>Tổng số đơn</h3>
        <span class="card-number" id="total-orders">
            <c:out value="${totalOrders}"/>
        </span>
    </div>

    <div class="card">
        <h3>Doanh thu</h3>
        <span class="card-number" id="revenue">
            <c:out value="${totalRevenue}"/>₫
        </span>
    </div>
</div>
