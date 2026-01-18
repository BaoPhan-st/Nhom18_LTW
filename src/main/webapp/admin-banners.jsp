<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="admin-header">
    <h2>Quản lý banner</h2>
</div>

<!-- FORM -->
<div class="form-box">
    <form action="${pageContext.request.contextPath}/banner" method="post">
        <input type="hidden" name="id" value="${banner.id != null ? banner.id : ''}"/>

        <div class="form-group">
            <label>Tiêu đề</label>
            <input type="text" name="title" value="${banner.title != null ? banner.title : ''}" required/>
        </div>

        <div class="form-group">
            <label>Link</label>
            <input type="text" name="link_url" value="${banner.link_url != null ? banner.link_url : ''}"
                   placeholder="Nhập URL liên kết"/>
        </div>

        <div class="form-group">
            <label>Ảnh</label>
            <input type="text" name="img_url" value="${banner.img_url != null ? banner.img_url : ''}"
                   placeholder="Nhập URL hình ảnh"/>
        </div>

        <div class="form-group">
            <label>Vị trí</label>
            <input type="text" name="position" value="${banner.position != null ? banner.position : ''}"
                   placeholder="Vị trí hiển thị"/>
        </div>

        <div class="form-group">
            <label>Thứ tự</label>
            <input type="number" name="sort_order" min="0"
                   value="${banner.sort_order != null ? banner.sort_order : 0}"/>
        </div>

        <div class="form-group">
            <label>Active</label>
            <select name="is_active">
                <option value="true" <c:if test="${banner.is_active == true}">selected</c:if>>Active</option>
                <option value="false" <c:if test="${banner.is_active == false}">selected</c:if>>Inactive</option>
            </select>
        </div>

        <div class="form-group">
            <label>Ngày bắt đầu</label>
            <c:choose>
                <c:when test="${banner.start_date != null}">
                    <input type="datetime-local" name="start_date"
                           value="<fmt:formatDate value='${banner.start_date}' pattern='yyyy-MM-dd\'T\'HH:mm'/>"/>
                </c:when>
                <c:otherwise>
                    <input type="datetime-local" name="start_date"/>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-group">
            <label>Ngày kết thúc</label>
            <c:choose>
                <c:when test="${banner.end_date != null}">
                    <input type="datetime-local" name="end_date"
                           value="<fmt:formatDate value='${banner.end_date}' pattern='yyyy-MM-dd\'T\'HH:mm'/>"/>
                </c:when>
                <c:otherwise>
                    <input type="datetime-local" name="end_date"/>
                </c:otherwise>
            </c:choose>
        </div>

        <button type="submit" class="btn-submit">
            <c:choose>
                <c:when test="${banner.id == null}">Thêm mới</c:when>
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
                <td>
                    <img src="${b.img_url}" alt="Banner" style="width:100px;"
                         onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'"/>
                </td>
                <td>${b.link_url}</td>
                <td>${b.position}</td>
                <td>${b.sort_order}</td>
                <td><c:choose>
                    <c:when test="${b.is_active}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose></td>
                <td><c:if test="${b.start_date != null}"><fmt:formatDate value="${b.start_date}"
                                                                         pattern="dd/MM/yyyy HH:mm"/></c:if></td>
                <td><c:if test="${b.end_date != null}"><fmt:formatDate value="${b.end_date}"
                                                                       pattern="dd/MM/yyyy HH:mm"/></c:if></td>
                <td class="actions">
                    <a href="${pageContext.request.contextPath}/banner?edit=${b.id}" class="btn edit">Sửa</a>
                    <a href="${pageContext.request.contextPath}/banner?delete=${b.id}" class="btn delete"
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
