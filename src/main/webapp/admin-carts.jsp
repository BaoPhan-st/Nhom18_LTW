<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="admin-header">
    <h2>Quản lý giỏ hàng</h2>
</div>

<!-- TABLE -->
<div class="section">
    <table class="data-table">
        <thead>
        <tr>
            <th>ID Đơn hàng</th>
            <th>Khách hàng</th>
            <th>Sản phẩm</th>
            <th>Màu sắc</th>
            <th>Size</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Tổng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="od" items="${orders}">
            <tr>
                <td>${od.order_id}</td>
                <td>${od.userFullName}</td>
                <td>${od.productName}</td>
                <td>${od.colorName}</td>
                <td>${od.sizeName}</td>
                <td>${od.quantity}</td>
                <td>
                    <fmt:formatNumber value="${od.unit_price}" type="currency" currencySymbol="₫"/>
                </td>
                <td>
                    <fmt:formatNumber value="${od.subtotal}" type="currency" currencySymbol="₫"/>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty orderDetails}">
            <tr>
                <td colspan="8" class="empty">Chưa có đơn hàng</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
