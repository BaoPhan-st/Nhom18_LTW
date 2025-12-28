<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="container">

    <div class="admin-header">
        <h2>Quản lý sản phẩm</h2>
    </div>

    <!-- FORM THÊM/SỬA SẢN PHẨM -->
    <div class="form-box">
        <form action="product" method="post">
            <input type="hidden" name="id" value="${product.id}"/>

            <div class="form-group">
                <label>Tên sản phẩm</label>
                <input name="name" type="text" value="${product.name}" required/>
            </div>

            <div class="form-group">
                <label>Giá</label>
                <input name="price" type="number" step="0.01" value="${product.price}" required/>
            </div>

            <div class="form-group">
                <label>Thương hiệu</label>
                <select name="brand_id">
                    <c:forEach var="b" items="${brands}">
                        <option value="${b.id}" ${product.brand_id == b.id ? 'selected' : ''}>${b.name}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn-submit">
                ${product.id == null ? "Thêm mới" : "Cập nhật"}
            </button>
        </form>
    </div>

    <!-- TABLE SẢN PHẨM -->
    <div class="section">
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Thương hiệu</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.price} ₫</td>
                    <td>${p.brandName}</td>
                    <td class="actions">
                        <a href="product?edit=${p.id}" class="btn edit">Sửa</a>
                        <a href="product?delete=${p.id}" class="btn delete"
                           onclick="return confirm('Xóa sản phẩm này?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty products}">
                <tr>
                    <td colspan="5" class="empty">Chưa có sản phẩm</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
