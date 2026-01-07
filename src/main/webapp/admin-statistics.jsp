<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thống kê Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <style>
        .stats-container {
            display: flex;
            gap: 30px;
            padding: 20px;
        }
        .stat-card {
            flex: 1;
            background-color: #f5f5f5;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
        }
        .stat-card h3 {
            margin-bottom: 10px;
        }
        .stat-number {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>

<div class="admin-header">
    <h2>Thống kê</h2>
</div>

<div class="stats-container">
    <div class="stat-card">
        <h3>Tổng số đơn</h3>
        <div class="stat-number" id="total-orders">${totalOrders}</div>
    </div>

    <div class="stat-card">
        <h3>Doanh thu</h3>
        <div class="stat-number" id="revenue">${revenue} ₫</div>
    </div>
</div>

</body>
</html>
