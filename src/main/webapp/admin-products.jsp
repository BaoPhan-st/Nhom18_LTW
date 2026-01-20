<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:if test="${not empty error}">
    <pre>${error}</pre>
</c:if>

<div class="admin-header">
    <h2>Quản lý sản phẩm</h2>
</div>

<%--    FORM    --%>
<div class="form-box">
    <form action="${pageContext.request.contextPath}/admin/products" method="post">
        <input type="hidden" name="id" value="${product.id}"/>

        <div class="form-group">
            <label>Tên sản phẩm</label>
            <input name="name" type="text" value="${product.name}" required/>
        </div>

        <div class="form-group">
            <label>Mô tả</label>
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
                    <option value="${b.id}" ${product.brandID == b.id ? 'selected' : ''}>
                            ${b.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn-submit">
            ${product.id == null ? "Thêm mới" : "Cập nhật"}
        </button>
    </form>
</div>

<%--    TABLE    --%>
<div class="section">

    <%--   SEARCH & FILTER     --%>
    <div class="filter-bar">
        <form method="get" action="${pageContext.request.contextPath}/admin/products">

            <input type="text"
                   name="id"
                   placeholder="ID sản phẩm..."
                   value="${param.id}"/>

            <input type="text"
                   name="name"
                   placeholder="Tên sản phẩm..."
                   value="${param.name}"/>

            <select name="brandId">
                <option value="">-- Thương hiệu --</option>
                <c:forEach var="b" items="${brands}">
                    <option value="${b.id}" ${param.brandId == b.id ? 'selected' : ''}>
                            ${b.name}
                    </option>
                </c:forEach>
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
                <th>ID</th>
                <th>Tên</th>
                <th>Mô tả</th>
                <th>Giá</th>
                <th>Thương hiệu</th>
                <th class="actions">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td title="${p.description}">
                        ${fn:substring(p.description, 0, 80)}...
                    </td>
                    <td>${p.price} ₫</td>
                    <td>${p.brandID}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/admin/products?edit=${p.id}"
                           class="btn edit">Sửa</a>

                        <form method="post"
                              action="${pageContext.request.contextPath}/admin/products"
                              style="display:inline;"
                              onsubmit="return confirm('Xóa sản phẩm này?');">
                            <input type="hidden" name="deleteId" value="${p.id}"/>
                            <button type="submit" class="btn delete">Xóa</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty products}">
                <tr>
                    <td colspan="6" class="empty">Không tìm thấy sản phẩm</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
