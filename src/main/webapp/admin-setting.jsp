<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Cài đặt hệ thống</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
<div class="admin-header">
    <h2>Cài đặt hệ thống</h2>
</div>

<!-- Site Information Section -->
<section class="setting-section">
    <h3>Thông tin trang web</h3>
    <form action="admin-update-settings.jsp" method="post">
        <label for="siteName">Tên trang web:</label>
        <input type="text" id="siteName" name="siteName" value="${siteName}" required>

        <label for="siteEmail">Email liên hệ:</label>
        <input type="email" id="siteEmail" name="siteEmail" value="${siteEmail}" required>

        <label for="sitePhone">Số điện thoại:</label>
        <input type="text" id="sitePhone" name="sitePhone" value="${sitePhone}">

        <label for="siteAddress">Địa chỉ:</label>
        <input type="text" id="siteAddress" name="siteAddress" value="${siteAddress}">

        <button type="submit" class="btn-save">Lưu thay đổi</button>
    </form>
</section>

<!-- Notifications Settings -->
<section class="setting-section">
    <h3>Thông báo & Email</h3>
    <form action="admin-update-notifications.jsp" method="post">
        <label>
            <input type="checkbox" name="newOrders" <c:if test="${newOrders}">checked</c:if>>
            Thông báo khi có đơn hàng mới
        </label>

        <label>
            <input type="checkbox" name="newsletterSignup" <c:if test="${newsletterSignup}">checked</c:if>>
            Thông báo khi có người đăng ký nhận tin
        </label>

        <button type="submit" class="btn-save">Lưu thay đổi</button>
    </form>
</section>

<!-- Account Settings -->
<section class="setting-section">
    <h3>Tài khoản quản trị</h3>
    <form action="admin-update-account.jsp" method="post">
        <label for="adminUsername">Tên đăng nhập:</label>
        <input type="text" id="adminUsername" name="adminUsername" value="${adminUsername}" required>

        <label for="adminPassword">Mật khẩu mới:</label>
        <input type="password" id="adminPassword" name="adminPassword" placeholder="Để trống nếu không đổi">

        <button type="submit" class="btn-save">Cập nhật tài khoản</button>
    </form>
</section>

</body>
</html>
