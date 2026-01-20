package controller.admin;

import dao.admin.product.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.product.Product;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/products", "/admin/variants"})
public class AdminProductController extends HttpServlet {
    private final ProductDao productDao = new ProductDao();

    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/variants")) {
            request.setAttribute("contentPage", "/admin-variants.jsp");
            request.setAttribute("active", "admin/variants");
        } else {
            try {
                String idParam = request.getParameter("id");
                String nameParam = request.getParameter("name");
                String brandIdParam = request.getParameter("brandId");

                Integer id = null;
                Integer brandId = null;

                try {
                    if (idParam != null && !idParam.isBlank())
                        id = Integer.parseInt(idParam);

                    if (brandIdParam != null && !brandIdParam.isBlank())
                        brandId = Integer.parseInt(brandIdParam);
                } catch (NumberFormatException ignored) {
                }

                List<Product> products;

                if (id != null ||
                        (nameParam != null && !nameParam.isBlank()) ||
                        brandId != null) {
                    products = productDao.findWithFilter(id, nameParam, brandId);
                } else {
                    products = productDao.findAll();
                }

                request.setAttribute("products", products);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", e.getMessage());
            }

            // ĐÚNG TÊN JSP DÙNG
            request.setAttribute("brands", List.of());

            // ===== EDIT =====
            String editId = request.getParameter("edit");
            if (editId != null) {
                Product p = productDao.findById(Integer.parseInt(editId));
                request.setAttribute("product", p);
            } else {
                request.setAttribute("product", new Product());
            }

            request.setAttribute("contentPage", "/admin-products.jsp");
            request.setAttribute("active", "admin/products");
        }

        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/variants")) {
            // Handle variant CRUD


            response.sendRedirect(request.getContextPath() + "/admin/variants");
        } else {
            // Handle product CRUD


            response.sendRedirect(request.getContextPath() + "/admin/products");
        }
    }
}