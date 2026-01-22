<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý biến thể</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>

<div class="admin-header">
    <h2>Quản lý biến thể</h2>
</div>

<!-- Form thêm / chỉnh sửa biến thể -->
<div class="form-box variant-form-box">
    <form id="variant-form" action="variant" method="post">
        <c:if test="${variant != null}">
            <input type="hidden" name="productId" value="${variant.productId}"/>
            <input type="hidden" name="sizeId" value="${variant.sizeId}"/>
            <input type="hidden" name="colorId" value="${variant.colorId}"/>
        </c:if>

        <div class="form-group">
            <label>Size:</label>
            <select name="sizeId">
                <c:forEach var="s" items="${sizes}">
                    <option value="${s.id}" <c:if test="${variant != null && variant.sizeId == s.id}">selected</c:if>>
                            ${s.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Màu:</label>
            <select name="colorId">
                <c:forEach var="c" items="${colors}">
                    <option value="${c.id}" <c:if test="${variant != null && variant.colorId == c.id}">selected</c:if>>
                            ${c.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Stock:</label>
            <input type="number" name="stock" min="0" value="<c:out value='${variant != null ? variant.stock : 0}'/>"/>
        </div>

        <button type="submit" class="btn-submit">
            <c:out value="${variant != null ? 'Cập nhật' : 'Thêm mới'}"/>
        </button>
    </form>
</div>

<!-- Danh sách biến thể -->
<div class="section">
    <table class="data-table">
        <thead>
        <tr>
            <th>ID sản phẩm</th>
            <th>Size</th>
            <th>Màu</th>
            <th>Stock</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="v" items="${variants}">
            <tr>
                <td>${v.productId}</td>
                <td>${v.sizeName}</td>
                <td>${v.colorName}</td>
                <td>${v.stock}</td>
                <td class="actions">
                    <a href="variant?edit=${v.productId}&sizeId=${v.sizeId}&colorId=${v.colorId}" class="btn edit">Sửa</a>
                    <a href="variant?delete=${v.productId}&sizeId=${v.sizeId}&colorId=${v.colorId}" class="btn delete"
                       onclick="return confirm('Xóa biến thể này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty variants}">
            <tr>
                <td colspan="5" class="empty">Chưa có biến thể</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>

</body>
</html>
