package services;

import DTO.MenuDTO;
import dao.BannerDao;
import dao.Product.BrandDao;

public class MenuService {
    BannerDao bannerDao = new BannerDao();
    ProductService productService = new ProductService();
    BrandDao brandDao = new BrandDao();

    public MenuDTO buildMenuPage(String brandId) {
        MenuDTO dto = new MenuDTO();
        dto.setBannerSpecialP(bannerDao.findByPosition("menu_special-product"));
        dto.setSpecialProduct(productService.findTopCheapestProductsInPromotion(9));
        dto.setBannerCollection(bannerDao.findByPositions("menu_collection"));
        dto.setBannerSlider(bannerDao.findByPositions("products_slide"));
        dto.setBrandList(brandDao.findAllActive());

        if ("all".equalsIgnoreCase(brandId)) {
            dto.setnewestProduct(productService.getNewestProducts(16));
        } else {
            int id = Integer.parseInt(brandId);
            dto.setnewestProduct(productService.getNewestByBrandLimit(id, 16));
        }
        return dto;
    }
}
