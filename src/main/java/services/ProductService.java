package services;

import DTO.ProductDTO;
import dao.Product.ProductDao;
import model.product.Product;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ProductService {
    ProductDao productDao = new ProductDao();
    PromotionService promotionService = new PromotionService();
    ProductImgService productImgService = new ProductImgService();

    private ProductDTO mapToProductDTO(Product p) {

        boolean isNew = productDao.isNew(p.getId());

        PromotionResult pr =
                promotionService.calculateBestPromotion(p.getId());

        String finalPrice =
                promotionService.formatVND(pr.getFinalPrice());

        String price =
                promotionService.formatVND(p.getPrice());

        String mainImgURL =
                productImgService.getMainImg(p.getId());

        String discountValue =
                promotionService.getDiscountValueString(
                        pr.getBestPromotion()
                );

        return new ProductDTO(
                p.getId(),
                p.getName(),
                price,
                finalPrice,
                mainImgURL,
                discountValue,
                isNew
        );
    }

    private List<ProductDTO> mapToProductDTOList(List<Product> products) {
        List<ProductDTO> result = new ArrayList<>();
        for (Product p : products) {
            result.add(mapToProductDTO(p));
        }
        return result;
    }

    public List<ProductDTO> findTopCheapestProductsInPromotion(int limit) {

        List<Product> products =
                productDao.findProductsInPromotion();

        List<ProductDTO> result =
                mapToProductDTOList(products);

        result.sort(Comparator.comparing(ProductDTO::getFinalPrice));

        if (result.size() > limit) {
            return result.subList(0, limit);
        }

        return result;
    }

    public List<ProductDTO> getProductsByBrand(int brandId, int limit) {

        List<Product> products =
                productDao.findByBrandLimit(brandId, limit);

        return mapToProductDTOList(products);
    }

    public List<ProductDTO> getAllBestSellers(int limit) {

        List<Product> products =
                productDao.getAllBestSeller(limit);

        return mapToProductDTOList(products);
    }

    public ProductDTO getProductById(int id) {

        Product p = productDao.findById(id);

        if (p == null) {
            return null;
        }

        return mapToProductDTO(p);
    }

    public String getDes(int productId) {
        return productDao.getDes(productId);
    }

    public List<ProductDTO> getRelatedProduct(int productId, int limit) {

        Product currentProduct = productDao.findById(productId);

        if (currentProduct == null) {
            return Collections.emptyList();
        }
        List<Product> products =
                productDao.getRelatedProduct(
                        currentProduct.getId(),
                        currentProduct.getBrandId(),
                        currentProduct.getPrice(),
                        limit
                );

        return mapToProductDTOList(products);
    }








}




