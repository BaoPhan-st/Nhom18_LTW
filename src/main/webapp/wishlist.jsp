<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wishlist - BHD SPORT SHOES</title>

    <link rel="icon" href="/Nhom18_LTW/assets/favicon_io/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"/>
</head>

<body id="top">

<jsp:include page="header.jsp" />

<div class="container">
    <div class="breadcrumb-container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/menu.jsp">Trang Chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Danh sách yêu thích của bạn</li>
            </ol>
        </nav>
    </div>
</div>

<main class="cart-page-content wishlist-page-content">
    <div class="container">
        <h1 class="cart-header">Danh sách yêu thích</h1>

        <div class="cart-items-list wishlist-items-list">

            <div class="product-item">
                <div class="product-details">
                    <img src="assets/images/product-1.jpg" alt="Nike Air Force 1 '07" class="product-image" />
                    <div class="product-info">
                        <h2 class="product-name">
                            <a href="${pageContext.request.contextPath}/chitietsanpham.jsp" class="product-link">Nike Air Force 1 '07</a>
                        </h2>
                        <div class="product-price-line-3c">
                            <div class="discounted-price-group">
                                <span class="discounted-price">650.000 VNĐ</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-actions wishlist-actions">
                    <button class="action-btn add-to-cart-btn"
                            onclick="openPopup(this)"
                            data-img="assets/images/product-1.jpg"
                            data-name="Nike Air Force 1 '07"
                            data-price="650.000 VNĐ"
                            data-original=""
                            data-discount="">
                        Thêm vào Giỏ hàng
                    </button>
                    <button class="action-btn delete-btn">Xoá</button>
                </div>
            </div>

            <hr class="separator" />

            <div class="product-item">
                <div class="product-details">
                    <img src="assets/images/product-2.jpg" alt="Nike Jordan" class="product-image" />
                    <div class="product-info">
                        <h2 class="product-name">
                            <a href="products.jsp" class="product-link">Nike Jordan High</a>
                        </h2>
                        <div class="product-price-line-3c">
                            <div class="discounted-price-group">
                                <span class="discounted-price">899.000 VNĐ</span>
                                <span class="original-price">1.200.000 VNĐ</span>
                            </div>
                            <p class="discount-value">Giảm: 25%</p>
                        </div>
                    </div>
                </div>
                <div class="product-actions wishlist-actions">
                    <button class="action-btn add-to-cart-btn"
                            onclick="openPopup(this)"
                            data-img="assets/images/product-2.jpg"
                            data-name="Nike Jordan High"
                            data-price="899.000 VNĐ"
                            data-original="1.200.000 VNĐ"
                            data-discount="-25%">
                        Thêm vào Giỏ hàng
                    </button>
                    <button class="action-btn delete-btn">Xoá</button>
                </div>
            </div>

            <hr class="separator" />
        </div>
    </div>
</main>

<jsp:include page="footer.jsp" />


<div id="cartPopup" class="cart-modal">
    <div class="cart-modal-content">
        <span class="cart-close">&times;</span>
        <div class="cart-product-box">
            <img src="" class="cart-product-img" id="popupImg" alt="Product Image"/>
            <div class="cart-info">
                <h2 id="popupName">Tên sản phẩm</h2>
                <div class="price-line">
                    <span class="price-sale" id="popupPrice">0đ</span>
                    <span class="price-original" id="popupOriginal"></span>
                    <span class="price-discount" id="popupDiscount"></span>
                </div>

                <div class="popup-option-block">
                    <label>Màu sắc:</label>
                    <div class="popup-color-list" id="popupColors">
                        <div class="popup-color-item selected" data-value="Trắng" style="--c: #ffffff"></div>
                        <div class="popup-color-item" data-value="Đen" style="--c: #000000"></div>
                        <div class="popup-color-item" data-value="Xanh" style="--c: #007bff"></div>
                    </div>
                </div>

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

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<script src="${pageContext.request.contextPath}/assets/script/reponsive.js"></script>

<script src="${pageContext.request.contextPath}/assets/script/product-popup.js"></script>
</body>
</html>