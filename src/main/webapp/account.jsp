<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="model.User" %> <% User user = (User) request.getAttribute("user"); if
(user == null) { response.sendRedirect("login.jsp"); return; } %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BHD - SPORT SHOES</title>

    <!--
    - favicon
  -->
    <link rel="icon" href="/Nhom18_LTW/assets/favicon_io/favicon.ico" />

    <!--
    -  css link
  -->
    <link rel="stylesheet" href="./assets/css/style.css" />

    <!--
    - google font link
  -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
  </head>

  <body id="top">
    <!--
- #HEADER
-->
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

        <!-- Nút mở menu -->
        <button class="nav-open-btn">
          <ion-icon name="menu-outline"></ion-icon>
        </button>

        <nav class="navbar">
          <button
            class="nav-close-btn"
            data-nav-close-btn
            aria-label="Close Menu"
          >
            <ion-icon name="close-outline"></ion-icon>
          </button>

          <ul class="navbar-list">
            <li class="navbar-item">
              <a
                href="${pageContext.request.contextPath}/menu.jsp"
                class="navbar-link"
                >Trang chủ</a
              >
            </li>

            <li class="navbar-item">
              <a
                href="${pageContext.request.contextPath}/gioithieu.jsp"
                class="navbar-link"
                >Giới thiệu</a
              >
            </li>

            <li class="navbar-item">
              <a
                href="${pageContext.request.contextPath}/products.jsp"
                class="navbar-link"
                >Sản phẩm</a
              >
            </li>

            <li class="navbar-item">
              <a
                href="${pageContext.request.contextPath}/lienhe.jsp"
                class="navbar-link"
                >Liên hệ</a
              >
            </li>
          </ul>

          <ul class="nav-action-list">
            <li>
              <button
                class="nav-action-btn"
                id="searchToggleBtn"
                data-search-btn
              >
                <ion-icon name="search-outline"></ion-icon>
                <span class="nav-action-text">Tìm kiếm</span>
              </button>
            </li>

            <li class="nav-action-item nav-action-dropdown">
              <a
                href="${pageContext.request.contextPath}/login.jsp"
                class="nav-action-btn"
              >
                <ion-icon name="person-outline"></ion-icon>
                <span class="nav-action-text">Đăng nhập / Đăng kí</span>
              </a>

              <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/login.jsp"
                  >Đăng nhập</a
                >
                <a href="${pageContext.request.contextPath}/register.jsp"
                  >Đăng ký</a
                >
              </div>
            </li>

            <li>
              <a
                href="${pageContext.request.contextPath}/wishlist.jsp"
                class="nav-action-btn"
              >
                <ion-icon name="heart-outline"></ion-icon>
                <span class="nav-action-text">Yêu thích</span>
              </a>
            </li>
            <li>
              <a
                href="${pageContext.request.contextPath}/carts.jsp"
                class="nav-action-btn"
                title="Giỏ hàng"
              >
                <ion-icon name="bag-outline"></ion-icon>
                <span class="nav-action-text">Giỏ hàng</span>
              </a>
            </li>
          </ul>
          <form class="search-form" id="search-form" action="#" method="get">
            <input
              type="search"
              name="query"
              placeholder="Tìm kiếm sản phẩm..."
              id="search-input"
              required
            />

            <button type="button" class="search-close-btn" id="searchCloseBtn">
              <ion-icon name="close-outline"></ion-icon>
            </button>
          </form>
        </nav>
      </div>
    </header>
    <main class="TaiKhoanPage">
      <div class="container account-dashboard">
        <h1 class="h2 page-title">Tài Khoản Của Tôi</h1>

        <div class="account-layout">
          <aside class="account-sidebar">
            <div class="user-info-summary">
              <p class="user-name-display">
                Xin chào, **<%= user.getFullName() != null ? user.getFullName()
                : user.getEmail() %>**
              </p>
            </div>

            <ul class="account-nav-list">
              <li class="active">
                <a href="#personal-info" data-tab="info"
                  ><ion-icon name="person-circle-outline"></ion-icon> Thông tin
                  cá nhân</a
                >
              </li>
              <li>
                <a href="#change-password" data-tab="password"
                  ><ion-icon name="lock-closed-outline"></ion-icon> Đổi mật
                  khẩu</a
                >
              </li>
              <li>
                <a href="#address-book" data-tab="address"
                  ><ion-icon name="map-outline"></ion-icon> Sổ địa chỉ</a
                >
              </li>
              <li>
                <a href="#order-history" data-tab="orders"
                  ><ion-icon name="time-outline"></ion-icon> Lịch sử đơn hàng</a
                >
              </li>
              <li>
                <a href="#"
                  ><ion-icon name="log-out-outline"></ion-icon> Đăng xuất</a
                >
              </li>
            </ul>
          </aside>

          <div class="account-content">
            <section
              id="personal-info"
              class="tab-content active"
              data-content="info"
            >
              <h3 class="h3 content-title">Thông Tin Cá Nhân</h3>
              <p>Quản lý tên, email và số điện thoại của bạn.</p>

              <form class="account-form" method="post" action="account">
                <div class="input-group">
                  <label for="full-name">Họ và Tên</label>
                  <input type="text" id="full-name" name="fullName" value="<%=
                  user.getFullName() != null ? user.getFullName() : "" %>"
                  required />
                </div>

                <div class="input-group">
                  <label for="email">Địa chỉ Email</label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    value="<%= user.getEmail() %>"
                    readonly
                    required
                  />
                </div>

                <div class="input-group">
                  <label for="phone">Số điện thoại</label>
                  <input type="tel" id="phone" name="phoneNumber" value="<%=
                  user.getPhoneNumber() != null ? user.getPhoneNumber() : "" %>"
                  required />
                </div>

                <div class="input-group">
                  <label for="address">Địa chỉ</label>
                  <input type="text" id="address" name="address" value="<%=
                  user.getAddress() != null ? user.getAddress() : "" %>" />
                </div>

                <button type="submit" class="btn btn-primary btn-save">
                  Cập Nhật Thông Tin
                </button>
              </form>
            </section>

            <section
              id="change-password"
              class="tab-content"
              data-content="password"
            >
              <h3 class="h3 content-title">Đổi Mật Khẩu</h3>
              <p>Đặt mật khẩu mới để tăng cường bảo mật tài khoản.</p>

              <form class="account-form">
                <div class="input-group">
                  <label for="current-password">Mật khẩu hiện tại</label>
                  <input type="password" id="current-password" required />
                </div>

                <div class="input-group">
                  <label for="new-password">Mật khẩu mới</label>
                  <input type="password" id="new-password" required />
                </div>

                <div class="input-group">
                  <label for="confirm-password">Xác nhận mật khẩu mới</label>
                  <input type="password" id="confirm-password" required />
                </div>

                <button type="submit" class="btn btn-primary btn-save">
                  Đổi Mật Khẩu
                </button>
              </form>
            </section>

            <section
              id="address-book"
              class="tab-content"
              data-content="address"
            >
              <h3 class="h3 content-title">Sổ Địa Chỉ Giao Hàng</h3>
              <p>Thêm và quản lý các địa chỉ nhận hàng của bạn.</p>

              <div class="address-item">
                <p class="address-label"><strong>Địa chỉ Mặc định:</strong></p>
                <p>
                  <%= user.getFullName() != null ? user.getFullName() : "" %> -
                  <%= user.getPhoneNumber() != null ? user.getPhoneNumber() : ""
                  %>
                </p>
                <p><%= user.getAddress() != null ? user.getAddress() : "" %></p>
                <div class="address-actions">
                  <button class="btn-link edit-btn">Chỉnh sửa</button>
                </div>
              </div>

              <button class="btn-secondary btn-add-address">
                Thêm Địa Chỉ Mới
              </button>
            </section>

            <section
              id="order-history"
              class="tab-content"
              data-content="orders"
            >
              <h3 class="h3 content-title">Lịch Sử Đơn Hàng</h3>
              <p>Xem lại các đơn hàng đã đặt tại BHD - SPORT SHOES.</p>

              <table class="order-table">
                <thead>
                  <tr>
                    <th>Mã Đơn</th>
                    <th>Ngày Đặt</th>
                    <th>Tổng Cộng</th>
                    <th>Trạng Thái</th>
                    <th>Chi tiết</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>#BHD-1001</td>
                    <td>01/11/2025</td>
                    <td>1.550.000₫</td>
                    <td class="status-delivered">Đã giao</td>
                    <td>
                      <a
                        href="${pageContext.request.contextPath}/checkout.jsp"
                        class="btn-link"
                        >Xem</a
                      >
                    </td>
                  </tr>
                </tbody>
              </table>
            </section>
          </div>
        </div>
      </div>
      <div class="modal" id="addressModal">
        <div class="modal-content">
          <span class="close-btn">&times;</span>
          <h3 class="h3 modal-title">Thêm/Chỉnh Sửa Địa Chỉ</h3>

          <form class="address-modal-form">
            <div class="input-group">
              <label for="modal-fullname">Họ và Tên</label>
              <input type="text" id="modal-fullname" required />
            </div>
            <div class="input-group">
              <label for="modal-phone">Số điện thoại</label>
              <input type="tel" id="modal-phone" required />
            </div>
            <div class="input-group">
              <label for="modal-province">Tỉnh/Thành phố</label>
              <input type="text" id="modal-province" required />
            </div>
            <div class="input-group">
              <label for="modal-district">Quận/Huyện</label>
              <input type="text" id="modal-district" required />
            </div>
            <div class="input-group">
              <label for="modal-ward">Phường/Xã</label>
              <input type="text" id="modal-ward" required />
            </div>
            <div class="input-group">
              <label for="modal-detail"
                >Địa chỉ chi tiết (Số nhà, Tên đường)</label
              >
              <input type="text" id="modal-detail" required />
            </div>

            <button type="submit" class="btn btn-primary btn-save-address">
              Lưu Địa Chỉ
            </button>
          </form>
        </div>
      </div>
    </main>
    <!--
