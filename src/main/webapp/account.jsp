<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.user.User" %>

<%
    User user = (User) session.getAttribute("currentUser");

    // Nếu không có session, chuyển về login
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BHD - SPORT SHOES</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon_io/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />



    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/script/reponsive.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/account.css"
    />
</head>

<body id="top">
<jsp:include page="header.jsp" />

<main class="TaiKhoanPage">
    <div class="container account-dashboard">
        <h1 class="h2 page-title">Tài Khoản Của Tôi</h1>

        <div class="account-layout">
            <aside class="account-sidebar">
                <div class="user-info-summary">
                    <p class="user-name-display">
                        Xin chào, <strong><%= user.getFullName() != null ? user.getFullName() : user.getEmail() %></strong>
                    </p>
                </div>
                <ul class="account-nav-list">
                    <li class="active"><a href="#personal-info" data-tab="info"><ion-icon name="person-circle-outline"></ion-icon> Thông tin cá nhân</a></li>
                    <li><a href="#change-password" data-tab="password"><ion-icon name="lock-closed-outline"></ion-icon> Đổi mật khẩu</a></li>
                    <li><a href="#address-book" data-tab="address"><ion-icon name="map-outline"></ion-icon> Sổ địa chỉ</a></li>
                    <li><a href="#order-history" data-tab="orders"><ion-icon name="time-outline"></ion-icon> Lịch sử đơn hàng</a></li>

                    <li>
                        <a href="#" id="btn-logout-trigger"><ion-icon name="log-out-outline"></ion-icon> Đăng xuất</a>
                    </li>
                </ul>
            </aside>

            <div class="account-content">
                <section id="personal-info" class="tab-content active" data-content="info">
                    <h3 class="h3 content-title">Thông Tin Cá Nhân</h3>
                    <p>Quản lý tên, email và số điện thoại của bạn.</p>
                    <form class="account-form" method="post" action="account">
                        <div class="input-group">
                            <label for="full-name">Họ và Tên</label>
                            <input type="text" id="full-name" name="fullName" value="<%= user.getFullName() != null ? user.getFullName() : "" %>" required />
                        </div>
                        <div class="input-group">
                            <label for="email">Địa chỉ Email</label>
                            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" readonly required />
                        </div>
                        <div class="input-group">
                            <label for="phone">Số điện thoại</label>
                            <input type="tel" id="phone" name="phoneNumber" value="<%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "" %>" required />
                        </div>
                        <div class="input-group">
                            <label for="address">Địa chỉ</label>
                            <input type="text" id="address" name="address" value="<%= user.getAddress() != null ? user.getAddress() : "" %>" />
                        </div>
                        <button type="submit" class="btn btn-primary btn-save">Cập Nhật Thông Tin</button>
                    </form>
                </section>

                <section id="change-password" class="tab-content" data-content="password">
                    <h3 class="h3 content-title">Đổi Mật Khẩu</h3>
                    <p>Đặt mật khẩu mới để tăng cường bảo mật tài khoản.</p>

                    <%
                        String passMsg = (String) request.getAttribute("passMsg");
                        String msgType = (String) request.getAttribute("msgType");

                        if (passMsg != null) {
                            String alertClass = (msgType != null && msgType.equals("success")) ? "alert-success" : "alert-danger";
                    %>
                    <div class="alert <%= alertClass %>" role="alert">
                        <%= passMsg %>
                    </div>
                    <% } %>
                    <form class="account-form" method="post" action="${pageContext.request.contextPath}/account">
                        <input type="hidden" name="action" value="change-password"/>

                        <div class="input-group">
                            <label for="current-password">Mật khẩu hiện tại</label>
                            <input type="password" id="current-password" name="currentPassword" required />
                        </div>

                        <div class="input-group">
                            <label for="new-password">Mật khẩu mới</label>
                            <input type="password" id="new-password" name="newPassword" required />
                        </div>

                        <div class="input-group">
                            <label for="confirm-password">Xác nhận mật khẩu mới</label>
                            <input type="password" id="confirm-password" name="confirmPassword" required />
                        </div>

                        <button type="submit" class="btn btn-primary btn-save">Đổi Mật Khẩu</button>
                    </form>
                </section>

                <section id="address-book" class="tab-content" data-content="address">
                    <h3 class="h3 content-title">Sổ Địa Chỉ Giao Hàng</h3>
                    <div class="address-item">
                        <p class="address-label"><strong>Địa chỉ Mặc định:</strong></p>
                        <p><%= user.getAddress() != null ? user.getAddress() : "Chưa cập nhật" %></p>
                    </div>
                </section>

                <section id="order-history" class="tab-content" data-content="orders">
                    <h3 class="h3 content-title">Lịch Sử Đơn Hàng</h3>
                </section>
            </div>
        </div>
    </div>

    <div class="modal" id="addressModal"></div>

    <div class="modal" id="logoutModal" style="display: none;">
        <div class="modal-content">
            <span class="close-btn" id="closeLogout">&times;</span>
            <h3 class="h3 modal-title">Xác nhận đăng xuất</h3>
            <p>Bạn có chắc chắn muốn đăng xuất khỏi hệ thống không?</p>

            <div class="modal-actions">
                <button type="button" class="btn btn-secondary" id="cancelLogout">Không</button>

                <a href="${pageContext.request.contextPath}/logout" class="btn-confirm-logout">Có, đăng xuất</a>
            </div>
        </div>
    </div>

</main>

<jsp:include page="footer.jsp" />

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="${pageContext.request.contextPath}/assets/script/reponsive.js"></script>
<script src="${pageContext.request.contextPath}/assets/script/pageaccount.js"></script>
<script src="${pageContext.request.contextPath}/assets/script/account.js"></script>
<% if (request.getAttribute("passMsg") != null) { %>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const passwordTabLink = document.querySelector('a[data-tab="password"]');
        if(passwordTabLink) {
            passwordTabLink.click();
        }
    });
</script>
<% } %>


</body>
</html>