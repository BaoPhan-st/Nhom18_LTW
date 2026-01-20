/* =========================================================
   1. HÀM HIỂN THỊ TOAST (Thông báo)
   ========================================================= */
function showToast(message) {
    const toast = document.getElementById("toast-message");
    if (toast) {
        toast.querySelector("span").textContent = message;
        toast.classList.add("show");
        setTimeout(() => toast.classList.remove("show"), 3000);
    }
}

document.addEventListener("DOMContentLoaded", function () {
    /* =========================================================
       2. XỬ LÝ NÚT YÊU THÍCH & MỞ POPUP TỪ DANH SÁCH
       ========================================================= */
    const actionBtns = document.querySelectorAll(".card-action-btn");
    const popup = document.getElementById("cartPopup");

    if (popup) {
        actionBtns.forEach((btn) => {
            btn.addEventListener("click", function (e) {
                e.preventDefault();
                const icon = this.querySelector("ion-icon");
                const iconName = icon ? icon.getAttribute("name") : "";

                if (iconName === "heart-outline") {
                    showToast("Đã thêm sản phẩm vào Yêu thích!");
                }

                if (iconName === "cart-outline") {
                    popup.classList.add("active");
                }
            });
        });
    }

    /* =========================================================
       3. LOGIC BÊN TRONG POPUP (Đóng, Chọn màu, Size, Số lượng)
       ========================================================= */
    const popupClose = document.querySelector(".cart-close");
    if (popupClose && popup) {
        popupClose.addEventListener("click", () => popup.classList.remove("active"));
    }

    window.addEventListener("click", (e) => {
        if (e.target === popup) popup.classList.remove("active");
    });

    // Chọn Màu & Size
    const colorItems = document.querySelectorAll("#popupColors .popup-color-item");
    colorItems.forEach((item) => {
        item.addEventListener("click", () => {
            colorItems.forEach((i) => i.classList.remove("selected"));
            item.classList.add("selected");
        });
    });

    const sizeItems = document.querySelectorAll("#popupSizes .popup-size-item");
    sizeItems.forEach((item) => {
        item.addEventListener("click", () => {
            sizeItems.forEach((i) => i.classList.remove("selected"));
            item.classList.add("selected");
        });
    });

    // Số lượng
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
    }

    /* =========================================================
       4. XỬ LÝ FILTER BUTTON (Giữ màu khi chọn hãng)
       ========================================================= */
    const filterBtns = document.querySelectorAll(".filter-btn");

    filterBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            // Tìm và xóa class active cũ
            const currentActive = document.querySelector(".filter-btn.active");
            if (currentActive) {
                currentActive.classList.remove("active");
            }

            // Thêm class active vào nút vừa bấm
            this.classList.add("active");
        });
    });

    /* =========================================================
       5. HÀM GLOBAL (Dùng để load dữ liệu động vào popup)
       ========================================================= */
    window.showProductPopup = (data) => {
        if (data.image) document.getElementById("popupImg").src = data.image;
        if (data.name) document.getElementById("popupName").textContent = data.name;
        if (data.price) document.getElementById("popupPrice").textContent = data.price;
        if (qtyInput) qtyInput.value = 1;
        if (popup) popup.classList.add("active");
    };
});