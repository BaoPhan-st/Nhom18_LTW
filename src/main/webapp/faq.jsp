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
    <link rel="stylesheet" href="assets/css/style.css" />

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

            <a href="${pageContext.request.contextPath}/menu.jsp" class="logo">
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
                        <a href="${pageContext.request.contextPath}/menu.jsp" class="navbar-link">Trang chủ</a>
                    </li>

                    <li class="navbar-item">
                        <a href="${pageContext.request.contextPath}/gioithieu.jsp" class="navbar-link">Giới thiệu</a>
                    </li>

                    <li class="navbar-item">
                        <a href="${pageContext.request.contextPath}/products.jsp" class="navbar-link">Sản phẩm</a>
                    </li>

                    <li class="navbar-item">
                        <a href="${pageContext.request.contextPath}/lienhe.jsp" class="navbar-link">Liên hệ</a>
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
                        <a href="${pageContext.request.contextPath}/login.jsp" class="nav-action-btn">
                            <ion-icon name="person-outline"></ion-icon>
                            <span class="nav-action-text">Đăng nhập / Đăng kí</span>
                        </a>

                        <div class="dropdown-content">
                            <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                            <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
                        </div>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/wishlist.jsp" class="nav-action-btn">
                            <ion-icon name="heart-outline"></ion-icon>
                            <span class="nav-action-text">Yêu thích</span>
                        </a>
                    </li>
                    <li>
                        <a href="carts.jsp" class="nav-action-btn" title="Giỏ hàng">
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
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Trang Chủ</a></li>

            <li class="breadcrumb-item active" aria-current="page">
              Câu hỏi thường gặp
            </li>
          </ol>
        </nav>
      </div>
    </div>
    <main class="FAQPage">
      <div class="container faq-content">
        <h1 class="h2 faq-title" style="color: var(--rich-black-fogra-29)">
          CÂU HỎI THƯỜNG GẶP (FAQ)
        </h1>
        <p class="faq-subtitle">
          Giải đáp mọi thắc mắc của quý khách về sản phẩm và dịch vụ của BHD -
          SPORT SHOES.
        </p>

        <section class="faq-category">
          <h3 class="h3 category-title">
            <ion-icon name="shirt-outline"></ion-icon> VỀ SẢN PHẨM & CHẤT LƯỢNG
          </h3>

          <div class="faq-item">
            <button class="faq-question">
              Làm sao tôi biết giày tại BHD là hàng chính hãng?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>
                BHD - SPORT SHOES cam kết
                <strong>chỉ bán giày thể thao chính hãng 100%</strong> được nhập
                trực tiếp từ các nhà phân phối lớn của Nike, Adidas, Puma, v.v.
                Chúng tôi cam kết <strong>HOÀN TIỀN GẤP ĐÔI</strong> nếu quý
                khách phát hiện sản phẩm là hàng giả, hàng nhái (Fake).
              </p>
            </div>
          </div>

          <div class="faq-item">
            <button class="faq-question">
              Tôi có thể xem các đánh giá về chất lượng sản phẩm ở đâu?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>
                Quý khách có thể xem các đánh giá chân thật từ khách hàng đã mua
                sản phẩm ở ngay dưới phần mô tả của từng đôi giày. Ngoài ra, quý
                khách có thể tham khảo thêm trên Fanpage chính thức của BHD.
              </p>
            </div>
          </div>
        </section>

        <section class="faq-category">
          <h3 class="h3 category-title">
            <ion-icon name="cart-outline"></ion-icon> ĐẶT HÀNG & HỦY ĐƠN HÀNG
          </h3>

          <div class="faq-item">
            <button class="faq-question">
              Tôi có thể đặt hàng qua điện thoại không?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>
                Có. Quý khách hoàn toàn có thể đặt hàng trực tiếp qua Hotline:
                <strong>0332536387</strong>. Nhân viên chăm sóc khách hàng của
                chúng tôi sẽ hỗ trợ quý khách kiểm tra size, xác nhận thông tin
                và tạo đơn hàng trên hệ thống.
              </p>
            </div>
          </div>

          <div class="faq-item">
            <button class="faq-question">
              Làm sao để hủy một đơn hàng đã đặt?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>
                Quý khách vui lòng liên hệ ngay với BHD trong vòng
                <strong>1 giờ</strong> kể từ khi đặt hàng. Nếu đơn hàng chưa
                được chuyển giao cho đơn vị vận chuyển, chúng tôi sẽ hỗ trợ hủy
                đơn hàng mà không phát sinh phí.
              </p>
            </div>
          </div>
        </section>

        <section class="faq-category">
          <h3 class="h3 category-title">
            <ion-icon name="airplane-outline"></ion-icon> GIAO HÀNG & PHÍ VẬN
            CHUYỂN
          </h3>

          <div class="faq-item">
            <button class="faq-question">
              Thời gian giao hàng dự kiến là bao lâu?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>Thời gian giao hàng phụ thuộc vào địa chỉ nhận hàng:</p>
              <ul>
                <li>
                  <strong>Nội thành TP.HCM/Hà Nội:</strong> 1-2 ngày làm việc.
                </li>
                <li>
                  <strong>Các tỉnh thành khác:</strong> 3-5 ngày làm việc.
                </li>
              </ul>
              <p>Thời gian này không bao gồm Chủ nhật và các ngày lễ, Tết.</p>
            </div>
          </div>

          <div class="faq-item">
            <button class="faq-question">
              Phí vận chuyển được tính như thế nào?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>
                Phí vận chuyển sẽ được tính tự động dựa trên tổng trọng lượng
                đơn hàng và địa chỉ nhận hàng của quý khách. BHD thường xuyên có
                các chương trình <strong>Miễn phí vận chuyển</strong> cho đơn
                hàng đạt giá trị nhất định (ví dụ: trên 2.000.000 VNĐ).
              </p>
            </div>
          </div>
        </section>

        <section class="faq-category">
          <h3 class="h3 category-title">
            <ion-icon name="repeat-outline"></ion-icon> ĐỔI, TRẢ HÀNG & BẢO HÀNH
          </h3>

          <div class="faq-item">
            <button class="faq-question">
              Chính sách đổi trả hàng hóa của BHD như thế nào?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>
                BHD áp dụng chính sách đổi hàng trong vòng
                <strong>7 ngày</strong> kể từ ngày nhận hàng với điều kiện:
              </p>
              <ul>
                <li>Giày còn nguyên tem, mác, chưa qua sử dụng.</li>
                <li>Sản phẩm còn nguyên vẹn hộp đựng và phụ kiện đi kèm.</li>
                <li>
                  Chỉ chấp nhận đổi size hoặc đổi sang mẫu khác có giá trị bằng
                  hoặc lớn hơn.
                </li>
              </ul>
            </div>
          </div>

          <div class="faq-item">
            <button class="faq-question">
              Giày mua online có được bảo hành không?
              <ion-icon
                name="chevron-down-outline"
                class="toggle-icon"
              ></ion-icon>
            </button>
            <div class="faq-answer">
              <p>
                Có. Mọi sản phẩm giày chính hãng mua tại BHD đều được bảo hành
                <strong>03 tháng</strong> đối với các lỗi kỹ thuật từ nhà sản
                xuất (bung keo, đứt chỉ). Vui lòng xem chi tiết tại trang
                <strong>Chính sách Bảo hành</strong>.
              </p>
            </div>
          </div>
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
                <a href="${pageContext.request.contextPath}/account.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Tài khoản</span>
                </a>
              </li>

              <li>
                <a href="${pageContext.request.contextPath}/carts.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Xem giỏ hàng</span>
                </a>
              </li>

              <li>
                <a href="${pageContext.request.contextPath}/wishlist.jsp" class="footer-link">
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
                <a href="${pageContext.request.contextPath}/ChinhSachBaoMat.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Chính sách bảo mật</span>
                </a>
              </li>

              <li>
                <a href="${pageContext.request.contextPath}/ChinhSachBaoHanh.jsp" class="footer-link">
                  <ion-icon name="chevron-forward-outline"></ion-icon>

                  <span class="footer-link-text">Chính sách bảo hành</span>
                </a>
              </li>

              <li>
                <a href="${pageContext.request.contextPath}/huongdanmuahang.jsp" class="footer-link">
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
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const faqItems = document.querySelectorAll(".faq-item");

        faqItems.forEach((item) => {
          const question = item.querySelector(".faq-question");
          const answer = item.querySelector(".faq-answer");

          question.addEventListener("click", () => {
            faqItems.forEach((otherItem) => {
              if (otherItem !== item) {
                otherItem
                  .querySelector(".faq-question")
                  .classList.remove("active");
                otherItem.querySelector(".faq-answer").classList.remove("open");
              }
            });
            question.classList.toggle("active");
            answer.classList.toggle("open");
          });
        });
      });
    </script>
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
  </body>
</html>
