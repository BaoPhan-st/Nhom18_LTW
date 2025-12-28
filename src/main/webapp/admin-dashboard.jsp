<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-header">
    <h2>Dashboard</h2>
</div>

<!-- Statistic Cards -->
<div class="cards-manager">
    <div class="card">
        <h3>Đơn hàng hôm nay</h3>
        <span class="card-number">${todayOrders}</span>
    </div>

    <div class="card">
        <h3>Doanh thu hôm nay</h3>
        <span class="card-number">${todayRevenue} ₫</span>
    </div>

    <div class="card">
        <h3>Khách hàng mới</h3>
        <span class="card-number">${newCustomers}</span>
    </div>
</div>

<!-- Recent Orders -->
<div class="section">
    <h3>Đơn hàng gần đây</h3>

    <table class="data-table">
        <thead>
        <tr>
            <th>Mã đơn</th>
            <th>Khách hàng</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Ngày</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="o" items="${recentOrders}">
            <tr>
                <td>#${o.id}</td>
                <td>${o.full_name}</td>
                <td>${o.grand_total} ₫</td>
                <td>
                        <span class="status ${o.order_status}">
                                ${o.order_status}
                        </span>
                </td>
                <td>${o.created_at}</td>
            </tr>
        </c:forEach>

        <c:if test="${empty recentOrders}">
            <tr>
                <td colspan="5" class="empty">Chưa có đơn hàng</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>


</body>
</html>
