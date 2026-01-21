package controller.admin;

import dao.admin.product.BrandDao;
import dao.admin.product.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.product.Product;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/products", "/admin/variants"})
public class AdminProductController extends HttpServlet
{
    private final ProductDao productDao = new ProductDao();
    private final BrandDao brandDao = new BrandDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/variants"))
        {
            request.setAttribute("contentPage", "/admin-variants.jsp");
            request.setAttribute("active", "admin/variants");
        }
        else
        {
            List<Product> products = List.of();

            try
            {
                String idParam = request.getParameter("id");
                String nameParam = request.getParameter("name");
                if (nameParam != null && nameParam.isBlank()) nameParam = null;

                String brandIdParam = request.getParameter("brandId");
                if (brandIdParam != null && brandIdParam.isBlank()) brandIdParam = null;

                Integer id = null;
                Integer brandId = null;

                try
                {
                    if (idParam != null && !idParam.isBlank())
                        id = Integer.parseInt(idParam);

                    if (brandIdParam != null && !brandIdParam.isBlank())
                        brandId = Integer.parseInt(brandIdParam);
                }
                catch (NumberFormatException ignored) {}

                if (id != null ||
                        (nameParam != null && !nameParam.trim().isEmpty()) ||
                        brandId != null)
                {
                    products = productDao.findWithFilter(id, nameParam, brandId);
                }
                else
                {
                    products = productDao.findAll();
                }

                request.setAttribute("products", products);
            }
            catch (Exception e)
            {
                e.printStackTrace();
                request.setAttribute("error", e.getMessage());
            }

            request.setAttribute("brands", brandDao.findAll());

            // ===== EDIT =====
            String editId = request.getParameter("edit");
            if (editId != null && !editId.isBlank())
            {
                try
                {
                    Product p = productDao.findById(Integer.parseInt(editId));
                    if (p != null)
                    {
                        request.setAttribute("product", p);
                        request.setAttribute("isEdit", true);
                    } else
                    {
                        request.setAttribute("product", new Product());
                        request.setAttribute("isEdit", false);
                        request.setAttribute("error", "Product not found");
                    }
                } catch (NumberFormatException e)
                {
                    request.setAttribute("product", new Product());
                    request.setAttribute("isEdit", false);
                    request.setAttribute("error", "Invalid product ID");
                }
            }
            else
            {
                request.setAttribute("product", new Product());
                request.setAttribute("isEdit", false);
            }

            request.setAttribute("contentPage", "/admin-products.jsp");
            request.setAttribute("active", "admin/products");
        }

        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/variants"))
        {
            // Handle variant CRUD


            response.sendRedirect(request.getContextPath() + "/admin/variants");
        } else
        {
            // Handle product CRUD
            String deleteId = request.getParameter("deleteId");
            if (deleteId != null && !deleteId.isBlank())
            {
                try
                {
                    productDao.delete(Integer.parseInt(deleteId));
                } catch (NumberFormatException ignore) {}
                response.sendRedirect(request.getContextPath() + "/admin/products");
                return;
            }
            // ADD && DELETTE
            String idParam = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceParam = request.getParameter("price");
            String brandIdParam = request.getParameter("brandId");

            Product product = new Product();
            if (idParam != null && !idParam.isBlank())
            {
                product.setId(Integer.parseInt(idParam));
            }
            product.setName(name);
            product.setDescription(description);
            product.setPrice(new java.math.BigDecimal(priceParam));
            product.setBrandId(Integer.parseInt(brandIdParam));
            product.setAddedAt(java.time.LocalDateTime.now());
            product.setDiscontinue(false);
            product.setAvailable(true);
            if (product.getId() > 0) productDao.update(product);
            else productDao.insert(product);

            response.sendRedirect(request.getContextPath() + "/admin/products");
        }
    }
}