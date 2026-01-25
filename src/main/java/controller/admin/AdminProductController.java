package controller.admin;

import dao.Product.ColorDao;
import dao.Product.ProductVariantDao;
import dao.Product.SizeDao;
import dao.admin.product.BrandDao;
import dao.admin.product.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.product.Product;
import model.product.ProductVariant;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet({"/admin/products", "/admin/variants"})
public class AdminProductController extends HttpServlet
{
    private final ProductDao productDao = new ProductDao();
    private final BrandDao brandDao = new BrandDao();
    private final ProductVariantDao variantDao = new ProductVariantDao();
    private final ColorDao colorDao = new ColorDao();
    private final SizeDao sizeDao = new SizeDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/variants"))
        {
            request.setAttribute("variants", variantDao.findAllActive());
            request.setAttribute("sizes", sizeDao.findAll());
            request.setAttribute("colors", colorDao.findAll());
            if ("true".equals(request.getParameter("edit")))
            {
                Integer productId = null;
                Integer sizeId = null;
                Integer colorId = null;
                try {
                    if (request.getParameter("productId") != null &&
                        !request.getParameter("productId").isBlank())
                        productId = Integer.parseInt(request.getParameter("productId"));
                    if (request.getParameter("sizeId") != null &&
                            !request.getParameter("sizeId").isBlank())
                        productId = Integer.parseInt(request.getParameter("sizeId"));
                    if (request.getParameter("colorId") != null &&
                            !request.getParameter("colorId").isBlank())
                        productId = Integer.parseInt(request.getParameter("colorId"));

                } catch (NumberFormatException e) { e.printStackTrace();}
                request.setAttribute("variant", variantDao.findByProduct(productId));
            }

            request.setAttribute("contentPage", "/admin-variants.jsp");
            request.setAttribute("active", "admin/variants");
        }
        else
        {
            List<Product> products = productDao.findAll();

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
                    request.setAttribute("product", new Product().setAvailable(true));
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
            // ====== DELETE (available) ======
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
            // ADD && DELETE
            String idParam = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceParam = request.getParameter("price");
            String brandIdParam = request.getParameter("brandId");

            if (name == null || priceParam == null || brandIdParam == null)
            {
                response.sendRedirect(request.getContextPath() + "/admin/products");
                return;
            }

            BigDecimal price;
            try
            {
                price = new BigDecimal(priceParam);
            } catch (NumberFormatException ignored)
            {
                response.sendRedirect(request.getContextPath() + "/admin/products?error=price");
                return;
            }
            int brandId = Integer.parseInt(brandIdParam);

            boolean available = !"false".equalsIgnoreCase(request.getParameter("available"));

            Product product;
            if (idParam != null && !idParam.isBlank() && !"0".equals(idParam))
            {
                product = productDao.findById(Integer.parseInt(idParam));
                if (product == null || product.isDiscontinue())
                {
                    response.sendRedirect(request.getContextPath() + "/admin/products");
                    return;
                }
                product.setAvailable(available);
            } else
            {
                // ====== INSERT ======
                product = new Product();
                product.setAddedAt(java.time.LocalDateTime.now());
                product.setDiscontinue(false);
                product.setAvailable(available);
            }

            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setBrandId(brandId);

            // ====== SAVE ======
            if (product.getId() > 0) productDao.update(product);
            else productDao.insert(product);

            response.sendRedirect(request.getContextPath() + "/admin/products");
        }
    }
}