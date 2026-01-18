<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="admin-header">
    <h2>Yêu thích</h2>
</div>

<!-- TABLE DATA -->
<div class="section">
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
                <td>${w.idUser}</td>
                <td>${w.idProduct}</td>
                <td>${w.addedAt}</td>
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
