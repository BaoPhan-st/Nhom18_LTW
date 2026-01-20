<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="admin-header">
    <h2>Quản lý biến thể</h2>
</div>

<!-- FORM -->
<div class="form-box variant-form-box">
    <form action="${pageContext.request.contextPath}/admin/variants" method="post">

        <c:if test="${variant != null}">
            <input type="hidden" name="productId" value="${variant.productId}"/>
            <input type="hidden" name="sizeIdOld" value="${variant.sizeId}"/>
            <input type="hidden" name="colorIdOld" value="${variant.colorId}"/>
        </c:if>

        <div class="form-group">
            <label>Size</label>
            <select name="sizeId" required>
                <c:forEach var="s" items="${sizes}">
                    <option value="${s.id}"
                        ${variant != null && variant.sizeId == s.id ? 'selected' : ''}>
                            ${s.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Màu</label>
            <select name="colorId" required>
                <c:forEach var="c" items="${colors}">
                    <option value="${c.id}"
                        ${variant != null && variant.colorId == c.id ? 'selected' : ''}>
                            ${c.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Stock</label>
            <input type="number"
                   name="stock"
                   min="0"
                   value="${variant != null ? variant.stock : 0}"
                   required/>
        </div>

        <button type="submit" class="btn-submit">
            ${variant != null ? 'Cập nhật' : 'Thêm mới'}
        </button>
    </form>
</div>

<!-- TABLE -->
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
                    <a href="${pageContext.request.contextPath}/admin/variants
                        ?edit=true
                        &productId=${v.productId}
                        &sizeId=${v.sizeId}
                        &colorId=${v.colorId}"
                       class="btn edit">Sửa</a>

                    <a href="${pageContext.request.contextPath}/admin/variants
                        ?delete=true
                        &productId=${v.productId}
                        &sizeId=${v.sizeId}
                        &colorId=${v.colorId}"
                       class="btn delete"
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
