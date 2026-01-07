<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="model.user.User" %> <% User user = (User) request.getAttribute("user"); if
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />

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
    <jsp:include page="header.jsp" />
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
    <jsp:include page="footer.jsp" />

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

    <script src="${pageContext.request.contextPath}/assets/script/reponsive.js"></script>
    <script src="${pageContext.request.contextPath}/assets/script/pageaccount.js"></script>
  </body>
</html>
