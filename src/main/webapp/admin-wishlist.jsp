<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Yêu thích</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="admin-header">
    <h2>Yêu thích</h2>
</div>

<!-- TABLE DATA -->
<div class="section">
    <table class="data-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Sản phẩm</th>
            <th>Khách hàng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="w" items="${wishlists}">
            <tr>
                <td>${w.id}</td>
                <td>${w.productName}</td>
                <td>${w.customerName}</td>
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

</body>
</html>
