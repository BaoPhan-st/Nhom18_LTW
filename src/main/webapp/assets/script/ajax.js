document.addEventListener("click", function (e) {
    if (e.target.classList.contains("page-number")) {
        const page = e.target.dataset.page;

        fetch(`${CONTEXT_PATH}/products?page=${page}&ajax=1`)
            .then(res => res.text())
            .then(html => {
                document.getElementById("productsContainer").innerHTML = html;
            });
    }
});