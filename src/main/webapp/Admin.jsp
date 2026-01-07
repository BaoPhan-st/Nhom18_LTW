<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>Admin</title>
    <base href="${pageContext.request.contextPath}/" />
    <link rel="stylesheet" href="assets/css/admin.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>

<body>
<noscript>
    <p style="color:red; text-align:center;">Bạn cần bật JavaScript để quản trị hoạt động bình thường.</p>
</noscript>

<div class="sidebar">
    <div class="admin-avatar">
        <div class="admin-icon">BHD</div>
        <span class="admin-name">Admin</span>
    </div>

    <ul class="menu">
        <li class="active" data-page="admin-dashboard.jsp" aria-current="page"><a href="#">Dashboard</a></li>
        <li data-page="admin-accounts.jsp"><a href="#">Tài khoản</a></li>
        <li data-page="admin-products.jsp"><a href="#">Sản phẩm</a></li>
        <li data-page="admin-variants.jsp"><a href="#">Biến thể</a></li>
        <li data-page="admin-collections.jsp"><a href="#">Bộ sưu tập</a></li>
        <li data-page="admin-banners.jsp"><a href="#">Banner</a></li>
        <li data-page="admin-orders.jsp"><a href="#">Đơn hàng</a></li>
        <li data-page="admin-carts.jsp"><a href="#">Giỏ hàng</a></li>
        <li data-page="admin-wishlist.jsp"><a href="#">Yêu thích</a></li>
        <li data-page="admin-newsletter.jsp"><a href="#">Đăng ký nhận tin</a></li>
        <li data-page="admin-statistics.jsp"><a href="#">Thống kê</a></li>
        <li data-page="admin-logout.jsp"><a href="#">Đăng xuất</a></li>
    </ul>
</div>

<div class="main">
    <div id="content-container">
        <%@ include file="admin-dashboard.jsp" %>
    </div>
</div>

<script src="assets/script/admin.js"></script>
</body>
</html>
