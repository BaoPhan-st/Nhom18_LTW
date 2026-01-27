<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="admin-header">
    <h2>Yêu thích</h2>
</div>

<div class="section">

    <!-- FILTER -->
    <div class="filter-bar">
        <form method="get" action="${pageContext.request.contextPath}/admin/wishlist">
            <input type="text"
                   name="userId"
                   placeholder="User ID"
                   value="${param.userId}"/>

            <input type="text"
                   name="productId"
                   placeholder="Product ID"
                   value="${param.productId}"/>

            <button type="submit" class="btn-submit">
                Tìm kiếm
            </button>
        </form>
    </div>

    <!-- SCROLL -->
    <div class="table-scroll-top">
        <div></div>
    </div>

    <!-- TABLE -->
    <div class="table-wrapper">
        <table class="data-table">
            <thead>
            <tr>
                <th>Mã người dùng</th>
                <th>Mã sản phẩm</th>
                <th>Ngày thêm</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="w" items="${wishlists}">
                <tr>
                    <td>${w.userId}</td>
                    <td>${w.productId}</td>
                    <td>
                        <fmt:formatDate value="${w.addedAt}"
                                        pattern="dd/MM/yyyy HH:mm"/>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty wishlists}">
                <tr>
                    <td colspan="3" class="empty">Chưa có sản phẩm yêu thích</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
