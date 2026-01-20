<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="admin-header">
    <h2>Quản lý đơn hàng</h2>
</div>

<%--    TABLE    --%>
<div class="section">

    <%--    FILTER & SEARCH    --%>
    <div class="filter-bar">
        <form method="get" action="${pageContext.request.contextPath}/admin/orders">

            <input type="text"
                   name="orderId"
                   placeholder="Mã đơn..."
                   value="${param.orderId}"/>

            <input type="text"
                   name="userId"
                   placeholder="User ID..."
                   value="${param.userId}"/>

            <select name="status">
                <option value="">-- Trạng thái --</option>
                <option value="pending" ${param.status == 'pending' ? 'selected' : ''}>Pending</option>
                <option value="completed" ${param.status == 'completed' ? 'selected' : ''}>Completed</option>
                <option value="cancelled" ${param.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
            </select>

            <button type="submit" class="btn-submit">
                <i class="fa fa-search"></i> Tìm kiếm
            </button>
        </form>
    </div>

    <%--    SCROLL    --%>
    <div class="table-scroll-top">
        <div></div>
    </div>

    <div class="table-wrapper">
        <table class="data-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>User ID</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>#${order.id}</td>
                    <td>${order.user_id}</td>
                    <td>${order.grand_total} ₫</td>
                    <td>
                        <span class="status ${order.order_status}">
                                ${order.order_status}
                        </span>
                    </td>
                    <td>
                        <fmt:formatDate value="${order.created_at}" pattern="dd/MM/yyyy HH:mm"/>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty orders}">
                <tr>
                    <td colspan="5" class="empty">Không tìm thấy đơn hàng</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
