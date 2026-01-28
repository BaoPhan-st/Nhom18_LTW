<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <div class="admin-header">
                <h2>Quản lý đơn hàng</h2>
            </div>

            <%-- TABLE --%>
                <div class="section">

                    <%-- FILTER & SEARCH --%>
                        <div class="filter-bar">
                            <form method="get" action="${pageContext.request.contextPath}/admin/orders">

                                <input type="text" name="orderId" placeholder="Mã đơn..." value="${param.orderId}" />

                                <input type="text" name="userId" placeholder="User ID..." value="${param.userId}" />

                                <select name="status">
                                    <option value="">-- Trạng thái --</option>
                                    <option value="pending" ${param.status=='pending' ? 'selected' : '' }>Pending
                                    </option>
                                    <option value="completed" ${param.status=='completed' ? 'selected' : '' }>Completed
                                    </option>
                                    <option value="cancelled" ${param.status=='cancelled' ? 'selected' : '' }>Cancelled
                                    </option>
                                </select>

                                <button type="submit" class="btn-submit">
                                    <i class="fa fa-search"></i> Tìm kiếm
                                </button>
                            </form>
                        </div>

                        <%-- SCROLL --%>
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
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td>#${order.id}</td>
                                                <td>${order.userId}</td>
                                                <td>${order.grandTotal} ₫</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.orderStatus == 'NEW'}">
                                                            <span class="status NEW">Mới đặt</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'PENDING'}">
                                                            <span class="status PENDING">Chờ xử lý</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'SHIPPING'}">
                                                            <span class="status SHIPPING">Đang giao hàng</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'PROCESSING'}">
                                                            <span class="status PROCESSING">Đang chuẩn bị</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'DELIVERED'}">
                                                            <span class="status COMPLETED">Đã giao</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'COMPLETED'}">
                                                            <span class="status COMPLETED">Hoàn thành</span>
                                                        </c:when>
                                                        <c:when test="${order.orderStatus == 'CANCELLED'}">
                                                            <span class="status CANCELLED">Đã hủy</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span
                                                                class="status ${order.orderStatus}">${order.orderStatus}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${order.createdAtTimestamp}"
                                                        pattern="dd/MM/yyyy HH:mm" />
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/orders?action=view&orderId=${order.id}"
                                                        class="btn edit">Xem</a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <c:if test="${empty orders}">
                                            <tr>
                                                <td colspan="6" class="empty">Không tìm thấy đơn hàng</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                </div>

                <%-- MODAL ORDER DETAIL --%>
                    <c:if test="${not empty selectedOrder}">
                        <div class="modal show"
                            style="display: flex; position: fixed; top:0; left:0; width:100%; height:100%; background: rgba(0,0,0,0.5); justify-content: center; align-items: center; z-index: 1000;">
                            <div class="modal-content"
                                style="background: white; padding: 20px; border-radius: 8px; width: 600px; max-height: 80vh; overflow-y: auto;">
                                <div
                                    style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                                    <h3>Chi tiết đơn hàng #${selectedOrder.id}</h3>
                                    <a href="${pageContext.request.contextPath}/admin/orders"
                                        style="text-decoration: none; font-size: 20px; color: #333;">&times;</a>
                                </div>

                                <p><strong>Khách hàng:</strong> ID ${selectedOrder.userId}</p>
                                <p><strong>Ngày đặt:</strong>
                                    <fmt:formatDate value="${selectedOrder.createdAtTimestamp}"
                                        pattern="dd/MM/yyyy HH:mm" />
                                </p>
                                <p><strong>Địa chỉ:</strong> ${selectedOrder.shippingAddress}</p>
                                <p><strong>SĐT:</strong> ${selectedOrder.phoneNumber}</p>
                                <hr />
                                <table style="width: 100%; border-collapse: collapse; margin-top: 10px;">
                                    <thead>
                                        <tr style="border-bottom: 1px solid #eee;">
                                            <th style="text-align: left; padding: 8px;">Sản phẩm</th>
                                            <th style="padding: 8px;">Giá</th>
                                            <th style="padding: 8px;">SL</th>
                                            <th style="padding: 8px;">Tổng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${selectedOrder.items}">
                                            <tr style="border-bottom: 1px solid #eee;">
                                                <td
                                                    style="padding: 8px; display: flex; align-items: center; gap: 10px;">
                                                    <img src="${item.imageUrl}"
                                                        style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;" />
                                                    <div>
                                                        <div>${item.productName}</div>
                                                        <small style="color: #666;">${item.colorName} /
                                                            ${item.sizeName}</small>
                                                    </div>
                                                </td>
                                                <td style="padding: 8px; text-align: center;">
                                                    <fmt:formatNumber value="${item.unitPrice}" type="number" />
                                                </td>
                                                <td style="padding: 8px; text-align: center;">${item.quantity}</td>
                                                <td style="padding: 8px; text-align: center;">
                                                    <fmt:formatNumber value="${item.unitPrice * item.quantity}"
                                                        type="number" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div style="text-align: right; margin-top: 20px; font-weight: bold; font-size: 1.1em;">
                                    Tổng cộng:
                                    <fmt:formatNumber value="${selectedOrder.grandTotal}" type="number" /> ₫
                                </div>
                            </div>
                        </div>
                    </c:if>