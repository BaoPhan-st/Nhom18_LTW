<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="admin-header">
    <h2>Cài đặt hệ thống</h2>
</div>

<section class="setting-section">
    <h3>Thông tin trang web</h3>
    <form action="${pageContext.request.contextPath}/setting" method="post">
        <input type="hidden" name="action" value="site">

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

<section class="setting-section">
    <h3>Thông báo & Email</h3>
    <form action="${pageContext.request.contextPath}/setting" method="post">
        <input type="hidden" name="action" value="notification">

        <label>
            <input type="checkbox" name="newOrders"
                   <c:if test="${newOrders}">checked</c:if>>
            Thông báo khi có đơn hàng mới
        </label>

        <label>
            <input type="checkbox" name="newSletterSignup"
                   <c:if test="${newSletterSignup}">checked</c:if>>
            Thông báo khi có người đăng ký nhận tin
        </label>

        <button type="submit" class="btn-save">Lưu thay đổi</button>
    </form>
</section>

<section class="setting-section">
    <h3>Tài khoản quản trị</h3>
    <form action="${pageContext.request.contextPath}/setting" method="post">
        <input type="hidden" name="action" value="account">

        <label for="adminUserName">Tên đăng nhập:</label>
        <input type="text" id="adminUserName" name="adminUserName"
               value="${adminUsername}" required>

        <label for="adminPassword">Mật khẩu mới:</label>
        <input type="password" id="adminPassword" name="adminPassword">

        <button type="submit" class="btn-save">Cập nhật tài khoản</button>
    </form>
</section>
