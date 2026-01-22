<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chi tiết sản phẩm - BHD SPORT SHOES</title>
      <!--
    - favicon
  -->
      <link rel="icon" href="/Nhom18_LTW/assets/favicon_io/favicon.ico" />

    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/chitietsanpham.css" />
    <link rel="stylesheet" href="assets/css/products.css" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
    />
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
  </head>

  <body id="top">
  <jsp:include page="header.jsp" />

    <main>
      <div class="container">
        <div class="breadcrumb-container">
          <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/menu">Trang Chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/products">Sản Phẩm</a></li>
            <li class="current-page">Nike Air Force 1 '07</li>
          </ul>
        </div>

        <div class="product-detail-wrapper">
          <div class="product-gallery-box">
            <div class="sub-img-container">
              <img
                src="assets/images/product-1.jpg"
                onclick="changeImage(this)"
              />
              <img
                src="assets/images/product-8.jpg"
                onclick="changeImage(this)"
              />
              <img
                src="assets/images/product-2.jpg"
                onclick="changeImage(this)"
              />
              <img
                src="assets/images/product-3.jpg"
                onclick="changeImage(this)"
              />
              <img
                src="assets/images/product-4.jpg"
                onclick="changeImage(this)"
              />
            </div>

            <div class="main-img-container">
              <img
                src="assets/images/product-1.jpg"
                id="main-image"
                alt="Main Product"
              />
              <div class="badge">-20%</div>
            </div>
          </div>

          <div class="product-info-box">
            <h1 class="product-title">Nike Air Force 1 '07</h1>

            <div class="product-meta">
              <p class="brand-info">Thương hiệu: <strong>Nike</strong></p>
              <p class="stock-info">Kho: <strong data-stock="10">10</strong></p>
            </div>

            <div class="price-row">
              <span class="current-price">1.960.000đ</span>
              <del class="original-price">2.450.000đ</del>
              <span class="discount-tag">GIẢM 20%</span>
            </div>

            <p class="short-desc">
              Biểu tượng thời trang đường phố với chất liệu da cao cấp và đệm
              Air êm ái. Thiết kế cổ điển không bao giờ lỗi mốt.
            </p>

            <div class="option-block">
              <div class="option-block">
                <label>Màu sắc:</label>
                <div class="filter-group-body">
                  <ul class="filter-list-color">
                    <li id="filter-color-black">
                      <input type="checkbox" id="color-black" />
                      <label for="color-black">Đen</label>
                    </li>
                    <li id="filter-color-white">
                      <input type="checkbox" id="color-white" />
                      <label for="color-white">Trắng</label>
                    </li>
                    <li id="filter-color-red">
                      <input type="checkbox" id="color-red" />
                      <label for="color-red">Đỏ</label>
                    </li>
                    <li id="filter-color-blue">
                      <input type="checkbox" id="color-blue" />
                      <label for="color-blue">Xanh dương</label>
                    </li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="option-block">
              <label>Kích thước:</label>
              <div class="size-list">
                <button class="size-btn">39</button>
                <button class="size-btn">40</button>
                <button class="size-btn">41</button>
                <button class="size-btn">42</button>
              </div>
            </div>

            <div class="action-area">
              <div class="qty-row">
                <label class="qty-label">Số lượng:</label>
                <div class="qty-input-group">
                  <button id="qty-minus" class="qty-btn qty-minus">-</button>
                  <input type="number" id="qty-val" value="1" min="1" />
                  <button id="qty-plus" class="qty-btn qty-plus">+</button>
                </div>
              </div>

              <div class="buttons-row">
                <button id="btn-add-cart" class="btn-main">
                  <ion-icon name="cart-outline"></ion-icon> THÊM GIỎ
                </button>

                <button id="btn-buy-now" class="btn-main">MUA NGAY</button>

                <button id="btn-wishlist" class="btn-main">
                  <ion-icon name="heart-outline"></ion-icon>
                </button>
              </div>
            </div>
          </div>
        </div>

        <section class="product-desc-full">
          <h2 class="section-title-desc">Mô tả sản phẩm</h2>
          <div class="desc-content">
            <p>Huyền thoại vẫn sống mãi với Nike Air Force 1 '07...</p>
            <ul>
              <li>Chất liệu da thật và da tổng hợp bền bỉ, dễ dàng vệ sinh.</li>
              <li>
                Bộ đệm Nike Air, ban đầu được thiết kế cho bóng rổ, mang lại sự
                êm ái lâu dài.
              </li>
              <li>
                Cổ giày thấp có đệm mềm mại, tạo cảm giác thoải mái quanh mắt cá
                chân.
              </li>
            </ul>
          </div>
        </section>

        <section class="related-products section">
          <h2
            class="h2 section-title"
            style="text-align: center; margin-bottom: 40px"
          >
            Sản phẩm gợi ý
          </h2>

          <ul class="product-list grid-list">
            <li class="product-item">
              <div class="product-card" tabindex="0">
                <figure class="card-banner">
                  <img
                    src="assets/images/product-5.jpg"
                    width="312"
                    height="350"
                    loading="lazy"
                    alt="Giày 1"
                    class="image-contain"
                  />
                  <div class="card-badge">New</div>
                  <ul class="card-action-list">
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="cart-outline"></ion-icon>
                      </button>
                    </li>
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="heart-outline"></ion-icon>
                      </button>
                    </li>
                  </ul>
                </figure>
                <div class="card-content">
                  <h3 class="h3 card-title">
                    <a href="#">Nike Dunk Low Retro</a>
                  </h3>
                  <data class="card-price" value="2929000">2.929.000đ</data>
                </div>
              </div>
            </li>
            <li class="product-item">
              <div class="product-card" tabindex="0">
                <figure class="card-banner">
                  <img
                    src="assets/images/product-2.jpg"
                    width="312"
                    height="350"
                    loading="lazy"
                    alt="Giày 2"
                    class="image-contain"
                  />
                  <div class="card-badge">-15%</div>
                  <ul class="card-action-list">
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="cart-outline"></ion-icon>
                      </button>
                    </li>
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="heart-outline"></ion-icon>
                      </button>
                    </li>
                  </ul>
                </figure>
                <div class="card-content">
                  <h3 class="h3 card-title">
                    <a href="#">Puma Suede Classic</a>
                  </h3>
                  <data class="card-price" value="1890000">1.890.000đ</data>
                </div>
              </div>
            </li>
            <li class="product-item">
              <div class="product-card" tabindex="0">
                <figure class="card-banner">
                  <img
                    src="assets/images/product-1.jpg"
                    width="312"
                    height="350"
                    loading="lazy"
                    alt="Giày 3"
                    class="image-contain"
                  />
                  <ul class="card-action-list">
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="cart-outline"></ion-icon>
                      </button>
                    </li>
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="heart-outline"></ion-icon>
                      </button>
                    </li>
                  </ul>
                </figure>
                <div class="card-content">
                  <h3 class="h3 card-title">
                    <a href="#">Nike Balance 550</a>
                  </h3>
                  <data class="card-price" value="3500000">3.500.000đ</data>
                </div>
              </div>
            </li>
            <li class="product-item">
              <div class="product-card" tabindex="0">
                <figure class="card-banner">
                  <img
                    src="assets/images/product-3.jpg"
                    width="312"
                    height="350"
                    loading="lazy"
                    alt="Giày 4"
                    class="image-contain"
                  />
                  <ul class="card-action-list">
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="cart-outline"></ion-icon>
                      </button>
                    </li>
                    <li>
                      <button class="card-action-btn">
                        <ion-icon name="heart-outline"></ion-icon>
                      </button>
                    </li>
                  </ul>
                </figure>
                <div class="card-content">
                  <h3 class="h3 card-title"><a href="#">Adidas Samba OG</a></h3>
                  <data class="card-price" value="2800000">2.800.000đ</data>
                </div>
              </div>
            </li>
          </ul>
        </section>
      </div>

      <div id="toast-message" class="toast-message">
        <i class="fas fa-check-circle"></i> <span></span>
      </div>
    </main>

  <jsp:include page="footer.jsp" />
    <div id="cartPopup" class="cart-modal">
        <div class="cart-modal-content">
            <span class="cart-close">&times;</span>

            <div class="cart-product-box">
                <img src="./assets/images/product-1.jpg" class="cart-product-img" id="popupImg" />

                <div class="cart-info">
                    <h2 id="popupName">Running Sneaker Shoes</h2>

                    <div class="price-line">
                        <span class="price-sale" id="popupPrice">1.500.000đ</span>
                        <span class="price-original" id="popupOriginal">1.850.000đ</span>
                        <span class="price-discount" id="popupDiscount">-17%</span>
                    </div>


                    <!-- Màu -->
                    <div class="popup-option-block">
                        <label>Màu sắc:</label>
                        <div class="popup-color-list" id="popupColors">
                            <div class="popup-color-item selected" data-value="Trắng" style="--c:#ffffff"></div>
                            <div class="popup-color-item" data-value="Đen" style="--c:#000000"></div>
                            <div class="popup-color-item" data-value="Xanh" style="--c:#007BFF"></div>
                        </div>
                    </div>

                    <!-- Size -->
                    <div class="popup-option-block">
                        <label>Kích cỡ:</label>
                        <div class="popup-size-list" id="popupSizes">
                            <div class="popup-size-item selected" data-value="38">38</div>
                            <div class="popup-size-item" data-value="39">39</div>
                            <div class="popup-size-item" data-value="40">40</div>
                        </div>
                    </div>

                    <div class="popup-option-block">
                        <label>Số lượng:</label>
                        <div class="qty-group">
                            <button class="qty-btn minus">−</button>
                            <input type="number" id="popupQty" value="1" min="1" />
                            <button class="qty-btn plus">+</button>
                        </div>
                    </div>


                    <button class="popup-add-cart"> Thêm vào giỏ hàng</button>
                </div>
            </div>
        </div>
    </div>
  <script src="${pageContext.request.contextPath}/assets/script/reponsive.js"></script>
  <script src="${pageContext.request.contextPath}/assets/script/chitietsanpham.js"></script>
  </body>
</html>
