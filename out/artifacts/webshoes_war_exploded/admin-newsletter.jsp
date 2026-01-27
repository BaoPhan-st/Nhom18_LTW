<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="admin-header">
    <h2>Đăng ký nhận tin</h2>
</div>

<%--    TABLE    --%>
<div class="section">

    <%--    FILTER & SEARCH    --%>
    <div class="filter-bar">
        <form method="get" action="${pageContext.request.contextPath}/admin/newsletter">
            <input type="text"
                   name="email"
                   placeholder="Tìm theo email..."
                   value="${param.email}"/>

            <select name="status">
                <option value="">-- Trạng thái --</option>
                <option value="active" ${param.status == 'active' ? 'selected' : ''}>Active</option>
                <option value="inactive" ${param.status == 'inactive' ? 'selected' : ''}>Inactive</option>
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
                <th>Email</th>
                <th>Trạng thái</th>
                <th>Ngày đăng ký</th>
                <th class="actions">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="n" items="${newsletters}">
                <tr>
                    <td>${n.email}</td>
                    <td>
                    <span class="status ${n.active ? 'completed' : 'cancelled'}">
                            ${n.active ? 'Active' : 'Inactive'}
                    </span>
                    </td>
                    <td>
                        <fmt:formatDate value="${n.subscribedAt}" pattern="dd/MM/yyyy HH:mm"/>
                    </td>
                    <td class="actions">
                        <form method="post"
                              action="${pageContext.request.contextPath}/admin/newsletter"
                              onsubmit="return confirm('Xóa email này?');"
                              style="display:inline;">
                            <input type="hidden" name="deleteId" value="${n.id}"/>
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
</div>