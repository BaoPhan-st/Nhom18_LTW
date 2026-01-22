<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            <label>Mô tả sản phẩm</label>
            <input name="description" type="text" value="${product.description}" required/>
        </div>

        <div class="form-group">
            <label>Giá</label>
            <input name="price" type="number" step="0.01" value="${product.price}" required/>
        </div>

        <div class="form-group">
            <label>Thương hiệu</label>
            <select name="brand">
                <c:forEach var="b" items="${brands}">
                    <option value="${b.id}" ${product.brand == b.id ? 'selected' : ''}>${b.name}</option>
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
            <th>Mô tả</th>
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
                <td>${p.description}</td>
                <td>${p.price} ₫</td>
                <td>${p.brandName}</td>
                <td class="actions">
                    <a href="product?edit=${p.id}" class="btn edit">Sửa</a>
                    <form method="post" action="product" style="display:inline;"
                          onsubmit="return confirm('Xóa sản phẩm này?');">
                        <input type="hidden" name="deleteId" value="${p.id}"/>
                        <button type="submit" class="btn delete">Xóa</button>
                    </form>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty products}">
            <tr>
                <td colspan="6" class="empty">Chưa có sản phẩm</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
