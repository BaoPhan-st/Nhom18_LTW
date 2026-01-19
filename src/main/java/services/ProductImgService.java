package services;

import dao.Product.ProductDaoImage;
import model.product.ProductMainImage;

public class ProductImgService {
    ProductDaoImage productDaoImage = new ProductDaoImage();
    public String getMainImg(int idP){
        ProductMainImage productMainImage = productDaoImage.findMainImage(idP);
        String mainImg= productMainImage.getImgUrl();
        return mainImg;
    }


}
