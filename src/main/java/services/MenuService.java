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
        dto.setBannerMenu(bannerDao.findByPosition("menu_top"));
        dto.setBannerSpecialP(bannerDao.findByPosition("menu_special-product"));
        dto.setSpecialProduct(productService.findTopCheapestProductsInPromotion());
        dto.setBannerCollection(bannerDao.findByPositions("menu_collection"));
        dto.setBrandList(brandDao.findAllActive());

        if ("all".equalsIgnoreCase(brandId)) {
            dto.setBestSeller(productService.getAllBestSellers());
        } else {
            int id = Integer.parseInt(brandId);
            dto.setBestSeller(productService.getProductsByBrand(id));
        }
        return dto;
    }
    }








