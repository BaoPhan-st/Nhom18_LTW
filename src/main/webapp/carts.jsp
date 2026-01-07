<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <div class="container">
      <div class="breadcrumb-container">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="${pageContext.request.contextPath}/menu.jsp"
                >Trang Chủ</a
              >
            </li>

            <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
          </ol>
        </nav>
      </div>
    </div>
    <!--
   - #CartContent
   -->
    <main class="cart-page-content">
      <div class="container">
        <h1 class="cart-header">Giỏ hàng</h1>

        <div class="cart-items-list">
          <div class="product-item">
            <div class="product-details">
              <img
                src="assets/images/product-1.jpg"
                alt="Tên Sản Phẩm 1"
                class="product-image"
              />

              <div class="product-info">
                <h2 class="product-name">
                  <a
                    href="${pageContext.request.contextPath}/chitietsanpham.jsp"
                    class="product-link"
                    >Nike Air Force 1 '07</a
                  >
                </h2>

                <div class="product-attributes-line-2">
                  <p class="product-size">Size: 40</p>
                  <div class="product-color">
                    <div
                      class="color-box"
                      style="background-color: #e74c3c"
                      title="Hex: #e74c3c (Đỏ)"
                    ></div>
                  </div>
                </div>

                <div
                  class="product-price-line-3c"
                  data-id="12345"
                  data-price-raw="1500000"
                  data-original-raw="1808500"
                  data-discount-percentage="17"
                >
                  <div class="discounted-price-group">
                    <span class="discounted-price">199.000 VNĐ</span>
                    <span class="original-price">250.000 VNĐ</span>
                  </div>
                  <p class="discount-value">Giảm: 21%</p>
                </div>
              </div>
            </div>

            <div class="product-actions">
              <div class="quantity-control">
                <button class="quantity-btn minus-btn">-</button>
                <input type="number" value="1" min="1" class="quantity-input" />
                <button class="quantity-btn plus-btn">+</button>
              </div>

              <button class="action-btn delete-btn">Xoá</button>

              <button class="action-btn buy-now-btn">Mua ngay</button>
            </div>
          </div>

          <hr class="separator" />

          <div class="product-item">
            <div class="product-details">
              <img
                src="assets/images/product-2.jpg"
                alt="Tên Sản Phẩm 2"
                class="product-image"
              />

              <div class="product-info">
                <h2 class="product-name">
                  <a href="#" class="product-link">Nike Air Force 1 '07</a>
                </h2>

                <div class="product-attributes-line-2">
                  <p class="product-size">Size: 40</p>
                  <div class="product-color">
                    <div
                      class="color-box"
                      style="background-color: #3498db"
                      title="Hex: #3498db (Xanh Dương)"
                    ></div>
                  </div>
                </div>

                <div
                  class="product-price-line-3c"
                  data-id="12345"
                  data-price-raw="1500000"
                  data-original-raw="1808500"
                  data-discount-percentage="17"
                >
                  <div class="discounted-price-group">
                    <span class="discounted-price">1.500.000 VNĐ</span>
                    <span class="original-price" style="display: none"
                      >1.500.000 VNĐ</span
                    >
                  </div>
                </div>
              </div>
            </div>

            <div class="product-actions">
              <div class="quantity-control">
                <button class="quantity-btn minus-btn">-</button>
                <input type="number" value="2" min="1" class="quantity-input" />
                <button class="quantity-btn plus-btn">+</button>
              </div>

              <button class="action-btn delete-btn">Xoá</button>
              <button class="action-btn buy-now-btn">Mua ngay</button>
            </div>
          </div>

          <hr class="separator" />
        </div>

        <div class="cart-summary-section">
          <div class="total-line">
            <span class="total-label">Tổng cộng:</span>
            <span class="total-price">3.199.000 VNĐ</span>
          </div>
          <button class="checkout-btn">
            <a
              href="${pageContext.request.contextPath}/checkout.jsp"
              class="Thanh_toán"
              >Tiến Hành Đặt hàng</a
            >
          </button>
        </div>
      </div>
    </main>

    <!--
- #FOOTER
-->
    <jsp:include page="footer.jsp"/>
    <!-
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
  </body>
</html>
