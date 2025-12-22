<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="assets/css/admin.css" />

    <!-- Font Awesome để dùng icon -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
  </head>

  <body>
    <div class="sidebar">
      <div class="admin-avatar">
        <div class="admin-icon">BHD</div>
        <span class="admin-name">Admin</span>
      </div>

      <ul class="menu">
        <li class="active" data-section="dashboard"><a>Dashboard</a></li>
        <li data-section="accounts"><a>Quản lý tài khoản</a></li>
        <li data-section="products"><a>Quản lý sản phẩm</a></li>
        <li data-section="variants"><a>Quản lý biến thể</a></li>
        <li data-section="collections"><a>Bộ sưu tập</a></li>
        <li data-section="banners"><a>Banner</a></li>
        <li data-section="newsletter"><a>Đăng ký nhận tin</a></li>
        <li data-section="wishlist"><a>Yêu thích</a></li>
        <li data-section="orders"><a>Đơn hàng</a></li>
        <li data-section="carts"><a>Giỏ hàng</a></li>
        <li data-section="statistics"><a>Thống kê</a></li>
        <li data-section="logout"><a>Đăng xuất</a></li>
      </ul>
    </div>

    <div class="main">
      <!-- DASHBOARD -->
      <section id="dashboard" class="active-section">
        <div class="admin-header"><h2>Dashboard</h2></div>
        <div class="cards-manager">
          <div class="card-order-today">
            <h3>Đơn hàng hôm nay</h3>
            <data>0</data>
          </div>
          <div class="card-revenue">
            <h3>Doanh thu hôm nay</h3>
            <data>0</data>
          </div>
          <div class="card-customer">
            <h3>Khách hàng mới</h3>
            <data>0</data>
          </div>
          <div class="card-inventory">
            <h3>Sản phẩm tồn kho</h3>
            <data>0</data>
          </div>
        </div>

        <h3>Đơn hàng gần đây</h3>
        <div class="table-wrapper">
          <table>
            <thead>
              <tr>
                <th>Mã đơn</th>
                <th>Khách hàng</th>
                <th>Sản phẩm</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>
        </div>
      </section>

      <!-- ACCOUNTS -->
      <section id="accounts">
        <div class="admin-header"><h2>Quản lý tài khoản</h2></div>

        <form class="form-add">
          <label>ID:</label><input id="id" />
          <label>Email:</label><input id="email"/>
          <label>Password:</label><input id="password"/>
          <label>SĐT:</label><input id="sdt"/>

          <!-- Nút hành động -->
          <div class="action-buttons">
            <button type="button" class="btn-add">
              <i class="fa fa-plus"></i> Thêm
            </button>
            <button type="button" class="btn-edit">
              <i class="fa fa-pen-to-square"></i> Sửa
            </button>
            <button type="button" class="btn-delete">
              <i class="fa fa-trash"></i> Xóa
            </button>
          </div>
        </form>

        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Email</th>
              <th>HashPW</th>
              <th>SĐT</th>
              <th>Địa chỉ</th>
              <th>Vai trò</th>
              <th>Họ tên</th>
              <th>Trạng thái</th>
              <th>Ngày tạo</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </section>

      <!-- PRODUCTS -->
      <section id="products">
        <div class="admin-header"><h2>Quản lý sản phẩm</h2></div>

        <form class="form-add">
          <label>Mã SP:</label><input id="maSP"/>
          <label>Tên sản phẩm:</label><input id="name"/>
          <label>Mô tả:</label>
          <textarea id="description"></textarea>

          <div class="action-buttons">
            <button type="button" class="btn-add">
              <i class="fa fa-plus"></i> Thêm
            </button>
            <button type="button" class="btn-edit">
              <i class="fa fa-pen-to-square"></i> Sửa
            </button>
            <button type="button" class="btn-delete">
              <i class="fa fa-trash"></i> Xóa
            </button>
          </div>
        </form>

        <table>
          <thead>
            <tr>
              <th>Mã</th>
              <th>Tên</th>
              <th>Mô tả</th>
              <th>Giá</th>
              <th>ID Brand</th>
              <th>Ngày thêm</th>
              <th>Hạn</th>
              <th>Khả dụng</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </section>

      <!-- VARIANTS -->
      <section id="variants">
        <div class="admin-header"><h2>Quản lý biến thể</h2></div>

        <form class="form-add">
          <label>ID SP:</label><input id="id-product"/>
          <label>Size:</label><input id="size"/>
          <label>Màu:</label><input id="color"/>

          <div class="action-buttons">
            <button type="button" class="btn-add">
              <i class="fa fa-plus"></i> Thêm
            </button>
            <button type="button" class="btn-edit">
              <i class="fa fa-pen-to-square"></i> Sửa
            </button>
            <button type="button" class="btn-delete">
              <i class="fa fa-trash"></i> Xóa
            </button>
          </div>
        </form>

        <table>
          <thead>
            <tr>
              <th>ID SP</th>
              <th>Size</th>
              <th>Màu</th>
              <th>Stock</th>
              <th>Trạng thái</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </section>

      <!-- BANNERS -->
      <section id="banners">
        <div class="admin-header"><h2>Banner</h2></div>

        <form class="form-add">
          <label>ID:</label><input id="id"/>
          <label>Title:</label><input id="title"/>
          <label>Link:</label><input id="link"/>

          <div class="action-buttons">
            <button type="button" class="btn-add">
              <i class="fa fa-plus"></i> Thêm
            </button>
            <button type="button" class="btn-edit">
              <i class="fa fa-pen-to-square"></i> Sửa
            </button>
            <button type="button" class="btn-delete">
              <i class="fa fa-trash"></i> Xóa
            </button>
          </div>
        </form>

        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Title</th>
              <th>Img</th>
              <th>Link</th>
              <th>Type</th>
              <th>ID Entity</th>
              <th>Pos</th>
              <th>Sort</th>
              <th>Status</th>
              <th>Start</th>
              <th>End</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </section>

      <!-- OTHER SECTIONS (newsletter, wishlist, orders, carts, statistics) giữ nguyên như bạn có -->
    </div>

    <!-- POPUP XÁC NHẬN XÓA -->
    <div class="confirm-popup" id="confirmPopup">
      <div class="confirm-box">
        <h3>Bạn có chắc muốn xóa?</h3>
        <button class="btn-confirm" id="confirmDelete">Xóa</button>
        <button class="btn-cancel" id="cancelDelete">Hủy</button>
      </div>
    </div>

    <!-- JS CHUYỂN TRANG + XÓA -->
    <script>
      document.addEventListener("DOMContentLoaded", () => {
        // reload section
        const menuItems = document.querySelectorAll(".menu li");
        const sections = document.querySelectorAll("section");

        let activeSectionID = localStorage.getItem("activeSection");

        sections.forEach(sec => sec.classList.toggle("active-section", sec.id === activeSectionID));
        menuItems.forEach(item => item.classList.toggle("active", item.getAttribute("data-section") === activeSectionID));

        menuItems.forEach(item => {
          item.addEventListener("click", () => {
            const target = item.getAttribute("data-section");

            sections.forEach(sec => sec.classList.toggle("active-section", sec.id === target));
            menuItems.forEach(i => i.classList.remove("active"));
            item.classList.add("active");

            localStorage.setItem("activeSection", target);
          });
        });

        // Popup Xóa
        const deleteButtons = document.querySelectorAll(".btn-delete");
        const popup = document.getElementById("confirmPopup");
        const confirmDelete = document.getElementById("confirmDelete");
        const cancelDelete = document.getElementById("cancelDelete");

        let deleteTarget = null;

        deleteButtons.forEach((btn) => {
          btn.addEventListener("click", () => {
            deleteTarget = btn;
            popup.style.display = "flex";
          });
        });

        cancelDelete.addEventListener(
          "click",
          () => (popup.style.display = "none")
        );

        confirmDelete.addEventListener("click", () => {
          popup.style.display = "none";
          alert("Đã xóa thành công!");
        });
      });
    </script>
  </body>
</html>
