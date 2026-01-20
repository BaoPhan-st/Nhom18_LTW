package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/admin/banners", "/admin/collections", "/admin/newsletter"})
public class AdminMarketingController extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/collections"))
        {
            // TODO: load collections


            request.setAttribute("contentPage", "/admin-collections.jsp");
            request.setAttribute("active", "admin/collections");

        } else if (uri.endsWith("/admin/newsletter"))
        {
            // TODO: load newsletter


            request.setAttribute("contentPage", "/admin-newsletter.jsp");
            request.setAttribute("active", "admin/newsletter");

        } else {
            // TODO: load banners


            request.setAttribute("contentPage", "/admin-banners.jsp");
            request.setAttribute("active", "admin/banners");
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/collections"))
        {
            // Handle collections CRUD


            response.sendRedirect(request.getContextPath() + "/admin/collections");
        } else if (uri.endsWith("/admin/newsletter"))
        {
            // Handle newsletter CRUD


            response.sendRedirect(request.getContextPath() + "/admin/newsletter");
        } else
        {
            // Handle banners CRUD


            response.sendRedirect(request.getContextPath() + "/admin/banners");
        }
    }
}
