<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    // Xử lý khi admin bấm "Có"
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String confirm = request.getParameter("confirm");
        if ("yes-logout".equals(confirm)) {
            if (session != null) {
                session.invalidate(); // Xóa session admin
            }
            response.sendRedirect("login.jsp"); // Chuyển về trang login
            return; // Dừng tiếp tục render page
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng xuất Admin</title>
    <style>
        .h2-logout,
        .button-container-logout {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 50px;
        }

        .btn-logout {
            padding: 10px 25px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }

        .btn-logout btn-yes {
            background-color: #d9534f;
            color: white;
        }

        .btn-logout btn-no {
            background-color: #5bc0de;
            color: white;
        }
    </style>
</head>
<body>

<div class="form">
    <h2 class="h2-logout">Bạn có muốn thoát trang admin không?</h2>
    <div class="button-container-logout">
        <form method="post" action="logout.jsp">
            <input type="hidden" name="confirm" value="yes-logout">
            <button type="submit" class="btn-logout btn-yes">Có</button>
        </form>
        <form action="Admin.jsp">
            <button type="submit" class="btn-logout btn-no">Không</button>
        </form>
    </div>
</div>

</body>
</html>
