package services;

import dao.admin.user.ProductDao;
import model.product.Product;

import java.util.List;

public class ProductService
{
    private final ProductDao productDao;

    public ProductService()
    {
        this.productDao = new ProductDao();
    }

    public List<Product> getAllProducts()
    {
        return productDao.findAll();
    }

    public Product getProductById(int id)
    {
        return productDao.findById(id);
    }

    public boolean addProduct(Product product)
    {
        if (product == null)
        {
            return false;
        }
        return productDao.insert(product);
    }

    public boolean updateProduct(Product product)
    {
        if (product == null || product.getId() <= 0)
        {
            return false;
        }
        return productDao.update(product);
    }

    public boolean deleteProduct(int id)
    {
        if (id <= 0)
        {
            return false;
        }
        return productDao.delete(id);
    }
}
