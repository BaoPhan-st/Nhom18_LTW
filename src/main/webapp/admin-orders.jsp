<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Đơn hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="container">

    <div class="admin-header">
        <h2>Quản lý đơn hàng</h2>
    </div>

    <!-- TABLE -->
    <div class="section">
        <table class="data-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Khách hàng</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>#${order.id}</td>
                    <td>${order.customerName}</td>
                    <td>${order.grand_total} ₫</td>
                    <td>${order.order_status}</td>
                    <td>${order.created_at}</td>
                    <td class="actions">
                        <a href="order?view=${order.id}" class="btn edit">Xem</a>
                        <a href="order?delete=${order.id}" class="btn delete"
                           onclick="return confirm('Xóa đơn hàng này?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty orders}">
                <tr>
                    <td colspan="6" class="empty">Chưa có đơn hàng nào</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
