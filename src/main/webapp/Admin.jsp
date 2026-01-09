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
        <li class="active" data-page="admin-dashboard.jsp" aria-current="page"><a href="admin-dashboard.jsp">Dashboard</a></li>
        <li data-page="admin-accounts.jsp" class="link"><a href="admin-accounts.jsp">Tài khoản</a></li>
        <li data-page="admin-products.jsp" class="link"><a href="admin-products.jsp">Sản phẩm</a></li>
        <li data-page="admin-variants.jsp" class="link"><a href="admin-variants.jsp">Biến thể</a></li>
        <li data-page="admin-collections.jsp" class="link"><a href="admin-collections.jsp">Bộ sưu tập</a></li>
        <li data-page="admin-banners.jsp" class="link"><a href="admin-banners.jsp">Banner</a></li>
        <li data-page="admin-orders.jsp" class="link"><a href="admin-orders.jsp">Đơn hàng</a></li>
        <li data-page="admin-carts.jsp" class="link"><a href="admin-carts.jsp">Giỏ hàng</a></li>
        <li data-page="admin-wishlist.jsp" class="link"><a href="admin-wishlist.jsp">Yêu thích</a></li>
        <li data-page="admin-newsletter.jsp" class="link"><a href="admin-newsletter.jsp">Đăng ký nhận tin</a></li>
        <li data-page="admin-statistics.jsp" class="link"><a href="admin-statistics.jsp">Thống kê</a></li>
        <li data-page="admin-logout.jsp" class="link"><a href="admin-logout.jsp">Đăng xuất</a></li>
    </ul>
</div>

<div class="main">
    <div id="content-container">
<%--        <jsp:include page="admin-dashboard.jsp "/>--%>
        <%@ include file="admin-dashboard.jsp" %>
    </div>
</div>

<script src="assets/script/admin.js"></script>
<script>
    const links = document.querySelectorAll('.menu li a');
    const container = document.getElementById('content-container');
    links.forEach(link => {
        link.addEventListener('click', function (e){
            a.preventDefault();
            links.forEach(l => l.parentElement.classList.remove('active'));
            this.parentElement.classList.add('active');

            fetch(this.href)
                .then(resizeBy => resizeBy.text())
                .then(html => container.innerHTML = html)
                .catch(err => console.error(err));
        });
    });
</script>
</body>
</html>
