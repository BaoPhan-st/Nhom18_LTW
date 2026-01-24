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

    <!-- SEARCH FORM -->
    <div class="form-box search-box">
        <form action="${pageContext.request.contextPath}/admin/variants" method="get">

            <div class="form-group">
                <label>ID sản phẩm</label>
                <input type="number"
                       name="productId"
                       value="${param.productId}"
                       placeholder="Product ID"/>
            </div>

            <div class="form-group">
                <label>Size</label>
                <select name="sizeId">
                    <option value="">-- Tất cả --</option>
                    <c:forEach var="s" items="${sizes}">
                        <option value="${s.id}"
                            ${param.sizeId == s.id ? 'selected' : ''}>
                                ${s.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Màu</label>
                <select name="colorId">
                    <option value="">-- Tất cả --</option>
                    <c:forEach var="c" items="${colors}">
                        <option value="${c.id}"
                            ${param.colorId == c.id ? 'selected' : ''}>
                                ${c.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn-submit">Tìm kiếm</button>
            <a href="${pageContext.request.contextPath}/admin/variants"
               class="btn reset">Reset</a>
        </form>
    </div>


    <div class="table-wrapper">
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>ID sản phẩm</th>
                <th>Size</th>
                <th>Màu</th>
                <th>Stock</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="pv" items="${variants}">
                <tr>
                    <td>${pv.id}</td>
                    <td>${pv.productId}</td>
                    <td>${pv.sizeName}</td>
                    <td>${pv.colorName}</td>
                    <td>${pv.stock}</td>
                    <td>
                        <c:choose>
                            <c:when test="${pv.isDiscontinueVariant == 1}">
                                <span class="status off">Ngừng bán</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status on">Đang bán</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/admin/variants
                        ?edit=true
                        &productId=${pv.productId}
                        &sizeId=${pv.sizeId}
                        &colorId=${pv.colorId}"
                           class="btn edit">Sửa</a>

                        <c:choose>
                            <c:when test="${pv.isDiscontinueVariant == 0}">
                                <a href="${pageContext.request.contextPath}/admin/variants
                                ?disable=true
                                &productId=${pv.productId}
                                &sizeId=${pv.sizeId}
                                &colorId=${pv.colorId}"
                                   class="btn delete"
                                   onclick="return confirm('Ngừng bán biến thể này?')">
                                    Ngừng bán
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/admin/variants
                                ?restore=true
                                &productId=${pv.productId}
                                &sizeId=${pv.sizeId}
                                &colorId=${pv.colorId}"
                                   class="btn restore">
                                    Khôi phục
                                </a>
                            </c:otherwise>
                        </c:choose>
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

</div>
