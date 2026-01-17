<%-- Created by IntelliJ IDEA. User: quy23 Date: 16/12/2025 Time: 5:46 CH To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="model.user.User" %> <% User currentUser = (User)
session.getAttribute("currentUser"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BHD - SPORT SHOES</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
      integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!--
    - favicon
  -->
    <link rel="icon" href="/Nhom18_LTW/assets/favicon_io/favicon.ico" />

    <!--
    -  css link
  -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/style.css"
    />
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
    <main>
      <article>
        <!--
        - #HERO
      -->
        <section
          class="section hero"
          style="background-image: url('./assets/images/hero-banner.png')"
        >
          <div class="container">
            <h2 class="h1 hero-title">Bộ sưu tập <strong>Mùa hè</strong></h2>

            <p class="hero-text">
              Không chỉ là đôi giày, đó là phong cách khẳng định cá tính qua
              từng bước đi, chạm tới đỉnh cao của sự tự tin.
            </p>

            <button class="btn btn-primary">
              <a
                href="${pageContext.request.contextPath}/products"
                class="Menu_Banner_button"
                >Mua ngay</a
              >
              <ion-icon
                name="arrow-forward-outline"
                aria-hidden="true"
              ></ion-icon>
            </button>
          </div>
        </section>

        <!--
        - #Bo suu tap
      -->

        <section class="section collection">
          <div class="container">
            <ul class="collection-list has-scrollbar">
              <li>
                <div
                  class="collection-card"
                  style="
                    background-image: url('./assets/images/collection-1.jpg');
                  "
                >
                  <h3 class="h4 card-title">Bộ sưu tập Nike</h3>

                  <a
                    href="${pageContext.request.contextPath}/products"
                    class="btn btn-secondary"
                  >
                    <span>Khám phá ngay</span>

                    <ion-icon
                      name="arrow-forward-outline"
                      aria-hidden="true"
                    ></ion-icon>
                  </a>
                </div>
              </li>

              <li>
                <div
                  class="collection-card"
                  style="
                    background-image: url('./assets/images/collection-2.jpg');
                  "
                >
                  <h3 class="h4 card-title">Bộ sưu tập Adidas</h3>

                  <a
                    href="${pageContext.request.contextPath}/products"
                    class="btn btn-secondary"
                  >
                    <span>Khám phá ngay</span>

                    <ion-icon
                      name="arrow-forward-outline"
                      aria-hidden="true"
                    ></ion-icon>
                  </a>
                </div>
              </li>

              <li>
                <div
                  class="collection-card"
                  style="
                    background-image: url('./assets/images/collection-3.jpg');
                  "
                >
                  <h3 class="h4 card-title">Bộ sưu tập Puma</h3>

                  <a
                    href="${pageContext.request.contextPath}/products"
                    class="btn btn-secondary"
                  >
                    <span>Khám phá ngay</span>

                    <ion-icon
                      name="arrow-forward-outline"
                      aria-hidden="true"
                    ></ion-icon>
                  </a>
                </div>
              </li>
            </ul>
          </div>
        </section>

        <!--
        - #PRODUCT
      -->

        <section class="section product">
          <div class="container">
            <h2 class="h2 section-title">Sản phẩm bán chạy</h2>

            <ul class="filter-list">
              <li>
                <button class="filter-btn active">All</button>
              </li>

              <li>
                <button class="filter-btn">Nike</button>
              </li>

              <li>
                <button class="filter-btn">Adidas</button>
              </li>

              <li>
                <button class="filter-btn">Puma</button>
              </li>
            </ul>

            <ul class="product-list">
              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-1.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card1-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card1-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a
                        href="${pageContext.request.contextPath}/chitietsanpham"
                        >Running Sneaker Shoes</a
                      >
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                        <span class="original-price">1.808.500đ</span>
                      </div>
                      <p class="discount-value">Giảm: 17%</p>
                    </div>
                  </div>
                </div>
              </li>
              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-2.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card2-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card2-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-3.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card3-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card3-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>

                        <span class="original-price">1.808.500đ</span>
                      </div>

                      <p class="discount-value">Giảm: 17%</p>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-4.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card4label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card4-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>

                        <span class="original-price">1.808.500đ</span>
                      </div>

                      <p class="discount-value">Giảm: 17%</p>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-1.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card5-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card5-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>

                        <span class="original-price">1.808.500đ</span>
                      </div>

                      <p class="discount-value">Giảm: 17%</p>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-2.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card6-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card6-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>

                        <span class="original-price">1.808.500đ</span>
                      </div>

                      <p class="discount-value">Giảm: 17%</p>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-3.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card7-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card7-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-4.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card8-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card8-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-1.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card9-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card9-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-2.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card10-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card10-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>

                        <span class="original-price">1.808.500đ</span>
                      </div>

                      <p class="discount-value">Giảm: 17%</p>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-3.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card11-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card11-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-4.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card12-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card12-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-1.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card13-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card13-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-2.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card14-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card14-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-3.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card15-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card15-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>
                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>

              <li class="product-item">
                <div class="product-card" tabindex="0">
                  <figure class="card-banner">
                    <img
                      src="./assets/images/product-4.jpg"
                      width="312"
                      height="350"
                      loading="lazy"
                      alt="Running Sneaker Shoes"
                      class="image-contain"
                    />
                    <div class="card-badge">New</div>
                    <ul class="card-action-list">
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-1"
                        >
                          <ion-icon name="cart-outline"></ion-icon>
                        </button>

                        <div class="card-action-tooltip" id="card16-label-C">
                          Thêm vào giỏ hàng
                        </div>
                      </li>
                      <li class="card-action-item">
                        <button
                          class="card-action-btn"
                          aria-labelledby="card-label-2"
                        >
                          <ion-icon name="heart-outline"></ion-icon>
                        </button>
                        <div class="card-action-tooltip" id="card16-label-W">
                          Thêm vào mục yêu thích
                        </div>
                      </li>
                    </ul>
                  </figure>
                  <div class="card-content">
                    <h3 class="h3 card-title">
                      <a href="#">Running Sneaker Shoes</a>
                    </h3>

                    <div
                      class="product-price-line-3 product-card-price"
                      data-id="12345"
                      data-price-raw="1500000"
                      data-original-raw="1808500"
                      data-discount-percentage="17"
                    >
                      <div class="discounted-price-group">
                        <span class="discounted-price">1.500.000đ</span>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </section>
        <!--
        - #SPECIAL
      -->
        <section class="section special">
          <div class="container">
            <div
              class="special-banner"
              style="
                background-image: url('./assets/images/special-banner.jpg');
              "
            >
              <h2 class="h3 banner-title">Giày Đẹp – Giá Hời</h2>

              <a
                href="${pageContext.request.contextPath}/products"
                class="btn btn-link"
              >
                <span>Khám phá ngay</span>

                <ion-icon
                  name="arrow-forward-outline"
                  aria-hidden="true"
                ></ion-icon>
              </a>
            </div>

            <div class="special-product">
              <h2 class="h2 section-title">
                <span class="text">Ưu Đãi Đặc Biệt</span>

                <span class="line"></span>
              </h2>

              <ul class="has-scrollbar">
                <li class="product-item">
                  <div class="product-card" tabindex="0">
                    <figure class="card-banner">
                      <img
                        src="./assets/images/product-1.jpg"
                        width="312"
                        height="350"
                        alt="Running Sneaker Shoes"
                        class="image-contain"
                      />

                      <div class="card-badge">New</div>

                      <ul class="card-action-list">
                        <li class="card-action-item">
                          <button
                            class="card-action-btn"
                            aria-labelledby="card-label-1"
                          >
                            <ion-icon name="cart-outline"></ion-icon>
                          </button>

                          <div class="card-action-tooltip" id="card17-label-C">
                            Thêm vào giỏ hàng
                          </div>
                        </li>
                        <li class="card-action-item">
                          <button
                            class="card-action-btn"
                            aria-labelledby="card-label-2"
                          >
                            <ion-icon name="heart-outline"></ion-icon>
                          </button>
                          <div class="card-action-tooltip" id="card17-label-W">
                            Thêm vào mục yêu thích
                          </div>
                        </li>
                      </ul>
                    </figure>
                    <div class="card-content">
                      <h3 class="h3 card-title">
                        <a href="#">Running Sneaker Shoes</a>
                      </h3>
                      <div
                        class="product-price-line-3 product-card-price"
                        data-id="12345"
                        data-price-raw="1500000"
                        data-original-raw="1808500"
                        data-discount-percentage="17"
                      >
                        <div class="discounted-price-group">
                          <span class="discounted-price">1.500.000đ</span>

                          <span class="original-price">1.808.500đ</span>
                        </div>

                        <p class="discount-value">Giảm: 60%</p>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="product-item">
                  <div class="product-card" tabindex="0">
                    <figure class="card-banner">
                      <img
                        src="./assets/images/product-1.jpg"
                        width="312"
                        height="350"
                        alt="Running Sneaker Shoes"
                        class="image-contain"
                      />

                      <div class="card-badge">New</div>

                      <ul class="card-action-list">
                        <li class="card-action-item">
                          <button
                            class="card-action-btn"
                            aria-labelledby="card-label-1"
                          >
                            <ion-icon name="cart-outline"></ion-icon>
                          </button>

                          <div class="card-action-tooltip" id="card18-label-C">
                            Thêm vào giỏ hàng
                          </div>
                        </li>
                        <li class="card-action-item">
                          <button
                            class="card-action-btn"
                            aria-labelledby="card-label-2"
                          >
                            <ion-icon name="heart-outline"></ion-icon>
                          </button>
                          <div class="card-action-tooltip" id="card18-label-W">
                            Thêm vào mục yêu thích
                          </div>
                        </li>
                      </ul>
                    </figure>
                    <div class="card-content">
                      <h3 class="h3 card-title">
                        <a href="#">Running Sneaker Shoes</a>
                      </h3>
                      <div
                        class="product-price-line-3 product-card-price"
                        data-id="12345"
                        data-price-raw="1500000"
                        data-original-raw="1808500"
                        data-discount-percentage="17"
                      >
                        <div class="discounted-price-group">
                          <span class="discounted-price">1.500.000đ</span>

                          <span class="original-price">1.808.500đ</span>
                        </div>

                        <p class="discount-value">Giảm: 50%</p>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="product-item">
                  <div class="product-card" tabindex="0">
                    <figure class="card-banner">
                      <img
                        src="./assets/images/product-1.jpg"
                        width="312"
                        height="350"
                        alt="Running Sneaker Shoes"
                        class="image-contain"
                      />

                      <div class="card-badge">New</div>

                      <ul class="card-action-list">
                        <li class="card-action-item">
                          <button
                            class="card-action-btn"
                            aria-labelledby="card-label-1"
                          >
                            <ion-icon name="cart-outline"></ion-icon>
                          </button>

                          <div class="card-action-tooltip" id="card-label-1">
                            Thêm vào giỏ hàng
                          </div>
                        </li>

                        <li class="card-action-item">
                          <button
                            class="card-action-btn"
                            aria-labelledby="card-label-2"
                          >
                            <ion-icon name="heart-outline"></ion-icon>
                          </button>

                          <div class="card-action-tooltip" id="card-label-2">
                            Thêm vào mục yêu thích
                          </div>
                        </li>
                      </ul>
                    </figure>
                    <div class="card-content">
                      <h3 class="h3 card-title">
                        <a href="#">Running Sneaker Shoes</a>
                      </h3>
                      <div
                        class="product-price-line-3 product-card-price"
                        data-id="12345"
                        data-price-raw="1500000"
                        data-origi
                        nal-raw="1808500"
                        data-discount-percentage="17"
                      >
                        <div class="discounted-price-group">
                          <span class="discounted-price">1.500.000đ</span>

                          <span class="original-price">1.808.500đ</span>
                        </div>

                        <p class="discount-value">Giảm: 40%</p>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </section>
      </article>
    </main>
    <!--
- #FOOTER
-->
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
    <div id="toast-message" class="toast-message">
      <i class="fas fa-check-circle"></i> <span></span>
    </div>

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

    <script src="${pageContext.request.contextPath}/assets/script/product-popup.js"></script>

  </body>
</html>
