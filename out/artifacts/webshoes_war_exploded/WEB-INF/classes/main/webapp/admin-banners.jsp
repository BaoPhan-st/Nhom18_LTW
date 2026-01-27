<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="admin-header">
    <h2>Quản lý banner</h2>
</div>

<!-- ================= FORM ================= -->
<div class="form-box">
    <form action="${pageContext.request.contextPath}/admin/banners" method="post">
        <input type="hidden" name="id" value="${banner.id}"/>

        <div class="form-group">
            <label>Tiêu đề</label>
            <input type="text" name="title" value="${banner.title}" required/>
        </div>

        <div class="form-group">
            <label>Link</label>
            <input type="text" name="linkUrl" value="${banner.linkUrl}"
                   placeholder="Nhập URL liên kết"/>
        </div>

        <div class="form-group">
            <label>Ảnh</label>
            <input type="text" name="imgUrl" value="${banner.imgUrl}"
                   placeholder="Nhập URL hình ảnh"/>
        </div>

        <div class="form-group">
            <label>Vị trí</label>
            <input type="text" name="position" value="${banner.position}"
                   placeholder="Vị trí hiển thị"/>
        </div>

        <div class="form-group">
            <label>Thứ tự</label>
            <input type="number" name="sortOrder" min="0"
                   value="${banner.sortOrder}"/>
        </div>

        <div class="form-group">
            <label>Trạng thái</label>
            <select name="active">
                <option value="true"
                        <c:if test="${empty banner || banner.active}">selected</c:if>>
                    Active
                </option>
                <option value="false"
                        <c:if test="${not empty banner && !banner.active}">selected</c:if>>
                    Inactive
                </option>
            </select>
        </div>

        <div class="form-group">
            <label>Ngày bắt đầu</label>
            <input type="datetime-local" name="startDate"
                   value="${banner.startDateInput}"/>
        </div>

        <div class="form-group">
            <label>Ngày kết thúc</label>
            <input type="datetime-local" name="endDate"
                   value="${banner.endDateInput}"/>
        </div>

        <button type="submit" class="btn-submit">
            <c:choose>
                <c:when test="${empty banner.id || banner.id == 0}">
                    Thêm mới
                </c:when>
                <c:otherwise>
                    Cập nhật
                </c:otherwise>
            </c:choose>
        </button>
    </form>
</div>

<!-- ================= TABLE ================= -->
<div class="section">

    <!-- FILTER -->
    <div class="table-toolbar">
        <input type="text" data-filter="0" placeholder="ID">
        <input type="text" data-filter="1" placeholder="Tiêu đề">
        <input type="text" data-filter="4" placeholder="Vị trí">

        <select data-filter="6">
            <option value="">-- Trạng thái --</option>
            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>
        </select>

        <button type="button" class="btn-search">Tìm</button>
        <button type="button" class="btn-reset">Reset</button>
    </div>

    <div class="table-wrapper">
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
                        <img src="${b.imgUrl}" alt="Banner" style="width:100px"
                             onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'"/>
                    </td>
                    <td>${b.linkUrl}</td>
                    <td>${b.position}</td>
                    <td>${b.sortOrder}</td>

                    <!-- ⭐ QUAN TRỌNG: filter theo text -->
                    <td>${b.active ? "Active" : "Inactive"}</td>

                    <td>${b.startDateInput}</td>
                    <td>${b.endDateInput}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/admin/banners?edit=${b.id}"
                           class="btn edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/banners?delete=${b.id}"
                           class="btn delete"
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
