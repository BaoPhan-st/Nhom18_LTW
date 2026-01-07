<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sản phẩm - BHD SPORT SHOES</title>
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
    />

    <link rel="icon" href="/Nhom18_LTW/assets/favicon_io/favicon.ico" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dangnhapvadangki.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
      integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
  </head>

  <body>
  <jsp:include page="header.jsp" />
    <div class="banner-slide">
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <a href="#" class="banner-link">
              <img
                src="https://cdn.shopify.com/s/files/1/0456/5070/6581/files/HP_BACKFRI_KV_DESK_VN.jpg?v=1763548181&width=1440"
                alt="Banner Slide 1"
                class="banner-img"
                width="1200"
                height="300"
              />
            </a>
          </div>

          <div class="swiper-slide">
            <a href="#" class="banner-link">
              <img
                src="https://cdn.shopify.com/s/files/1/0456/5070/6581/files/LP_NIKE_FOOTBALL_KV.jpg?v=1746584732"
                alt="Banner Slide 2"
                class="banner-img"
                width="1200"
                height="300"
              />
            </a>
          </div>

          <div class="swiper-slide">
            <a href="#" class="banner-link">
              <img
                src="https://cdn.shopify.com/s/files/1/0456/5070/6581/files/LP_NIKE_RUNNING_KV.jpg?v=1746584732"
                alt="Banner Slide 3"
                class="banner-img"
                width="1200"
                height="300"
              />
            </a>
          </div>
          <div class="swiper-slide">
            <a href="#" class="banner-link">
              <img
                src="https://cdn.shopify.com/s/files/1/0456/5070/6581/files/LP_NIKE_TRAIN_KV.jpg?v=1746584732"
                alt="Banner Slide 4"
                class="banner-img"
                width="1200"
                height="300"
              />
            </a>
          </div>
        </div>

        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

        <div class="swiper-pagination"></div>
      </div>
    </div>
    <div class="shop-layout"></div>

    <div class="shop-layout">
      <aside class="filter-sidebar">
        <div class="sidebar-header">
          <h2>Bộ Lọc</h2>
          <button class="clear-all">XÓA TẤT CẢ</button>
        </div>

        <div class="filter-group">
          <div class="filter-search-wrapper">
            <input
              type="search"
              placeholder="Tìm kiếm theo tên..."
              class="filter-search"
            />
          </div>
          <div class="filter-group-header">
            <h3>Hãng</h3>
            <button class="toggle-btn">-</button>
          </div>
          <div class="filter-group-body">
            <ul class="filter-list scrollable">
              <li>
                <input type="checkbox" id="brand-nike" />
                <label for="brand-nike" class="brand-label">
                  <img
                    src="assets/images/nike_logo.png"
                    alt="Nike"
                    class="brand-icon"
                  />
                  <span>Nike</span>
                </label>
              </li>

              <li>
                <input type="checkbox" id="brand-adidas" />
                <label for="brand-adidas" class="brand-label">
                  <img
                    src="assets/images/adidas_logo.png"
                    alt="Adidas"
                    class="brand-icon"
                  />
                  <span>Adidas</span>
                </label>
              </li>

              <li>
                <input type="checkbox" id="brand-puma" />
                <label for="brand-puma" class="brand-label">
                  <img
                    src="assets/images/puma_logo.jpg"
                    alt="Puma"
                    class="brand-icon"
                  />
                  <span>Puma</span>
                </label>
              </li>
            </ul>
          </div>
        </div>

        <div class="filter-group">
          <div class="filter-group-header">
            <h3>Size</h3>
            <button class="toggle-btn">-</button>
          </div>
          <div class="filter-group-body">
            <ul class="filter-list-grid" id="size-filter-list">
              <li>
                <input type="checkbox" id="size-38" /><label for="size-38"
                  >38</label
                >
              </li>
              <li>
                <input type="checkbox" id="size-39" /><label for="size-39"
                  >39</label
                >
              </li>
              <li>
                <input type="checkbox" id="size-40" /><label for="size-40"
                  >40</label
                >
              </li>
              <li>
                <input type="checkbox" id="size-41" /><label for="size-41"
                  >41</label
                >
              </li>
              <li>
                <input type="checkbox" id="size-42" /><label for="size-42"
                  >42</label
                >
              </li>
              <li>
                <input type="checkbox" id="size-43" /><label for="size-43"
                  >43</label
                >
              </li>
            </ul>
          </div>
        </div>

        <div class="filter-group">
          <div class="filter-group-header">
            <h3>Khoảng giá</h3>
            <button class="toggle-btn">-</button>
          </div>
          <div class="filter-group-body">
            <div class="price-filter">
              <div class="slider-container">
                <div class="slider-track"></div>
                <input
                  type="range"
                  min="0"
                  max="5000000"
                  value="0"
                  id="slider-1"
                  oninput="slideOne()"
                />
                <input
                  type="range"
                  min="0"
                  max="5000000"
                  value="5000000"
                  id="slider-2"
                  oninput="slideTwo()"
                />
              </div>
              <div class="price-input">
                <div class="field">
                  <span>Từ</span>
                  <input type="text" id="range1" value="0đ" readonly />
                </div>
                <div class="separator">-</div>
                <div class="field">
                  <span>Đến</span>
                  <input type="text" id="range2" value="5.000.000đ" readonly />
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="filter-group">
          <div class="filter-group-header">
            <h3>Màu sắc</h3>
            <button class="toggle-btn">-</button>
          </div>
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
      </aside>

      <main class="product-content">
        <div class="sort-toolbar">
          <label for="sort-select">Sắp xếp theo:</label>
          <select id="sort-select" class="sort-dropdown">
            <option value="default">Mặc định</option>
            <option value="newest">Sản phẩm mới nhất</option>
            <option value="bestseller">Sản phẩm bán chạy</option>
            <option value="price-asc">Giá từ thấp đến cao</option>
            <option value="price-desc">Giá từ cao đến thấp</option>
          </select>
        </div>
        <ul class="product-list grid-list">
          <li class="product-item">
            <div class="product-card" tabindex="0">
              <figure class="card-banner">
                <img
                  src="assets/images/product-1.jpg"
                  width="312"
                  height="350"
                  loading="lazy"
                  alt="Nike Air Force 1 '07"
                  class="image-contain"
                />
                <div class="card-badge new-badge">New</div>
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title">
                  <a
                    href="${pageContext.request.contextPath}/chitietsanpham.jsp"
                    >Nike Air Force 1 '07</a
                  >
                </h3>
                <data class="card-price" value="3239000">3.239.000đ</data>
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
                  alt="Nike Air Jordan 1"
                  class="image-contain"
                />
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title">
                  <a
                    href="${pageContext.request.contextPath}/chitietsanpham.jsp"
                    >Nike Air Jordan 1 Mid</a
                  >
                </h3>
                <data class="card-price" value="4109000">4.109.000đ</data>
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
                  alt="Adidas Ultraboost"
                  class="image-contain"
                />
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title">
                  <a
                    href="${pageContext.request.contextPath}/chitietsanpham.jsp"
                    >Adidas Ultraboost 1.0</a
                  >
                </h3>
                <data class="card-price" value="4500000">4.500.000đ</data>
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
                  alt="Converse Chuck 70"
                  class="image-contain"
                />
                <div class="card-badge sale-badge">-20%</div>
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title"><a href="#">Converse Chuck 70</a></h3>
                <data class="card-price" value="1960000"
                  >1.960.000đ
                  <del style="color: #888; font-size: 0.9em"
                    >2.450.000đ</del
                  ></data
                >
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
                  alt="Converse Chuck 70"
                  class="image-contain"
                />
                <div class="card-badge sale-badge">-20%</div>
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title"><a href="#">Converse Chuck 70</a></h3>
                <data class="card-price" value="1960000"
                  >1.960.000đ
                  <del style="color: #888; font-size: 0.9em"
                    >2.450.000đ</del
                  ></data
                >
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
                  alt="Converse Chuck 70"
                  class="image-contain"
                />
                <div class="card-badge sale-badge">-20%</div>
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title"><a href="#">Converse Chuck 70</a></h3>
                <data class="card-price" value="1960000"
                  >1.960.000đ
                  <del style="color: #888; font-size: 0.9em"
                    >2.450.000đ</del
                  ></data
                >
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
                  alt="Converse Chuck 70"
                  class="image-contain"
                />
                <div class="card-badge sale-badge">-20%</div>
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title"><a href="#">Converse Chuck 70</a></h3>
                <data class="card-price" value="1960000"
                  >1.960.000đ
                  <del style="color: #888; font-size: 0.9em"
                    >2.450.000đ</del
                  ></data
                >
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
                  alt="Converse Chuck 70"
                  class="image-contain"
                />
                <div class="card-badge sale-badge">-20%</div>
                <ul class="card-action-list">
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="cart-outline"></ion-icon>
                    </button>
                  </li>
                  <li class="card-action-item">
                    <button class="card-action-btn">
                      <ion-icon name="heart-outline"></ion-icon>
                    </button>
                  </li>
                </ul>
              </figure>
              <div class="card-content">
                <div class="card-cat"></div>
                <h3 class="h3 card-title"><a href="#">Converse Chuck 70</a></h3>
                <data class="card-price" value="1960000"
                  >1.960.000đ
                  <del style="color: #888; font-size: 0.9em"
                    >2.450.000đ</del
                  ></data
                >
              </div>
            </div>
          </li>
        </ul>

        <div class="pagination">
          <button class="page-btn prev-btn" disabled>&laquo;</button>
          <button class="page-btn page-number active">1</button>
          <button class="page-btn page-number">2</button>

          <button class="page-btn next-btn">&raquo;</button>
        </div>
      </main>
    </div>

    <div id="toast-message" class="toast-message">
      <i class="fas fa-check-circle"></i> <span></span>
    </div>

  <jsp:include page="footer.jsp" />
  <div id="cartPopup" class="cart-modal">
      <div class="cart-modal-content">
          <span class="cart-close">&times;</span>

          <div class="cart-product-box">
              <img
                      src="./assets/images/product-1.jpg"
                      class="cart-product-img"
                      id="popupImg"
              />

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
                          <div
                                  class="popup-color-item selected"
                                  data-value="Trắng"
                                  style="--c: #ffffff"
                          ></div>
                          <div
                                  class="popup-color-item"
                                  data-value="Đen"
                                  style="--c: #000000"
                          ></div>
                          <div
                                  class="popup-color-item"
                                  data-value="Xanh"
                                  style="--c: #007bff"
                          ></div>
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

                  <button class="popup-add-cart">Thêm vào giỏ hàng</button>
              </div>
          </div>
      </div>
  </div>
  <script
          type="module"
          src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
  ></script>
  <script
          nomodule
          src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
  ></script>


  <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/script/reponsive.js"></script>

  <script src="${pageContext.request.contextPath}/assets/script/product-popup.js"></script>
  <script src="${pageContext.request.contextPath}/assets/script/SliderBanner.js"></script>

  </body>
</html>
