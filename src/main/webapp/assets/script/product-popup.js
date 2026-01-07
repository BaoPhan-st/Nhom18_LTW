/* =========================================================
   1. HÀM HIỂN THỊ TOAST (Thông báo)
   ========================================================= */
function showToast(message) {
    const toast = document.getElementById("toast-message");
    if (toast) {
        toast.querySelector("span").textContent = message;
        toast.classList.add("show");
        // Tự động ẩn sau 3 giây
        setTimeout(() => toast.classList.remove("show"), 3000);
    }
}

document.addEventListener("DOMContentLoaded", function () {
    /* =========================================================
       2. XỬ LÝ NÚT YÊU THÍCH & MỞ POPUP TỪ DANH SÁCH
       ========================================================= */
    const actionBtns = document.querySelectorAll(".card-action-btn");
    const popup = document.getElementById("cartPopup");

    // Nếu trang này không có popup thì dừng lại để tránh lỗi
    if (!popup) return;

    actionBtns.forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.preventDefault();

            const icon = this.querySelector("ion-icon");
            const iconName = icon ? icon.getAttribute("name") : "";

            // Xử lý nút Yêu thích
            if (iconName === "heart-outline") {
                showToast("Đã thêm sản phẩm vào Yêu thích!");
            }

            // Xử lý nút Giỏ hàng (Mở popup)
            if (iconName === "cart-outline") {
                popup.classList.add("active");
                // Lưu ý: Ở đây bạn cần logic để lấy dữ liệu sản phẩm tương ứng
                // và gọi hàm showProductPopup(data) nếu muốn load động.
            }
        });
    });

    /* =========================================================
       3. LOGIC BÊN TRONG POPUP (Đóng, Chọn màu, Size, Số lượng)
       ========================================================= */
    const popupClose = document.querySelector(".cart-close");

    // Đóng popup
    if(popupClose) {
        popupClose.addEventListener("click", () => popup.classList.remove("active"));
    }

    window.addEventListener("click", (e) => {
        if (e.target === popup) popup.classList.remove("active");
    });

    // Chọn Màu
    const colorItems = document.querySelectorAll("#popupColors .popup-color-item");
    colorItems.forEach((item) => {
        item.addEventListener("click", () => {
            colorItems.forEach((i) => i.classList.remove("selected"));
            item.classList.add("selected");
        });
    });

    // Chọn Size
    const sizeItems = document.querySelectorAll("#popupSizes .popup-size-item");
    sizeItems.forEach((item) => {
        item.addEventListener("click", () => {
            sizeItems.forEach((i) => i.classList.remove("selected"));
            item.classList.add("selected");
        });
    });

    // Tăng giảm Số lượng
    const qtyInput = document.getElementById("popupQty");
    const minusBtn = document.querySelector(".qty-group .minus");
    const plusBtn = document.querySelector(".qty-group .plus");

    if (qtyInput && minusBtn && plusBtn) {
        minusBtn.addEventListener("click", () => {
            let val = parseInt(qtyInput.value) || 1;
            if (val > 1) qtyInput.value = val - 1;
        });

        plusBtn.addEventListener("click", () => {
            let val = parseInt(qtyInput.value) || 1;
            qtyInput.value = val + 1;
        });

        qtyInput.addEventListener("input", () => {
            if (qtyInput.value < 1) qtyInput.value = 1;
        });
    }

    // Nút Thêm vào giỏ hàng (Trong Popup)
    const addToCartBtn = document.querySelector(".popup-add-cart");
    if(addToCartBtn) {
        addToCartBtn.addEventListener("click", () => {
            // Lấy dữ liệu để gửi đi (nếu cần)
            // const name = document.getElementById("popupName").textContent;
            // const color = document.querySelector("#popupColors .selected")?.dataset.value;
            // const size = document.querySelector("#popupSizes .selected")?.dataset.value;
            // const qty = document.getElementById("popupQty").value;

            showToast(`Đã thêm sản phẩm vào Giỏ hàng!`);
            popup.classList.remove("active");
        });
    }

    /* =========================================================
       4. HÀM GLOBAL ĐỂ GỌI TỪ BÊN NGOÀI (Nếu cần dùng onclick)
       ========================================================= */
    window.showProductPopup = (data) => {
        if (data.image) document.getElementById("popupImg").src = data.image;
        if (data.name) document.getElementById("popupName").textContent = data.name;
        if (data.original) document.getElementById("popupOriginal").textContent = data.original;
        if (data.price) document.getElementById("popupPrice").textContent = data.price;
        if (data.discount) document.getElementById("popupDiscount").textContent = data.discount;

        // Reset số lượng về 1
        if(qtyInput) qtyInput.value = 1;

        popup.classList.add("active");
    };
});