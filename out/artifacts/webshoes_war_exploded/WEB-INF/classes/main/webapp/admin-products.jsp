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
    <h3>
        <c:choose>
            <c:when test="${isEdit}">
                Chỉnh sửa sản phẩm (ID: ${product.id})
            </c:when>
            <c:otherwise>
                Thêm sản phẩm mới
            </c:otherwise>
        </c:choose>
    </h3>
    <c:if test="${product.discontinue}">
        <div style="color: red; margin-bottom: 10px;">
            Sản phẩm đã bị xoá và không thể chỉnh sửa.
        </div>
    </c:if>
    <form action="${pageContext.request.contextPath}/admin/products" method="post">
        <c:if test="${isEdit}">
            <input type="hidden" name="id" value="${product.id}"/>
        </c:if>


        <div class="form-group">
            <label>Tên sản phẩm</label>
            <input name="name" type="text" value="${product != null ? product.name : ''}" required/>
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
            <select name="brandId">
                <c:forEach var="b" items="${brands}">
                    <option value="${b.id}"
                        <c:if test="${isEdit && product.brandId == b.id}">
                                selected
                        </c:if>>
                            ${b.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Trạng thái bán</label>
            <c:choose>
                <c:when test="${product.discontinue}">
                    <input type="hidden" name="available" value="${product.available ? 'true' : 'false'}" />
                    <select disabled>
                        <option> ${product.available ? "Đang bán" : "Ngừng bán"}</option>
                    </select>
                </c:when>
                <c:otherwise>
                    <select name="available">
                        <option value="true"
                                <c:if test="${!isEdit || product.available}">selected</c:if>>
                            Đang bán
                        </option>
                        <option value="false"
                                <c:if test="${isEdit && !product.available}">selected</c:if>>
                            Ngừng bán
                        </option>
                    </select>
                </c:otherwise>
            </c:choose>
        </div>

        <button type="submit" class="btn-submit"
            <c:if test="${product.discontinue}">disabled</c:if>>
            ${isEdit ? "Cập nhật" : "Thêm mới"}
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
                    <option value="${b.id}"
                        <c:if test="${param.brandId == b.id}">
                            selected
                        </c:if>
                    >
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
                <th>Trạng thái</th>
                <th class="actions">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td title="${p.description}">
                        <c:choose>
                            <c:when test="${not empty p.description}">
                                ${fn:length(p.description) > 80
                                ? fn:substring(p.description, 0, 80)
                                : p.description}
                            </c:when>
                            <c:otherwise>
                                <em>Không có mô tả</em>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${p.price} ₫</td>
                    <td>${p.brandId}</td>
                    <td>
                        <c:choose>
                            <c:when test="${p.discontinue}">
                                <span style="color: red">Đã xoá</span>
                            </c:when>
                            <c:when test="${!p.available}">
                                <span style="color: orange">Ngừng bán</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: green">Đang bán</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="actions">
                        <c:if test="${!p.discontinue}">
                            <a href="${pageContext.request.contextPath}/admin/products?edit=${p.id}"
                               class="btn edit">Sửa</a>

                            <form method="post"
                                  action="${pageContext.request.contextPath}/admin/products"
                                  style="display:inline;"
                                  onsubmit="return confirm('Xóa sản phẩm này?');">
                                <input type="hidden" name="deleteId" value="${p.id}"/>
                                <button type="submit" class="btn delete">Xóa</button>
                            </form>
                        </c:if>

                        <c:if test="${p.discontinue}">
                            <span style="color: #fff">Đã xoá</span>
                        </c:if>
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
