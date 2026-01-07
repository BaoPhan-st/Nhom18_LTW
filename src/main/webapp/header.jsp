<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.user.User" %>
<% User currentUser = (User) session.getAttribute("currentUser"); %>

<header class="header">
    <div class="container">
        <div class="overlay"></div>

        <a href="${pageContext.request.contextPath}/menu.jsp" class="logo">
            <img
                    src="./assets/images/BHD%20LOGO.png"
                    width="100"
                    height="50"
                    alt="BHD logo"
            />
        </a>

        <button class="nav-open-btn">
            <ion-icon name="menu-outline"></ion-icon>
        </button>

        <nav class="navbar">
            <button class="nav-close-btn" data-nav-close-btn aria-label="Close Menu">
                <ion-icon name="close-outline"></ion-icon>
            </button>

            <ul class="navbar-list">
                <li class="navbar-item">
                    <a href="${pageContext.request.contextPath}/menu.jsp" class="navbar-link">Trang chủ</a>
                </li>
                <li class="navbar-item">
                    <a href="${pageContext.request.contextPath}/gioithieu.jsp" class="navbar-link">Giới thiệu</a>
                </li>
                <li class="navbar-item">
                    <a href="${pageContext.request.contextPath}/products.jsp" class="navbar-link">Sản phẩm</a>
                </li>
                <li class="navbar-item">
                    <a href="${pageContext.request.contextPath}/lienhe.jsp" class="navbar-link">Liên hệ</a>
                </li>
            </ul>

            <ul class="nav-action-list">
                <li>
                    <button class="nav-action-btn" id="searchToggleBtn" data-search-btn>
                        <ion-icon name="search-outline"></ion-icon>
                        <span class="nav-action-text">Tìm kiếm</span>
                    </button>
                </li>

                <li class="nav-action-item nav-action-dropdown">
                    <% if (currentUser == null) { %>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="nav-action-btn">
                        <ion-icon name="person-outline"></ion-icon>
                        <span class="nav-action-text">Đăng nhập / Đăng kí</span>
                    </a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                        <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
                    </div>
                    <% } else { %>
                    <a href="#" class="nav-action-btn">
                        <ion-icon name="person-outline"></ion-icon>
                        <span class="nav-action-text">
                            <%= currentUser.getFullName() != null ? currentUser.getFullName() : currentUser.getEmail() %>
                        </span>
                    </a>
                    <div class="dropdown-content">
                        <a href="account">Tài khoản của tôi</a>
                        <a href="logout">Đăng xuất</a>
                    </div>
                    <% } %>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/wishlist.jsp" class="nav-action-btn">
                        <ion-icon name="heart-outline"></ion-icon>
                        <span class="nav-action-text">Yêu thích</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/carts.jsp" class="nav-action-btn" title="Giỏ hàng">
                        <ion-icon name="bag-outline"></ion-icon>
                        <span class="nav-action-text">Giỏ hàng</span>
                    </a>
                </li>
            </ul>

            <form class="search-form" id="search-form" action="#" method="get">
                <input type="search" name="query" placeholder="Tìm kiếm sản phẩm..." id="search-input" required />
                <button type="button" class="search-close-btn" id="searchCloseBtn">
                    <ion-icon name="close-outline"></ion-icon>
                </button>
            </form>
        </nav>
    </div>
</header>