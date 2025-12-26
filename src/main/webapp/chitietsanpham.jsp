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
    <header class="header">
      <div class="container">
        <div class="overlay"></div>
        <a href="menu.jsp" class="logo">
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
          <button class="nav-close-btn">
            <ion-icon name="close-outline"></ion-icon>
          </button>
          <ul class="navbar-list">
            <li class="navbar-item">
              <a href="menu.jsp" class="navbar-link">Trang chủ</a>
            </li>
            <li class="navbar-item">
              <a href="gioithieu.jsp" class="navbar-link">Giới thiệu</a>
            </li>
            <li class="navbar-item">
              <a href="products.jsp" class="navbar-link">Sản phẩm</a>
            </li>
            <li class="navbar-item">
              <a href="lienhe.jsp" class="navbar-link">Liên hệ</a>
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
              <a href="login.jsp" class="nav-action-btn"
                ><ion-icon name="person-outline"></ion-icon
                ><span class="nav-action-text">Tài khoản</span></a
              >
            </li>
            <li>
              <a href="wishlist.jsp" class="nav-action-btn"
                ><ion-icon name="heart-outline"></ion-icon
                ><span class="nav-action-text">Yêu thích</span></a
              >
            </li>
            <li>
              <a href="carts.jsp" class="nav-action-btn"
                ><ion-icon name="bag-outline"></ion-icon
                ><span class="nav-action-text">Giỏ hàng</span></a
              >
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

                <button
                        type="button"
                        class="search-close-btn"
                        id="searchCloseBtn"
                >
                    <ion-icon name="close-outline"></ion-icon>
                </button>
            </form>
        </nav>
      </div>
    </header>

    <main>
      <div class="container">
        <div class="breadcrumb-container">
          <ul class="breadcrumb">
            <li><a href="menu.jsp">Trang Chủ</a></li>
            <li><a href="products.jsp">Sản Phẩm</a></li>
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
              <li><p class="footer-list-title">Tài khoản</p></li>
              <li>
                <a href="account.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>
                  <span class="footer-link-text">Tài khoản</span>
                </a>
              </li>
              <li>
                <a href="carts.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Xem giỏ hàng</span>
                </a>
              </li>

              <li>
                <a href="wishlist.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Yêu thích</span>
                </a>
              </li>
            </ul>

            <ul class="footer-list">
              <li><p class="footer-list-title">Chính sách</p></li>
              <li>
                <a href="ChinhSachBaoMat.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>
                  <span class="footer-link-text">Chính sách bảo mật</span>
                </a>
              </li>
              <li>
                <a href="ChinhSachBaoHanh.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>
                  <span class="footer-link-text">Chính sách bảo hành</span>
                </a>
              </li>
              <li>
                <a href="huongdanmuahang.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>
                  <span class="footer-link-text">Hướng dẫn mua hàng</span>
                </a>
              </li>
              <li>
                <a href="faq.jsp" class="footer-link">
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
            <a href="#" class="copyright-link">BHD-SPORT SHOES</a>. Cùng bạn
            chinh phục mọi hành trình
          </p>
        </div>
      </div>
    </footer>
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
        document.addEventListener("DOMContentLoaded", () => {
            const popup = document.getElementById("cartPopup");
            const popupClose = document.querySelector(".cart-close");

            // Nút giỏ hàng chính ở chi tiết sản phẩm → chỉ toast
            const mainCartBtn = document.getElementById("btn-add-cart");
            mainCartBtn.addEventListener("click", () => {
                showToast("Đã thêm sản phẩm này vào Giỏ hàng!");
            });

            // Nút wishlist ở chi tiết sản phẩm → toast
            document.getElementById("btn-wishlist").addEventListener("click", () => {
                showToast("Đã thêm sản phẩm này vào Yêu thích!");
            });

            // Nút mua ngay → toast
            document.getElementById("btn-buy-now").addEventListener("click", () => {
                showToast("Đang chuyển đến trang thanh toán...");
            });

            // ================== Sản phẩm gợi ý ==================
            document.querySelectorAll(".product-card .card-action-btn").forEach((btn) => {
                btn.addEventListener("click", (e) => {
                    e.preventDefault();
                    const icon = btn.querySelector("ion-icon");
                    const iconName = icon.getAttribute("name");

                    const card = btn.closest(".product-card");
                    const productName = card.querySelector(".card-title a").textContent;
                    const productImg = card.querySelector("img").src;
                    const productPrice = card.querySelector(".card-price").textContent;

                    if (iconName === "cart-outline") {
                        // Chỉ mở popup
                        showProductPopup({
                            image: productImg,
                            name: productName,
                            price: productPrice,
                            original: "",
                            discount: "",
                            colors: [
                                { value: "Trắng", color: "#ffffff" },
                                { value: "Đen", color: "#000000" },
                                { value: "Xanh", color: "#007BFF" }
                            ],
                            sizes: [38, 39, 40]
                        });
                    } else if (iconName === "heart-outline") {
                        // Wishlist → toast
                        showToast(`Đã thêm sản phẩm vào mục Yêu thích!`);
                    }
                });
            });

            // ================== Popup ==================
            popupClose.addEventListener("click", () => popup.classList.remove("active"));
            window.addEventListener("click", (e) => {
                if (e.target === popup) popup.classList.remove("active");
            });

            // Nút thêm vào giỏ trong popup → chỉ đóng popup
            document.querySelector(".popup-add-cart").addEventListener("click", () => {
                showToast(`Đã thêm sản phẩm vào Giỏ Hàng!`);
                popup.classList.remove("active");
            });

            // ================== Popup màu & size & số lượng ==================
            const colorItems = document.querySelectorAll("#popupColors .popup-color-item");
            colorItems.forEach(item => item.addEventListener("click", () => {
                colorItems.forEach(i => i.classList.remove("selected"));
                item.classList.add("selected");
            }));

            const sizeItems = document.querySelectorAll("#popupSizes .popup-size-item");
            sizeItems.forEach(item => item.addEventListener("click", () => {
                sizeItems.forEach(i => i.classList.remove("selected"));
                item.classList.add("selected");
            }));

            const qtyInput = document.getElementById("popupQty");
            document.querySelector(".qty-btn.minus").addEventListener("click", () => {
                let val = parseInt(qtyInput.value);
                if (val > 1) qtyInput.value = val - 1;
            });
            document.querySelector(".qty-btn.plus").addEventListener("click", () => {
                qtyInput.value = parseInt(qtyInput.value) + 1;
            });
            qtyInput.addEventListener("input", () => { if (qtyInput.value < 1) qtyInput.value = 1; });

            // ================== Hàm toast & popup ==================
            window.showToast = (message) => {
                const toast = document.getElementById("toast-message");
                toast.querySelector("span").textContent = message;
                toast.classList.add("show");
                setTimeout(() => toast.classList.remove("show"), 3000);
            };

            window.showProductPopup = (data) => {
                if (data.image) document.getElementById("popupImg").src = data.image;
                if (data.name) document.getElementById("popupName").textContent = data.name;
                if (data.price) document.getElementById("popupPrice").textContent = data.price;
                if (data.original) document.getElementById("popupOriginal").textContent = data.original;
                if (data.discount) document.getElementById("popupDiscount").textContent = data.discount;
                qtyInput.value = 1;

                popup.classList.add("active");
            };

            // ================== Mobile menu, chọn size chi tiết sản phẩm ==================
            const navOpenBtn = document.querySelector(".nav-open-btn");
            const navCloseBtn = document.querySelector(".nav-close-btn");
            const navbar = document.querySelector(".navbar");
            const overlay = document.querySelector(".overlay");
            const toggleNav = () => { navbar.classList.toggle("active"); overlay.classList.toggle("active"); };
            if (navOpenBtn) navOpenBtn.addEventListener("click", toggleNav);
            if (navCloseBtn) navCloseBtn.addEventListener("click", toggleNav);
            if (overlay) overlay.addEventListener("click", toggleNav);

            const sizeBtns = document.querySelectorAll(".size-btn");
            sizeBtns.forEach(btn => btn.addEventListener("click", () => {
                sizeBtns.forEach(b => b.classList.remove("selected"));
                btn.classList.add("selected");
            }));

            // Checkbox màu chi tiết sản phẩm chỉ chọn 1
            const checkboxes = document.querySelectorAll('.filter-list-color input[type="checkbox"]');
            checkboxes.forEach(checkbox => checkbox.addEventListener("change", function () {
                if (this.checked) {
                    checkboxes.forEach(other => { if (other !== this) other.checked = false; });
                }
            }));
        });
    </script>
  </body>
</html>
