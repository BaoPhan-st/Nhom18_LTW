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

        <a href="Menu.jsp" class="logo">
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
              <a href="Menu.jsp" class="navbar-link">Trang chủ</a>
            </li>

            <li class="navbar-item">
              <a href="gioithieu.html" class="navbar-link">Giới thiệu</a>
            </li>

            <li class="navbar-item">
              <a href="Products.jsp" class="navbar-link">Sản phẩm</a>
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
              <a href="login.jsp" class="nav-action-btn">
                <ion-icon name="person-outline"></ion-icon>
                <span class="nav-action-text">Đăng nhập / Đăng kí</span>
              </a>

              <div class="dropdown-content">
                <a href="login.jsp">Đăng nhập</a>
                <a href="register.jsp">Đăng ký</a>
              </div>
            </li>

            <li>
              <a href="WishList.jsp" class="nav-action-btn">
                <ion-icon name="heart-outline"></ion-icon>
                <span class="nav-action-text">Yêu thích</span>
              </a>
            </li>
            <li>
              <a href="Carts.jsp" class="nav-action-btn" title="Giỏ hàng">
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
    <div class="container">
      <div class="breadcrumb-container">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Menu.jsp">Trang Chủ</a></li>

            <li class="breadcrumb-item active" aria-current="page">
              Giới thiệu
            </li>
          </ol>
        </nav>
      </div>
    </div>
    <main class="GioiThieuPage">
      <div class="gioithieu-container container">
        <header class="page-header">
          <h1 class="h1">Về BHD - SPORT SHOES</h1>
          <p class="subtitle">Cùng Bạn Chinh Phục Mọi Hành Trình</p>
        </header>

        <hr class="header-divider" />

        <section class="section-content">
          <h2 class="h2 section-title">👟 Câu Chuyện Của Chúng Tôi</h2>

          <p>
            <strong>BHD - SPORT SHOES</strong> được thành lập với niềm đam mê
            cháy bỏng dành cho thể thao và văn hóa đường phố. Chúng tôi tin
            rằng, một đôi giày không chỉ là vật dụng bảo vệ đôi chân, mà còn là
            **người bạn đồng hành** trên mỗi chặng đường chinh phục mục tiêu, từ
            sân cỏ đến đường chạy marathon, hay đơn giản chỉ là những bước đi tự
            tin trong cuộc sống hàng ngày.
          </p>

          <p>
            Khởi nguồn từ một cửa hàng nhỏ, BHD đã phát triển thành thương hiệu
            đáng tin cậy, chuyên cung cấp **giày thể thao chính hãng 100%** từ
            các thương hiệu hàng đầu thế giới như Nike, Adidas, Puma, New
            Balance và nhiều hơn nữa.
          </p>
        </section>

        <section class="section-content">
          <h2 class="h2 section-title">✅ Cam Kết Chất Lượng</h2>

          <h3 class="h3">1. Chính Hãng Tuyệt Đối</h3>
          <p>
            Chúng tôi cam kết <strong>HOÀN TIỀN GẤP ĐÔI</strong> nếu phát hiện
            sản phẩm là hàng giả, hàng nhái. Mỗi đôi giày tại BHD đều có tem,
            mác, và giấy tờ chứng minh nguồn gốc rõ ràng.
          </p>

          <h3 class="h3">2. Giá Trị Thực</h3>
          <p>
            BHD luôn nỗ lực tối ưu hóa chi phí để mang đến mức giá cạnh tranh
            nhất, đảm bảo khách hàng nhận được **giá trị tốt nhất** đi kèm với
            chất lượng sản phẩm chính hãng.
          </p>

          <h3 class="h3">3. Dịch Vụ Tận Tâm</h3>
          <p>
            Đội ngũ chuyên viên tư vấn của chúng tôi luôn sẵn sàng hỗ trợ bạn
            tìm được đôi giày **phù hợp nhất** với nhu cầu, sở thích và phong
            cách cá nhân, đi kèm với chính sách bảo hành, đổi trả và bảo mật
            thông tin rõ ràng.
          </p>
        </section>

        <section class="section-content section-mission">
          <h2 class="h2 section-title">🌟 Sứ Mệnh & Tầm Nhìn</h2>

          <div class="mission-block">
            <h3 class="h3">Sứ Mệnh</h3>
            <p>
              Trở thành cầu nối tin cậy, cung cấp những sản phẩm giày thể thao
              chất lượng cao, giúp người Việt **nâng tầm phong cách sống** và
              đạt được hiệu suất tốt nhất trong hoạt động thể thao.
            </p>
          </div>

          <div class="mission-block">
            <h3 class="h3">Tầm Nhìn</h3>
            <p>
              Trong 5 năm tới, BHD - SPORT SHOES sẽ là hệ thống bán lẻ giày thể
              thao chính hãng hàng đầu Việt Nam với mạng lưới cửa hàng rộng khắp
              và nền tảng thương mại điện tử vững mạnh.
            </p>
          </div>

          <p class="final-cta">
            **BHD - SPORT SHOES:** Hãy bắt đầu hành trình của bạn ngay hôm nay!
          </p>
        </section>
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
                <a href="Carts.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Xem giỏ hàng</span>
                </a>
              </li>

              <li>
                <a href="WishList.jsp" class="footer-link">
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
            <a href="#" class="copyright-link">BHD-SPORT SHOES</a>.Cùng bạn
            chinh phục mọi hành trình
          </p>
        </div>
      </div>
    </footer>
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
  </body>
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
</html>
