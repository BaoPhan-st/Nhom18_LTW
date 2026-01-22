<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Đơn hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="container">

    <div class="admin-header">
        <h2>Quản lý đơn hàng</h2>
    </div>

    <!-- TABLE -->
    <div class="section">
        <table class="data-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Khách hàng</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>#${order.id}</td>
                    <td>${order.customerName}</td>
                    <td>${order.grand_total} ₫</td>
                    <td>
                        <span class="status ${order.order_status}">
                                ${order.order_status}
                        </span>
                    </td>
                    <td><fmt:formatDate value="${order.created_at}" pattern="dd/MM/yyyy HH:mm"/></td>
                    <td class="actions">
                        <a href="order?view=${order.id}" class="btn edit">Xem</a>
                        <form method="post" action="order" style="display:inline;" onsubmit="return confirm('Xóa đơn hàng này?');">
                            <input type="hidden" name="deleteId" value="${order.id}" />
                            <button type="submit" class="btn delete">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty orders}">
                <tr>
                    <td colspan="6" class="empty">Chưa có đơn hàng nào</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
