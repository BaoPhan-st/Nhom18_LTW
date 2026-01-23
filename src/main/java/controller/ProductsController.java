package controller;

import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductsController extends HttpServlet {

    private ProductService productService;
    private static final int PAGE_SIZE = 12;

    @Override
    public void init() {
        productService = new ProductService();
    }

    private int parseInt(String s, int def) {
        try { return Integer.parseInt(s); } catch (Exception e) { return def; }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String searchQuery = req.getParameter("q");
        int page = parseInt(req.getParameter("page"), 1);

        List<ProductDTO> productList;
        int totalPages;

        // Kiểm tra xem có từ khóa tìm kiếm không
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            // CÓ từ khóa -> tìm kiếm
            searchQuery = searchQuery.trim();
            totalPages = Math.max(1, productService.getSearchTotalPages(searchQuery, PAGE_SIZE));

            if (page < 1) page = 1;
            if (page > totalPages) page = totalPages;

            productList = productService.searchProducts(searchQuery, page, PAGE_SIZE);
            req.setAttribute("searchQuery", searchQuery);  // Truyền từ khóa ra JSP
        } else {
            // KHÔNG có từ khóa -> hiển thị tất cả
            totalPages = Math.max(1, productService.getTotalPages(PAGE_SIZE));

            if (page < 1) page = 1;
            if (page > totalPages) page = totalPages;

            productList = productService.getProductsPage(page, PAGE_SIZE);
        }

        req.setAttribute("productList", productList);
        req.setAttribute("page", page);
        req.setAttribute("totalPages", totalPages);

        boolean isAjax = "1".equals(req.getParameter("ajax"));
        if (isAjax) {
            req.getRequestDispatcher("/products_fragment.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/products.jsp").forward(req, resp);
        }
    }
}
