'use strict';

/**
 * Script chạy khi trang web tải xong
 */
document.addEventListener("DOMContentLoaded", function () {

    /* ==================================================
       1. XỬ LÝ MENU MOBILE (HEADER)
    ================================================== */
    const navOpenBtn = document.querySelector(".nav-open-btn");
    const navCloseBtn = document.querySelector(".nav-close-btn");
    const navbar = document.querySelector(".navbar");
    const overlay = document.querySelector(".overlay");

    const toggleNavbar = function () {
        if (navbar) navbar.classList.toggle("active");
        if (overlay) overlay.classList.toggle("active");
    };

    if (navOpenBtn) navOpenBtn.addEventListener("click", toggleNavbar);
    if (navCloseBtn) navCloseBtn.addEventListener("click", toggleNavbar);
    if (overlay) overlay.addEventListener("click", toggleNavbar);


    /* ==================================================
       2. XỬ LÝ THANH TÌM KIẾM (SEARCH)
    ================================================== */
    const searchToggleBtn = document.getElementById("searchToggleBtn"); // Nút kính lúp (nếu có)
    const searchForm = document.getElementById("search-form");
    const searchInput = document.getElementById("search-input");
    const searchCloseBtn = document.getElementById("searchCloseBtn"); // Nút X đóng tìm kiếm

    // Chỉ chạy khi các phần tử này tồn tại trên trang
    if (searchForm && searchInput) {

        const toggleSearch = function (e) {
            if (e) e.preventDefault();
            searchForm.classList.toggle("active");

            if (searchForm.classList.contains("active")) {
                searchInput.focus(); // Tự động trỏ chuột vào ô nhập
            } else {
                searchInput.value = ""; // Xóa chữ khi đóng
            }
        };

        // Nếu có nút mở tìm kiếm thì gán sự kiện
        if (searchToggleBtn) searchToggleBtn.addEventListener("click", toggleSearch);

        // Nếu có nút đóng tìm kiếm thì gán sự kiện
        if (searchCloseBtn) searchCloseBtn.addEventListener("click", toggleSearch);

        // Nhấn Enter để tìm
        searchInput.addEventListener("keydown", function (e) {
            if (e.key === "Enter") {
                // e.preventDefault(); // Bỏ comment dòng này nếu muốn chặn reload trang
                // Xử lý logic tìm kiếm ở đây nếu cần
                // toggleSearch(e);
            }
        });
    }
});