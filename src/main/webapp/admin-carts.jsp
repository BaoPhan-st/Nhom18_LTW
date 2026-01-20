<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="admin-header">
    <h2>Quản lý giỏ hàng</h2>
</div>

<%--    TABLE    --%>
<div class="section">

    <%--    FILTER    --%>
    <div class="table-toolbar">
        <input type="text" data-filter="0" placeholder="ID đơn hàng">
        <input type="text" data-filter="1" placeholder="Khách hàng">
        <input type="text" data-filter="2" placeholder="Sản phẩm">

        <select data-filter="3">
            <option value="">-- Màu sắc --</option>
            <c:forEach var="od" items="${orders}">
                <option value="${od.colorName}">${od.colorName}</option>
            </c:forEach>
        </select>

        <select data-filter="4">
            <option value="">-- Size --</option>
            <c:forEach var="od" items="${orders}">
                <option value="${od.sizeName}">${od.sizeName}</option>
            </c:forEach>
        </select>

        <button class="btn-search">Tìm</button>
        <button class="btn-reset">Reset</button>
    </div>

    <%--    SCROLL   --%>
    <div class="table-scroll-top">
        <div class="scroll-inner"></div>
    </div>

    <div class="table-wrapper">
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
                        <fmt:formatNumber value="${od.unit_price}"
                                          type="currency"
                                          currencySymbol="₫"/>
                    </td>
                    <td>
                        <fmt:formatNumber value="${od.subtotal}"
                                          type="currency"
                                          currencySymbol="₫"/>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty orders}">
                <tr>
                    <td colspan="8" class="empty">Chưa có đơn hàng</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
