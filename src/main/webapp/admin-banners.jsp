<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Banner</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="container">
    <div class="admin-header">
        <h2>Quản lý banner</h2>
    </div>

    <!-- FORM -->
    <div class="form-box">
        <form action="banner" method="post">
            <input type="hidden" name="id" value="${banner.id}"/>

            <div class="form-group">
                <label>Tiêu đề</label>
                <input type="text" name="title" value="${banner.title}" required/>
            </div>

            <div class="form-group">
                <label>Link</label>
                <input type="text" name="link_url" value="${banner.link_url}"/>
            </div>

            <div class="form-group">
                <label>Ảnh</label>
                <input type="text" name="img_url" value="${banner.img_url}" placeholder="Nhập URL hình ảnh"/>
            </div>

            <div class="form-group">
                <label>Vị trí</label>
                <input type="text" name="position" value="${banner.position}"/>
            </div>

            <div class="form-group">
                <label>Thứ tự</label>
                <input type="number" name="sort_order" value="${banner.sort_order}"/>
            </div>

            <div class="form-group">
                <label>Active</label>
                <select name="is_active">
                    <option value="true" ${banner.is_active?'selected':''}>Active</option>
                    <option value="false" ${!banner.is_active?'selected':''}>Inactive</option>
                </select>
            </div>

            <div class="form-group">
                <label>Ngày bắt đầu</label>
                <input type="datetime-local" name="start_date" value="${banner.start_date}"/>
            </div>

            <div class="form-group">
                <label>Ngày kết thúc</label>
                <input type="datetime-local" name="end_date" value="${banner.end_date}"/>
            </div>

            <button type="submit" class="btn-submit">
                ${banner.id == null ? "Thêm mới" : "Cập nhật"}
            </button>
        </form>
    </div>

    <!-- TABLE -->
    <div class="section">
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Ảnh</th>
                <th>Link</th>
                <th>Vị trí</th>
                <th>Thứ tự</th>
                <th>Active</th>
                <th>Bắt đầu</th>
                <th>Kết thúc</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="b" items="${banners}">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.title}</td>
                    <td><img src="${b.img_url}" alt="Banner" style="width:100px;"/></td>
                    <td>${b.link_url}</td>
                    <td>${b.position}</td>
                    <td>${b.sort_order}</td>
                    <td>${b.is_active ? 'Active' : 'Inactive'}</td>
                    <td>${b.start_date}</td>
                    <td>${b.end_date}</td>
                    <td class="actions">
                        <a href="banner?edit=${b.id}" class="btn edit">Sửa</a>
                        <a href="banner?delete=${b.id}" class="btn delete"
                           onclick="return confirm('Xóa banner này?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty banners}">
                <tr>
                    <td colspan="10" class="empty">Chưa có banner</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
