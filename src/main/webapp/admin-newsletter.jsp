<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Newsletter</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

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
                    <td><fmt:formatDate value="${n.subscribed_at}" pattern="dd/MM/yyyy HH:mm"/></td>
                    <td class="actions">
                        <form method="post" action="newsletter" onsubmit="return confirm('Xóa email này?');" style="display:inline;">
                            <input type="hidden" name="deleteId" value="${n.id}" />
                            <button type="submit" class="btn delete">Xóa</button>
                        </form>
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

</body>
</html>
