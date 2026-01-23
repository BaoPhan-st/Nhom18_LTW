<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon_io/favicon.ico" />

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
          style="background-image: url('${menu.bannerMenu.imgUrl}')"
        >
          <div class="container">
            <h2 class="h1 hero-title">${menu.bannerMenu.title}</h2>

            <p class="hero-text">
              ${menu.bannerMenu.slogan}
            </p>

            <button class="btn btn-primary">
              <a
                  href="${menu.bannerMenu.linkUrl}"
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

              <c:forEach var="banner" items="${menu.bannerCollection}">
                <li>
                  <div
                          class="collection-card"
                          style="
                                  background-image: url('${banner.imgUrl}');
                                  "
                  >
                    <h3 class="h4 card-title">
                        ${banner.title}
                    </h3>

                      <a href="${pageContext.request.contextPath}${banner.linkUrl}"
                         class="btn btn-secondary">
                      <span>Khám phá ngay</span>
                      <ion-icon
                              name="arrow-forward-outline"
                              aria-hidden="true"
                      ></ion-icon>
                    </a>
                  </div>
                </li>
              </c:forEach>

            </ul>
          </div>
        </section>


        <!--
        - #PRODUCT
      -->
        <section class="section product">
          <div class="container">
            <h2 class="h2 section-title">Sản phẩm mới</h2>

              <ul class="filter-list">
                  <li>
                      <a href="${pageContext.request.contextPath}/menufilter?brandId=all"
                         class="filter-btn ${param.brandId == 'all' || empty param.brandId ? 'active' : ''}">
                          All
                      </a>
                  </li>

                  <c:forEach items="${menu.brandList}" var="b">
                      <li>
                          <a href="${pageContext.request.contextPath}/menufilter?brandId=${b.id}"
                             class="filter-btn ${param.brandId == b.id.toString() ? 'active' : ''}">
                                  ${b.name}
                          </a>
                      </li>
                  </c:forEach>
              </ul>

              <ul class="product-list" id="productList">
                  <c:forEach items="${menu.bestSeller}" var="p">
                      <li class="product-item">
                          <div class="product-card" tabindex="0">

                              <!-- IMAGE -->
                              <figure class="card-banner">
                                  <img
                                          src="${p.mainImageUrl}"
                                          loading="lazy"
                                          alt="${p.name}"
                                          class="image-contain"
                                  />


                                  <!-- BADGE NEW -->
                                  <c:if test="${p.isNew}">
                                      <div class="card-badge">New</div>
                                  </c:if>
                              </figure>

                              <!-- CONTENT -->
                              <div class="card-content">
                                  <h3 class="h3 card-title">
                                      <a href="${pageContext.request.contextPath}/product?id=${p.id}">
                                              ${p.name}
                                      </a>
                                  </h3>

                                  <div class="product-card-price">
                                      <c:choose>
                                          <c:when test="${p.price eq p.finalPrice}">
                                              <span class="discounted-price">${p.price}</span>
                                          </c:when>
                                          <c:otherwise>
                                              <div class="price-row">
                                                  <span class="discounted-price">${p.finalPrice}</span>
                                                  <span class="original-price">${p.price}</span>
                                              </div>

                                              <c:if test="${not empty p.discountValue}">
                                                  <div class="discount-badge-wrapper">
                                                 <span class="discount-value">
                                                     Giảm: ${p.discountValue}
                                                 </span>
                                                  </div>
                                              </c:if>
                                          </c:otherwise>
                                      </c:choose>
                                  </div>
                              </div>

                          </div>
                      </li>
                  </c:forEach>
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
              <h2 class="h3 banner-title">${menu.bannerSpecialP.slogan}</h2>

              <a
                href="${menu.bannerSpecialP.linkUrl}"
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
                <span class="text">${menu.bannerSpecialP.title}</span>

                <span class="line"></span>
              </h2>

              <ul class="has-scrollbar">

                  <c:forEach items="${menu.specialProduct}" var="p">
                      <li class="product-item">
                          <div class="product-card" tabindex="0">

                              <!-- IMAGE -->
                              <figure class="card-banner">
                                  <img
                                          src="${p.mainImageUrl}"
                                          width="312"
                                          height="350"
                                          loading="lazy"
                                          alt="${p.name}"
                                          class="image-contain"
                                  />
                                  <!-- BADGE NEW -->
                                  <c:if test="${p.isNew}">
                                      <div class="card-badge">New</div>
                                  </c:if>
                              </figure>

                              <!-- CONTENT -->
                              <div class="card-content">
                                  <h3 class="h3 card-title">
                                      <a href="${pageContext.request.contextPath}/product?id=${p.id}">
                                              ${p.name}
                                      </a>
                                  </h3>

                                  <div class="product-card-price">
                                      <c:choose>
                                          <c:when test="${p.price eq p.finalPrice}">
                                              <span class="discounted-price">${p.price}</span>
                                          </c:when>
                                          <c:otherwise>
                                              <div class="price-row">
                                                  <span class="discounted-price">${p.finalPrice}</span>
                                                  <span class="original-price">${p.price}</span>
                                              </div>

                                              <c:if test="${not empty p.discountValue}">
                                                  <div class="discount-badge-wrapper">
                                                   <span class="discount-value">
                                                        Giảm: ${p.discountValue}
                                                   </span>
                                                  </div>
                                              </c:if>
                                          </c:otherwise>
                                      </c:choose>
                                  </div>
                              </div>

                          </div>
                      </li>
                  </c:forEach>
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
