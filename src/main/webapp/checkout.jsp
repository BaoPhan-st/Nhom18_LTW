<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang Đặt Hàng - Hoàn thiện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
      <!--
    - favicon
  -->
      <link rel="icon" href="/Nhom18_LTW/assets/favicon_io/favicon.ico" />
  </head>
  <body>
    <div class="checkout-container">
        <jsp:include page="header.jsp" />

      <div class="container">
        <div class="breadcrumb-container">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Trang Chủ</a></li>
              <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/carts.jsp">Giỏ hàng </a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">
                Thanh toán
              </li>
            </ol>
          </nav>
        </div>
      </div>
      <div class="checkout-main-content">
        <div class="checkout-left">
          <div class="info-payment-wrapper">
            <div class="info-column">
              <section class="shipping-info-section">
                <h2>Thông tin nhận hàng</h2>
                <a href="#" class="btn-login-logout">Đăng xuất</a>

                <form class="shipping-form">
                  <div class="form-group">
                    <label>Email</label>
                    <input type="text" value="" required />
                  </div>

                  <div class="form-group">
                    <label>Họ và tên</label>
                    <input type="text" value="" required />
                  </div>

                  <div class="form-group phone-group">
                    <label>Số điện thoại</label>
                    <div class="phone-input-wrapper">
                      <input
                        type="text"
                        value=""
                        required
                        class="phone-input"
                      />
                    </div>
                  </div>

                  <div class="form-group">
                    <label>Địa chỉ</label>
                    <input type="text" value="" required />
                  </div>

                  <div class="form-group">
                    <label>Tỉnh/thành</label>
                    <input type="text" value="" required />
                  </div>

                  <div class="form-group">
                    <label>Quận/huyện</label>
                    <input type="text" value="" required />
                  </div>

                  <div class="form-group textarea-group">
                    <label>Ghi chú (tùy chọn)</label>
                    <input type="text" value="" required />
                  </div>
                </form>
              </section>
            </div>

            <div class="shipping-payment-column">
              <section class="shipping-method-section">
                <h2>Vận chuyển</h2>

                <div class="info-pure-block">
                  <h3>Giao hàng toàn quốc</h3>
                  <p><strong>Phí vận chuyển:</strong> 50.000₫</p>
                  <p class="text-detail">
                    Thời gian giao hàng tiêu chuẩn là 3-5 ngày làm việc (có thể
                    thay đổi tùy khu vực và tình hình vận chuyển).
                  </p>
                </div>
              </section>

              <hr class="separator" />

              <section class="payment-method-section">
                <h2>Thanh toán</h2>

                <div class="info-pure-block">
                  <h3>Ship COD</h3>
                  <p>
                    <strong>Phương thức:</strong> Thanh toán tiền mặt khi nhận
                    hàng.
                  </p>
                  <p class="text-detail">
                    Khách hàng kiểm tra hàng và thanh toán trực tiếp cho nhân
                    viên giao hàng. Không cần trả trước.
                  </p>
                </div>
              </section>
            </div>
          </div>
        </div>

        <div class="checkout-right">
          <div class="order-summary-box">
            <h3>Đơn hàng (1 sản phẩm)</h3>

            <div class="order-item">
              <img
                src="assets/images/product-2.jpg"
                alt="Giày Nike Nam Chính hãng"
                class="item-image"
              />
              <div class="item-details">
                <p class="item-name">
                  Giày Nike Nam Chính hãng - Rival Fly 4 Men's Road Running
                  Shoes - Màu đen | JapanSport PV6040-001
                </p>
              </div>
            </div>

            <div class="order-totals">
              <div class="total-row">
                <span>Tạm tính</span>
                <span class="amount">1.500.000₫</span>
              </div>
              <div class="total-row">
                <span>Phí vận chuyển</span>
                <span class="amount">50.000₫</span>
              </div>
              <div class="total-row total-grand">
                <span>Tổng cộng</span>
                <span class="amount grand-total">1.550.000₫</span>
              </div>
            </div>

            <div class="order-actions">
              <a href="${pageContext.request.contextPath}/carts.jsp" class="btn-back"> Quay về giỏ hàng</a>
              <button class="btn-checkout">ĐẶT HÀNG</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="footer.jsp" />
  </body>

  <script
    type="module"
    src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
  ></script>
  <script
    nomodule
    src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
  ></script>
  <script src="${pageContext.request.contextPath}/assets/script/reponsive.js"></script>
</html>
