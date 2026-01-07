<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Bộ sưu tập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="container">

    <div class="admin-header">
        <h2>Quản lý bộ sưu tập</h2>
    </div>

    <!-- FORM -->
    <div class="form-box">
        <form action="collection" method="post">
            <input type="hidden" name="id" value="${collection.id}"/>

            <div class="form-group">
                <label>Tên</label>
                <input name="name" type="text" value="${collection.name}" required/>
            </div>

            <div class="form-group">
                <label>Slug</label>
                <input name="slug" type="text" value="${collection.slug}"/>
            </div>

            <div class="form-group">
                <label>Loại RuleSet</label>
                <select name="ruleSet_type">
                    <option value="manual" <c:if test="${collection.ruleSet_type=='manual'}">selected</c:if>>Manual</option>
                    <option value="automatic" <c:if test="${collection.ruleSet_type=='automatic'}">selected</c:if>>Automatic</option>
                </select>
            </div>

            <div class="form-group">
                <label>Active</label>
                <select name="is_active">
                    <option value="true" <c:if test="${collection.is_active}">selected</c:if>>Active</option>
                    <option value="false" <c:if test="${!collection.is_active}">selected</c:if>>Inactive</option>
                </select>
            </div>

            <button type="submit" class="btn-submit">
                <c:choose>
                    <c:when test="${collection.id == null}">Thêm mới</c:when>
                    <c:otherwise>Cập nhật</c:otherwise>
                </c:choose>
            </button>
        </form>
    </div>

    <!-- TABLE -->
    <div class="section">
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Slug</th>
                <th>Loại RuleSet</th>
                <th>Active</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="c" items="${collections}">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.slug}</td>
                    <td>${c.ruleSet_type}</td>
                    <td>${c.is_active ? 'Active' : 'Inactive'}</td>
                    <td class="actions">
                        <a href="collection?edit=${c.id}" class="btn edit">Sửa</a>
                        <a href="collection?delete=${c.id}" class="btn delete"
                           onclick="return confirm('Xóa bộ sưu tập này?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty collections}">
                <tr>
                    <td colspan="6" class="empty">Chưa có bộ sưu tập</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
