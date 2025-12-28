<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý tài khoản</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-header">
    <h2>Quản lý tài khoản</h2>
</div>

<div class="form-box account-form-box">
    <form action="user" method="post">
        <input type="hidden" name="id" value="${user.id}"/>

        <div class="form-group">
            <label>Họ tên</label>
            <input type="text" name="full_name" value="${user.full_name}" required/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="${user.email}" required/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" ${user.id == null ? 'required' : ''}/>
        </div>

        <div class="form-group">
            <label>Số điện thoại</label>
            <input type="text" name="phone_number" value="${user.phone_number}"/>
        </div>

        <div class="form-group">
            <label>Role</label>
            <select name="role">
                <option value="user" ${user.role=='user'?'selected':''}>User</option>
                <option value="admin" ${user.role=='admin'?'selected':''}>Admin</option>
            </select>
        </div>

        <div class="form-group">
            <label>Active</label>
            <select name="is_active">
                <option value="true" ${user.is_active?'selected':''}>Active</option>
                <option value="false" ${!user.is_active?'selected':''}>Inactive</option>
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
                <td>${u.full_name}</td>
                <td>${u.email}</td>
                <td>${u.phone_number}</td>
                <td>${u.role}</td>
                <td>${u.is_active ? 'Active' : 'Inactive'}</td>
                <td>${u.created_at}</td>
                <td class="actions">
                    <a href="user?edit=${u.id}" class="btn edit">Sửa</a>
                    <a href="user?delete=${u.id}" class="btn delete"
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
</body>
</html>
