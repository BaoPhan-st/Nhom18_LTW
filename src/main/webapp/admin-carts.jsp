<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="admin-header">
    <h2>Quản lý giỏ hàng</h2>
</div>

<%--    TABLE    --%>
<div class="section">

    <%--    SEARCH & FILTER    --%>
    <form method="get"
            action="${pageContext.request.contextPath}/admin/carts"
            class="table-toolbar">
        <input type="text"
            name="userId"
            placeholder="User ID"
            value="${param.userId}"/>
        <button type="submit" class="btn-search">Tìm</button>
        <a href="${pageContext.request.contextPath}/admin/carts"
            class="btn-reset" style="color: #49c2db; margin-left: 5px;">Reset</a>
    </form>

    <%--    SCROLL   --%>
    <div class="table-scroll-top">
        <div class="scroll-inner"></div>
    </div>

    <div class="table-wrapper">
        <table class="data-table">
            <thead>
            <tr>
                <th>ID Khách hàng</th>
                <th>ID Sản phẩm</th>
                <th>ID Màu sắc</th>
                <th>ID Size</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Tổng</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.userId}</td>
                    <td>${item.productId}</td>
                    <td>${item.colorId}</td>
                    <td>${item.sizeId}</td>
                    <td>${item.quantity}</td>
                    <td>
                        <fmt:formatNumber value="${item.price}"
                                          type="currency"
                                          currencySymbol="₫"/>
                    </td>
                    <td>
                        <fmt:formatNumber value="${item.totalPrice}"
                                          type="currency"
                                          currencySymbol="₫"/>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty cartItems}">
                <tr>
                    <td colspan="7" class="empty">Giỏ hàng trống.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
