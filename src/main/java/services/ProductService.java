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
                        PromotionResult pr = promotionService.calculateBestPromotion(product.getId());
                        String finalPrice = promotionService.formatVND(pr.getFinalPrice());
                        String price = promotionService.formatVND(product.getPrice());
                        String mainImgURL = productImgService.getMainImg(product.getId());
                        String discountValue = promotionService.getDiscountValueString(pr.getBestPromotion());
                        ProductDTO dto = new ProductDTO(
                                        product.getId(),
                                        product.getName(),
                                        price,
                                        finalPrice,
                                        mainImgURL,
                                        discountValue,
                                        isNew);
                        result.add(dto);
                }
                result.sort(Comparator.comparing(ProductDTO::getFinalPrice));

                if (result.size() > 3) {
                        return result.subList(0, 3);
                }
                return result;
        }

        public List<ProductDTO> getAllProducts() {
                List<Product> products = productDao.findAllActive();
                List<ProductDTO> result = new ArrayList<>();

                for (Product p : products) {
                        boolean isNew = productDao.isNew(p.getId());
                        PromotionResult pr = promotionService.calculateBestPromotion(p.getId());
                        String finalPrice = promotionService.formatVND(pr.getFinalPrice());
                        String price = promotionService.formatVND(p.getPrice());
                        String mainImgURL = productImgService.getMainImg(p.getId());
                        String discountValue = promotionService.getDiscountValueString(pr.getBestPromotion());

                        ProductDTO dto = new ProductDTO(
                                        p.getId(),
                                        p.getName(),
                                        price,
                                        finalPrice,
                                        mainImgURL,
                                        discountValue,
                                        isNew);
                        result.add(dto);
                }

                return result;
        }

        public List<ProductDTO> getProductsByBrand(int brandId) {
                int limit = 16;

                List<Product> products = productDao.findByBrandLimit(brandId, limit);

                List<ProductDTO> result = new ArrayList<>();

                for (Product p : products) {
                        boolean isNew = productDao.isNew(p.getId());
                        PromotionResult pr = promotionService.calculateBestPromotion(p.getId());
                        String finalPrice = promotionService.formatVND(pr.getFinalPrice());
                        String price = promotionService.formatVND(p.getPrice());
                        String mainImgURL = productImgService.getMainImg(p.getId());
                        String discountValue = promotionService.getDiscountValueString(pr.getBestPromotion());

                        ProductDTO dto = new ProductDTO(
                                        p.getId(),
                                        p.getName(),
                                        price,
                                        finalPrice,
                                        mainImgURL,
                                        discountValue,
                                        isNew);
                        result.add(dto);
                }

                return result;
        }

        public List<ProductDTO> getProductsPage(int page, int pageSize) {
                int safePage = Math.max(page, 1);
                int limit = pageSize;
                int offset = (safePage - 1) * limit;

                List<Product> products = productDao.findActivePage(limit, offset);
                List<ProductDTO> result = new ArrayList<>();

                for (Product p : products) {
                        boolean isNew = productDao.isNew(p.getId());
                        PromotionResult pr = promotionService.calculateBestPromotion(p.getId());
                        String finalPrice = promotionService.formatVND(pr.getFinalPrice());
                        String price = promotionService.formatVND(p.getPrice());
                        String mainImgURL = productImgService.getMainImg(p.getId());
                        String discountValue = promotionService.getDiscountValueString(pr.getBestPromotion());

                        result.add(new ProductDTO(
                                        p.getId(), p.getName(), price, finalPrice, mainImgURL, discountValue, isNew));
                }
                return result;
        }

        public int getTotalPages(int pageSize) {
                int total = productDao.countActive(); // ví dụ 100
                return (int) Math.ceil(total * 1.0 / pageSize); // 12 => 9 trang
        }

        public List<ProductDTO> searchProducts(String keyword, int page, int pageSize) {
                int safePage = Math.max(page, 1);
                int offset = (safePage - 1) * pageSize;
                List<Product> products = productDao.searchByName(keyword, pageSize, offset);
                List<ProductDTO> result = new ArrayList<>();
                for (Product p : products) {
                        boolean isNew = productDao.isNew(p.getId());
                        PromotionResult pr = promotionService.calculateBestPromotion(p.getId());
                        String finalPrice = promotionService.formatVND(pr.getFinalPrice());
                        String price = promotionService.formatVND(p.getPrice());
                        String mainImgURL = productImgService.getMainImg(p.getId());
                        String discountValue = promotionService.getDiscountValueString(pr.getBestPromotion());
                        result.add(new ProductDTO(
                                        p.getId(), p.getName(), price, finalPrice, mainImgURL, discountValue, isNew));
                }
                return result;
        }

        public int getSearchTotalPages(String keyword, int pageSize) {
                int total = productDao.countSearchResults(keyword);
                return (int) Math.ceil(total * 1.0 / pageSize);
        }

        // Lọc sản phẩm theo nhiều tiêu chí
        public List<ProductDTO> filterProducts(String keyword, List<Integer> brandIds,
                        List<Integer> sizeIds, List<Integer> colorIds,
                        java.math.BigDecimal minPrice, java.math.BigDecimal maxPrice,
                        String sortBy, int page, int pageSize) {
                int safePage = Math.max(page, 1);
                int offset = (safePage - 1) * pageSize;

                List<Product> products = productDao.filterProducts(keyword, brandIds, sizeIds, colorIds,
                                minPrice, maxPrice, sortBy, pageSize, offset);
                List<ProductDTO> result = new ArrayList<>();

                for (Product p : products) {
                        boolean isNew = productDao.isNew(p.getId());
                        PromotionResult pr = promotionService.calculateBestPromotion(p.getId());
                        String finalPrice = promotionService.formatVND(pr.getFinalPrice());
                        String price = promotionService.formatVND(p.getPrice());
                        String mainImgURL = productImgService.getMainImg(p.getId());
                        String discountValue = promotionService.getDiscountValueString(pr.getBestPromotion());

                        result.add(new ProductDTO(
                                        p.getId(), p.getName(), price, finalPrice, mainImgURL, discountValue, isNew));
                }
                return result;
        }

        // Tính tổng số trang sau khi lọc
        public int getFilteredTotalPages(String keyword, List<Integer> brandIds,
                        List<Integer> sizeIds, List<Integer> colorIds,
                        java.math.BigDecimal minPrice, java.math.BigDecimal maxPrice,
                        int pageSize) {
                int total = productDao.countFilteredProducts(keyword, brandIds, sizeIds, colorIds, minPrice, maxPrice);
                return (int) Math.ceil(total * 1.0 / pageSize);
        }
}
