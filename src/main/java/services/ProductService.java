package services;

import DTO.ProductDTO;
import dao.Product.ProductDao;
import model.product.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ProductService {
    ProductDao productDao = new ProductDao();
    PromotionService promotionService = new PromotionService();
   ProductImgService productImgService = new ProductImgService();

    public List<ProductDTO> findTop3CheapestProductsInPromotion() {
        List<Product> products = productDao.findProductsInPromotion();
        List<ProductDTO> result = new ArrayList<>();
        for (Product product : products) {
            boolean isNew = productDao.isNew(product.getId());
            PromotionResult pr =
                    promotionService.calculateBestPromotion(product.getId());
            String finalPrice = promotionService.formatVND(pr.getFinalPrice());
            String price = promotionService.formatVND(product.getPrice());
            String mainImgURL =
                    productImgService.getMainImg(product.getId());
            String discountValue =
                    promotionService.getDiscountValueString(pr.getBestPromotion());
            ProductDTO dto = new ProductDTO(
                    product.getId(),
                    product.getName(),
                    price,
                    finalPrice,
                    mainImgURL,
                    discountValue,
                    isNew
            );
            result.add(dto);
        }
        result.sort(Comparator.comparing(ProductDTO::getFinalPrice));

        if (result.size() > 3) {
            return result.subList(0, 3);
        }
        return result;
    }
    public List<ProductDTO> getProductsByBrand(int brandId) {
        int limit = 16;

        List<Product> products =
                productDao.findByBrandLimit(brandId, limit);

        List<ProductDTO> result = new ArrayList<>();

        for (Product p : products) {
            boolean isNew= productDao.isNew(p.getId());
            PromotionResult pr =
                    promotionService.calculateBestPromotion(p.getId());
            String finalPrice = promotionService.formatVND(pr.getFinalPrice());
            String price = promotionService.formatVND(p.getPrice());
            String mainImgURL =
                    productImgService.getMainImg(p.getId());
            String discountValue =
                    promotionService.getDiscountValueString(pr.getBestPromotion());

            ProductDTO dto = new ProductDTO(
                    p.getId(),
                    p.getName(),
                    price,
                    finalPrice,
                    mainImgURL,
                    discountValue,
                    isNew
            );
            result.add(dto);
        }

        return result;
    }

}




