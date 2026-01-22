<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Admin</title>
    <base href="${pageContext.request.contextPath}/" />
    <link rel="stylesheet" href="assets/css/admin.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>

<body>

<div class="sidebar">
    <div class="admin-avatar">
        <div class="admin-icon">BHD</div>
        <span class="admin-name">Admin</span>
    </div>

    <ul class="menu">
        <li class="${active == 'dashboard' ? 'active' : ''}">
            <a href="dashboard">Dashboard</a>
        </li>
        <li class="${active == 'accounts' ? 'active' : ''}">
            <a href="accounts">Tài khoản</a>
        </li>
        <li class="${active == 'products' ? 'active' : ''}">
            <a href="products">Sản phẩm</a>
        </li>
        <li class="${active == 'variants' ? 'active' : ''}">
            <a href="variants">Biến thể</a>
        </li>
        <li class="${active == 'collections' ? 'active' : ''}">
            <a href="collections">Bộ sưu tập</a>
        </li>
        <li class="${active == 'banners' ? 'active' : ''}">
            <a href="banners">Banner</a>
        </li>
        <li class="${active == 'orders' ? 'active' : ''}">
            <a href="orders">Đơn hàng</a>
        </li>
        <li class="${active == 'wishlist' ? 'active' : ''}">
            <a href="wishlist">Yêu thích</a>
        </li>
        <li class="${active == 'statistics' ? 'active' : ''}">
            <a href="statistics">Thống kê</a>
        </li>
        <li class="${active == 'setting' ? 'active' : ''}">
            <a href="setting">Cài đặt</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/logout">Đăng xuất</a>
        </li>
    </ul>
</div>

<div class="main">
    <jsp:include page="${contentPage}" />
</div>

</body>
</html>
