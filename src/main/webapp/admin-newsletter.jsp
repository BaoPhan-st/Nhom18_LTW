<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Newsletter</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="container">

    <div class="admin-header">
        <h2>Đăng ký nhận tin</h2>
    </div>

    <!-- TABLE -->
    <div class="section">
        <table class="data-table">
            <thead>
            <tr>
                <th>Email</th>
                <th>Trạng thái</th>
                <th>Ngày đăng ký</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="n" items="${newsletters}">
                <tr>
                    <td>${n.email}</td>
                    <td>${n.is_active ? 'Active' : 'Inactive'}</td>
                    <td>${n.subscribed_at}</td>
                    <td class="actions">
                        <a href="newsletter?delete=${n.id}" class="btn delete"
                           onclick="return confirm('Xóa email này?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty newsletters}">
                <tr>
                    <td colspan="4" class="empty">Chưa có email đăng ký nào</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
