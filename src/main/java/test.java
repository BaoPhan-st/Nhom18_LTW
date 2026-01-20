import DTO.MenuDTO;
import model.Banner;
import services.MenuService;

public class test {
    public static void main(String[] args) {
        MenuService homeService=new MenuService();

        MenuDTO homePage = homeService.buildMenuPage();
        Banner banner= homePage.getBannerMenu();

        if (homePage.getBannerMenu() == null) {
            System.out.println("banner = NULL");
        } else {
            System.out.println("banner FOUND");
            System.out.println("title = " + banner.getTitle());
            System.out.println("img = " + banner.getImgUrl());
            System.out.println("link = " + banner.getLinkUrl());
            System.out.println("position = " + banner.getPosition());
        }
    }
}
