document.addEventListener("DOMContentLoaded", () => {
    const menuItems = document.querySelectorAll(".sidebar .menu li");
    const container = document.getElementById("content-container");

    let currentPage = localStorage.getItem("currentPage") || "admin-dashboard.jsp";

    // Hàm load page
    function loadPage(page) {
        fetch(page)
            .then(res => res.text())
            .then(html => {
                container.innerHTML = html;

                // Cập nhật active menu
                menuItems.forEach(item => {
                    if (item.getAttribute("data-page") === page) {
                        item.classList.add("active");
                    } else {
                        item.classList.remove("active");
                    }
                });

                // Lưu page hiện tại vào localStorage
                localStorage.setItem("currentPage", page);
            })
            .catch(e => console.error(e));
    }

    // Gán sự kiện click cho menu
    menuItems.forEach(item => {
        item.addEventListener("click", () => {
            const page = item.getAttribute("data-page");
            if (page && page !== "admin-logout.jsp") {
                loadPage(page);
            } else if (page === "admin-logout.jsp") {
                window.location.href = "admin-logout.jsp"; // logout
            }
        });
    });

    // Load page đầu tiên khi trang reload
    loadPage(currentPage);
});
