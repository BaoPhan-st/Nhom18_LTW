<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div class="admin-header">
            <h2>Quản lý bộ sưu tập</h2>
        </div>

        <!-- ================= FORM ================= -->
        <div class="form-box">
            <h3>
                ${collection.id > 0 ? 'Sửa bộ sưu tập' : 'Thêm bộ sưu tập mới'}
            </h3>
            <form action="${pageContext.request.contextPath}/admin/collections" method="post">
                <input type="hidden" name="id" value="${collection.id}">

                <div class="form-group">
                    <label>Tên bộ sưu tập</label>
                    <input type="text" name="name" value="${collection.name}" required>
                </div>

                <div class="form-group">
                    <label>Slug (URL)</label>
                    <input type="text" name="slug" value="${collection.slug}" required>
                </div>

                <div class="form-group">
                    <label>Loại (RuleSet)</label>
                    <select name="ruleSet">
                        <option value="MANUAL" ${collection.ruleSetType=='MANUAL' ? 'selected' : '' }>Manual</option>
                        <option value="AUTO" ${collection.ruleSetType=='AUTO' ? 'selected' : '' }>Automatic</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Trạng thái</label>
                    <select name="active">
                        <option value="true" ${collection.active ? 'selected' : '' }>Hoạt động</option>
                        <option value="false" ${!collection.active ? 'selected' : '' }>Tạm ẩn</option>
                        <!-- Note: Controller checks parameter presence for boolean, so value='true' is safer with checkbox logic,
                     but select is easier for UI. Controller: request.getParameter("active") != null.
                     Ah, wait. Code: `boolean active = request.getParameter("active") != null;`
                     This logic implies a checkbox behavior.
                     If I use <select>, I should change Controller logic OR update this to checkbox.
                     Actually, standard practice for Select is sending value="true"/"false".
                     Controller '!= null' means if I send "false" string, it is NOT null, so it becomes TRUE!
                     Fix Controller logic? Or stick to checkbox?
                     Let's use a Checkbox for is_active to match Controller logic?
                     Controller: boolean active = request.getParameter("active") != null;
                     If I uncheck a checkbox, param is null -> active=false. Correct.
                     If I check, param is "on" (not null) -> active=true. Correct.
                -->
                    </select>
                    <!-- Wait, I cannot easily change Controller in this step. I just edited Controller.
                  Review Controller change: `boolean active = request.getParameter("active") != null;`
                  Yes, that expects a checkbox.
                  Let's Use Checkbox.
             -->
                    <div style="margin-top: 10px;">
                        <input type="checkbox" name="active" id="chkActive" style="width: auto; margin-right: 10px;"
                            ${collection.active ? 'checked' : '' }>
                        <label for="chkActive" style="display:inline;">Hiển thị trên web</label>
                    </div>
                </div>

                <button type="submit" class="btn-submit">
                    ${collection.id > 0 ? 'Cập nhật' : 'Thêm mới'}
                </button>
                <c:if test="${collection.id > 0}">
                    <a href="${pageContext.request.contextPath}/admin/collections" class="btn-reset"
                        style="margin-left: 10px; text-decoration: none; color: #666;">Hủy bỏ</a>
                </c:if>
            </form>
        </div>

        <!-- ================= TABLE ================= -->
        <div class="section">

            <!-- FILTER -->
            <div class="filter-bar">
                <form method="get" action="${pageContext.request.contextPath}/admin/collections">

                    <input type="text" name="name" value="${param.name}" placeholder="Tên bộ sưu tập" />

                    <select name="ruleSet">
                        <option value="">-- RuleSet --</option>
                        <option value="MANUAL" <c:if test="${param.ruleSet == 'MANUAL'}">selected</c:if>>Manual</option>
                        <option value="AUTO" <c:if test="${param.ruleSet == 'AUTO'}">selected</c:if>>Automatic</option>
                    </select>

                    <button type="submit" class="btn-submit" style="padding: 8px 15px; margin:0;">
                        <i class="fa fa-search"></i> Tìm
                    </button>

                    <a href="${pageContext.request.contextPath}/admin/collections" class="btn-reset"
                        style="margin-left: 10px;">Reset</a>
                </form>
            </div>

            <div class="table-wrapper">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Slug</th>
                            <th>RuleSet</th>
                            <th>Trạng thái</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="c" items="${collections}">
                            <tr>
                                <td>${c.id}</td>
                                <td>${c.name}</td>
                                <td>${c.slug}</td>
                                <td>${c.ruleSetType}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${c.active}">
                                            <span class="status COMPLETED">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status PENDING">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="actions">
                                    <a href="${pageContext.request.contextPath}/admin/collections?edit=${c.id}"
                                        class="btn edit">Sửa</a>

                                    <form action="${pageContext.request.contextPath}/admin/collections" method="post"
                                        style="display:inline;" onsubmit="return confirm('Xóa bộ sưu tập này?');">
                                        <input type="hidden" name="deleteId" value="${c.id}">
                                        <button type="submit" class="btn delete">Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty collections}">
                            <tr>
                                <td colspan="5" class="empty">
                                    Không có bộ sưu tập nào
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>