- #FOOTER
-->
    <footer class="footer">
      <div class="footer-top section">
        <div class="container">
          <div class="footer-brand">
            <a href="#" class="logo">
              <img
                src="./assets/images/BHD%20LOGO.png"
                width="110"
                height="50"
                alt="BHD"
              />
            </a>

            <ul class="social-list">
              <li>
                <a
                  href="https://www.facebook.com/kcntt.nlu"
                  class="social-link"
                >
                  <ion-icon name="logo-facebook"></ion-icon>
                </a>
              </li>

              <li>
                <a
                  href="https://www.youtube.com/@NongLamUniversity/videos"
                  class="social-link"
                >
                  <ion-icon name="logo-youtube"></ion-icon>
                </a>
              </li>

              <li>
                <a
                  href="https://www.tiktok.com/@nonglam.university"
                  class="social-link"
                >
                  <ion-icon name="logo-tiktok"></ion-icon>
                </a>
              </li>

              <li>
                <a
                  href="https://www.instagram.com/daihocnonglamtphcm.hcmuaf1955/"
                  class="social-link"
                >
                  <ion-icon name="logo-instagram"></ion-icon>
                </a>
              </li>
            </ul>
          </div>

          <div class="footer-link-box">
            <ul class="footer-list">
              <li>
                <p class="footer-list-title">Thông tin liên hệ</p>
              </li>

              <li>
                <address class="footer-link">
                  <ion-icon name="location"></ion-icon>

                  <span class="footer-link-text">
                    Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh
                  </span>
                </address>
              </li>

              <li>
                <a href="#" class="footer-link">
                  <ion-icon name="call"></ion-icon>

                  <span class="footer-link-text">0332536387</span>
                </a>
              </li>

              <li>
                <a href="#" class="footer-link">
                  <ion-icon name="mail"></ion-icon>

                  <span class="footer-link-text">BHDsport@gmail.com</span>
                </a>
              </li>
            </ul>

            <ul class="footer-list">
              <li>
                <p class="footer-list-title">Tài khoản</p>
              </li>

              <li>
                <a href="Account.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Tài khoản</span>
                </a>
              </li>

              <li>
                <a
                  href="${pageContext.request.contextPath}/carts.jsp"
                  class="footer-link"
                >
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Xem giỏ hàng</span>
                </a>
              </li>

              <li>
                <a
                  href="${pageContext.request.contextPath}/wishlist.jsp"
                  class="footer-link"
                >
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Yêu thích</span>
                </a>
              </li>
            </ul>
            <ul class="footer-list">
              <li>
                <p class="footer-list-title">Chính sách</p>
              </li>

              <li>
                <a
                  href="${pageContext.request.contextPath}/ChinhSachBaoMat.jsp"
                  class="footer-link"
                >
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Chính sách bảo mật</span>
                </a>
              </li>

              <li>
                <a
                  href="${pageContext.request.contextPath}/ChinhSachBaoHanh.jsp"
                  class="footer-link"
                >
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Chính sách bảo hành</span>
                </a>
              </li>

              <li>
                <a
                  href="${pageContext.request.contextPath}/huongdanmuahang.jsp"
                  class="footer-link"
                >
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Hướng dẫn mua hàng</span>
                </a>
              </li>
              <li>
                <a
                  href="${pageContext.request.contextPath}/faq.jsp"
                  class="footer-link"
                >
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">FAQs</span>
                </a>
              </li>
            </ul>
            <div class="footer-list">
              <p class="footer-list-title">Đăng kí nhận tin</p>
              <form
                id="newsletter-form"
                action=""
                class="newsletter-form"
                method="POST"
              >
                <input
                  type="email"
                  name="email"
                  required
                  placeholder="Email"
                  class="newsletter-input"
                />
                <button type="submit" class="btn btn-primary">
                  <span>Đăng Kí</span>
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="footer-bottom">
        <div class="container">
          <p class="copyright">
            &copy; 2025
            <a href="#" class="copyright-link">BHD-SPORT SHOES</a>.Cùng bạn
            chinh phục mọi hành trình
          </p>
        </div>
      </div>
    </footer>

    <!--
