<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="admin-header">
    <h2>Quản lý tài khoản</h2>
</div>

<div class="form-box account-form-box">
    <form action="${pageContext.request.contextPath}/admin/accounts" method="post">
        <input type="hidden" name="id" value="${user.id}"/>

        <div class="form-group">
            <label>Họ tên</label>
            <input type="text" name="full_name" value="${user.fullName}" required/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="${user.email}" required/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password"
                    placeholder="${user.id == null ? 'Enter password' : 'Leave blank to keep current password'}"
                    ${user.id == null ? 'required' : ''}/>
        </div>

        <div class="form-group">
            <label>Số điện thoại</label>
            <input type="text" name="phone_number" value="${user.phoneNumber}"/>
        </div>

        <div class="form-group">
            <label>Role</label>
            <select name="role">
                <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
                <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
            </select>
        </div>

        <div class="form-group">
            <label>Active</label>
            <select name="is_active">
                <option value="true" ${user.active ? 'selected' : ''}>Active</option>
                <option value="false" ${!user.active ? 'selected' : ''}>Inactive</option>
            </select>
        </div>

        <button type="submit" class="btn-submit">
            ${user.id == null ? "Thêm mới" : "Cập nhật"}
        </button>
    </form>
</div>

<div class="section">
    <table class="data-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Họ tên</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Active</th>
            <th>Created At</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="u" items="${users}">
            <tr>
                <td>${u.id}</td>
                <td>${u.fullName}</td>
                <td>${u.email}</td>
                <td>${u.phoneNumber}</td>
                <td>${u.role}</td>
                <td>${u.active ? 'Active' : 'Inactive'}</td>
                <td>${u.createdAt}</td>
                <td class="actions">
                    <a href="${pageContext.request.contextPath}/admin/accounts?edit=${u.id}"
                       class="btn edit">Sửa</a>

                    <a href="${pageContext.request.contextPath}/admin/accounts?delete=${u.id}"
                       class="btn delete"
                       onclick="return confirm('Xóa user này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty users}">
            <tr>
                <td colspan="8" class="empty">Chưa có user nào</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>