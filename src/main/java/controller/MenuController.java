package controller;

import java.io.IOException;

import DTO.MenuDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.MenuService;

@WebServlet("/menu")
public class MenuController extends HttpServlet {
    private MenuService homeService;

    @Override
    public void init() {
        homeService = new MenuService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MenuDTO homePage = homeService.buildMenuPage("all");
        req.setAttribute("menu", homePage);
        req.getRequestDispatcher("/menu.jsp").forward(req, resp);
    }
}