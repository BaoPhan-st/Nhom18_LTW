<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="admin-header">
    <h2>Dashboard</h2>
</div>

<div class="cards-manager">
    <div class="card">
        <h3>Đơn hàng hôm nay</h3>
        <span class="card-number"><c:out value="${todayOrders}"/></span>
    </div>

    <div class="card">
        <h3>Doanh thu hôm nay</h3>
        <span class="card-number"><c:out value="${todayRevenue}"/>₫</span>
    </div>

    <div class="card">
        <h3>Khách hàng mới</h3>
        <span class="card-number"><c:out value="${newCustomers}"/></span>
    </div>
</div>

<!-- Recent Orders -->
<div class="section">
    <h3>Đơn hàng gần đây</h3>

    <table class="data-table">
        <thead>
        <tr>
            <th>Mã đơn</th>
            <th>Khách hàng</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Ngày</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="o" items="${recentOrders}">
            <tr>
                <td><c:out value="${o.id}"/></td>
                <td><c:out value="${o.full_name}"/></td>
                <td><c:out value="${o.grand_total}"/> ₫</td>
                <td>
                    <span class="status <c:out value='${o.order_status}'/>">
                        <c:out value="${o.order_status}"/>
                    </span>
                </td>
                <td><c:out value="${o.created_at}"/></td>
            </tr>
        </c:forEach>

        <c:if test="${empty recentOrders}">
            <tr>
                <td colspan="5" class="empty">Chưa có đơn hàng</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
