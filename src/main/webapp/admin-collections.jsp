<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="admin-header">
    <h2>Quản lý bộ sưu tập</h2>
</div>

<!-- ================= TABLE ================= -->
<div class="section">

    <!-- FILTER -->
    <form method="get"
          action="${pageContext.request.contextPath}/admin/collections"
          class="table-toolbar">

        <input type="text"
               name="name"
               value="${param.name}"
               placeholder="Tên bộ sưu tập"/>

        <select name="ruleSet">
            <option value="">-- RuleSet --</option>
            <option value="manual"
                    <c:if test="${param.ruleSet == 'manual'}">selected</c:if>>
                Manual
            </option>
            <option value="automatic"
                    <c:if test="${param.ruleSet == 'automatic'}">selected</c:if>>
                Automatic
            </option>
        </select>

        <button type="submit" class="btn-search">Tìm</button>

        <a href="${pageContext.request.contextPath}/admin/collections"
           class="btn-reset">Reset</a>
    </form>

    <div class="table-wrapper">
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Slug</th>
                <th>RuleSet</th>
                <th>Trạng thái</th>
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
                            <c:when test="${c.active}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
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
