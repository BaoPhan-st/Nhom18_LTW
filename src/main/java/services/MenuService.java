package services;

import DTO.MenuDTO;
import dao.BannerDao;
import dao.Product.BrandDao;


public class MenuService {
    BannerDao bannerDao = new BannerDao();
    ProductService productService = new ProductService();
    BrandDao brandDao = new BrandDao();

    public MenuDTO buildMenuPage(){
        MenuDTO dto = new MenuDTO();
        dto.setBannerMenu(bannerDao.findByPosition("menu_top"));
        dto.setBannerSpecialP(bannerDao.findByPosition("menu_special-product"));
        dto.setSpecialProduct(productService.findTopCheapestProductsInPromotion());
        dto.setBannerCollection(bannerDao.findByPositions("menu_collection"));
        dto.setBestSeller(productService.getProductsByBrand(2));
        dto.setBrandList(brandDao.findAllActive());
        return dto;

    }
    }