- ionicon link
-->
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const navLinks = document.querySelectorAll(".account-nav-list a");
        const tabContents = document.querySelectorAll(".tab-content");

        navLinks.forEach((link) => {
          link.addEventListener("click", function (e) {
            e.preventDefault();

            const targetTab = this.getAttribute("data-tab");

            navLinks.forEach((nav) =>
              nav.closest("li").classList.remove("active")
            );
            tabContents.forEach((content) =>
              content.classList.remove("active")
            );

            this.closest("li").classList.add("active");

            const activeContent = document.querySelector(
              `[data-content="${targetTab}"]`
            );
            if (activeContent) {
              activeContent.classList.add("active");
            }
          });
        });

        const modal = document.getElementById("addressModal");
        const closeBtn = modal.querySelector(".close-btn");
        const addAddressBtn = document.querySelector(".btn-add-address");
        const editBtns = document.querySelectorAll(".edit-btn");
        const removeBtns = document.querySelectorAll(".remove-btn");
        const modalTitle = modal.querySelector(".modal-title");
        const addressForm = modal.querySelector(".address-modal-form");
        const saveAddressBtn = modal.querySelector(".btn-save-address");

        function openAddressModal(isEdit = false) {
          modalTitle.textContent = isEdit
            ? "Chỉnh Sửa Địa Chỉ"
            : "Thêm Địa Chỉ Mới";
          addressForm.reset();
          modal.style.display = "block";
        }

        addAddressBtn.addEventListener("click", () => {
          openAddressModal(false);
        });

        editBtns.forEach((btn) => {
          btn.addEventListener("click", (e) => {
            e.preventDefault();
            openAddressModal(true);
          });
        });

        removeBtns.forEach((btn) => {
          btn.addEventListener("click", (e) => {
            e.preventDefault();
            confirm("Bạn có chắc chắn muốn xóa địa chỉ này không?");
          });
        });

        closeBtn.addEventListener("click", () => {
          modal.style.display = "none";
        });

        window.addEventListener("click", (event) => {
          if (event.target === modal) {
            modal.style.display = "none";
          }
        });

        addressForm.addEventListener("submit", (e) => {
          e.preventDefault();
          modal.style.display = "none";
        });
      });
    </script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const searchToggleBtn = document.getElementById("searchToggleBtn");
        const searchForm = document.getElementById("search-form");
        const searchInput = document.getElementById("search-input");

        if (searchToggleBtn && searchForm && searchInput) {
          function toggleSearch(e) {
            if (e) e.preventDefault();
            searchForm.classList.toggle("active");

            if (searchForm.classList.contains("active")) {
              searchInput.focus();
            } else {
              searchInput.value = "";
            }
          }

          function handleSearchAction(e) {
            toggleSearch(e);
          }

          searchToggleBtn.addEventListener("click", handleSearchAction);

          searchInput.addEventListener("keydown", function (e) {
            if (e.key === "Enter") {
              e.preventDefault();
              toggleSearch(e);
            }
          });
        }
      });
    </script>
    <script>
      const navOpenBtn = document.querySelector(".nav-open-btn");
      const navCloseBtn = document.querySelector(".nav-close-btn");
      const navbar = document.querySelector(".navbar");
      const overlay = document.querySelector(".overlay");

      navOpenBtn.addEventListener("click", () => {
        navbar.classList.add("active");
        overlay.classList.add("active");
      });

      navCloseBtn.addEventListener("click", () => {
        navbar.classList.remove("active");
        overlay.classList.remove("active");
      });

      overlay.addEventListener("click", () => {
        navbar.classList.remove("active");
        overlay.classList.remove("active");
      });
    </script>
  </body>
</html>
