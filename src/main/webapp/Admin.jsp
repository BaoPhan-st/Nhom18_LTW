<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>Admin</title>
    <link rel="stylesheet" href="assets/css/admin.css"/>

    <!-- Font Awesome để dùng icon -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
</head>

<body>
<div class="sidebar">
    <div class="admin-avatar">
        <div class="admin-icon">BHD</div>
        <span class="admin-name">Admin</span>
    </div>

    <ul class="menu">
        <li class="active" data-page="admin-dashboard.jsp"><a>Dashboard</a></li>
        <li data-page="admin-accounts.jsp"><a>Tài khoản</a></li>
        <li data-page="admin-products.jsp"><a>Sản phẩm</a></li>
        <li data-page="admin-variants.jsp"><a>Biến thể</a></li>
        <li data-page="admin-collections.jsp"><a>Bộ sưu tập</a></li>
        <li data-page="admin-banners.jsp"><a>Banner</a></li>
        <li data-page="admin-orders.jsp"><a>Đơn hàng</a></li>
        <li data-page="admin-carts.jsp"><a>Giỏ hàng</a></li>
        <li data-page="admin-wishlist.jsp"><a>Yêu thích</a></li>
        <li data-page="admin-newsletter.jsp"><a>Đăng ký nhận tin</a></li>
        <li data-page="admin-statistics.jsp"><a>Thống kê</a></li>
        <li data-page="admin-logout.jsp"><a>Đăng xuất</a></li>
    </ul>
</div>

<div class="main">
    <div id="content-container">
        <%@include file="admin-dashboard.jsp" %>
    </div>
</div>

<script src="assets/script/admin.js"></script>
</body>
</html>
