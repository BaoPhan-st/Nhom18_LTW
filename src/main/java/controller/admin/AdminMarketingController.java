package controller.admin;

import dao.BannerDao;
import dao.admin.user.CollectionDao;
import dao.admin.user.NewsletterDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Banner;
import model.Collection.Collection;
import model.user.Newsletter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet({ "/admin/banners", "/admin/collections", "/admin/newsletter" })
public class AdminMarketingController extends HttpServlet {
    private final BannerDao bannerDao = new BannerDao();
    private final CollectionDao collectionDao = new CollectionDao();
    private final NewsletterDao newsletterDao = new NewsletterDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/collections")) {
            String name = request.getParameter("name");
            String ruleSet = request.getParameter("ruleSet");

            List<Collection> collections = (name != null || ruleSet != null)
                    ? collectionDao.filter(name, ruleSet)
                    : collectionDao.findAll();

            String editId = request.getParameter("edit");
            Collection collection;
            if (editId != null) {
                collection = collectionDao.findById(Integer.parseInt(editId));
            } else {
                collection = new Collection();
                collection.setActive(true);
            }

            request.setAttribute("collection", collection);
            request.setAttribute("collections", collections);
            request.setAttribute("contentPage", "/admin-views/admin-collections.jsp");
            request.setAttribute("active", "admin/collections");

        } else if (uri.endsWith("/admin/newsletter")) {
            String email = request.getParameter("email");
            String status = request.getParameter("status");

            List<Newsletter> newsletters = (email != null || status != null)
                    ? newsletterDao.filter(email, status)
                    : newsletterDao.findAll();

            request.setAttribute("newsletters", newsletters);
            request.setAttribute("contentPage", "/admin-views/admin-newsletter.jsp");
            request.setAttribute("active", "admin/newsletter");

        } else {
            List<Banner> banners = bannerDao.findAll();

            String editId = request.getParameter("edit");
            Banner banner;

            if (editId != null) {
                banner = bannerDao.findById(Integer.parseInt(editId));
            } else {
                banner = new Banner();
                banner.setActive(true);
            }

            request.setAttribute("banner", banner);
            request.setAttribute("banners", banners);
            request.setAttribute("contentPage", "/admin-views/admin-banners.jsp");
            request.setAttribute("active", "admin/banners");
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/collections")) {
            // DELETE
            String deleteId = request.getParameter("deleteId");
            if (deleteId != null && !deleteId.isBlank()) {
                collectionDao.delete(Integer.parseInt(deleteId));
                response.sendRedirect(request.getContextPath() + "/admin/collections");
                return;
            }

            // INSERT / UPDATE
            String idParam = request.getParameter("id");
            String name = request.getParameter("name");
            String slug = request.getParameter("slug");
            String ruleSet = request.getParameter("ruleSet");
            boolean active = request.getParameter("active") != null; // checkbox

            Collection collection = new Collection();
            if (idParam != null && !idParam.isBlank() && !"0".equals(idParam)) {
                collection = collectionDao.findById(Integer.parseInt(idParam));
            }

            if (collection != null) {
                collection.setName(name);
                collection.setSlug(slug);
                collection.setRuleSetType(ruleSet);
                collection.setActive(active);

                if (collection.getId() > 0) {
                    collectionDao.update(collection);
                } else {
                    collectionDao.insert(collection);
                }
            }

            response.sendRedirect(request.getContextPath() + "/admin/collections");

        } else if (uri.endsWith("/admin/newsletter")) {
            String deleteId = request.getParameter("deleteId");
            if (deleteId != null) {
                newsletterDao.delete(Integer.parseInt(deleteId));
            }
            response.sendRedirect(request.getContextPath() + "/admin/newsletter");
        } else {
            // DELETE
            String deleteId = request.getParameter("delete");
            if (deleteId != null) {
                bannerDao.delete(Integer.parseInt(deleteId));
                response.sendRedirect(request.getContextPath() + "/admin/banners");
                return;
            }
            // ADD / UPDATE
            Banner banner = new Banner();

            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                banner.setId(Integer.parseInt(idParam));
            }

            banner.setTitle(request.getParameter("title"));
            banner.setImgUrl(request.getParameter("imgUrl"));
            banner.setLinkUrl(request.getParameter("linkUrl"));
            banner.setPosition(request.getParameter("position"));
            banner.setSortOrder(Integer.parseInt(request.getParameter("sortOrder")));
            banner.setActive(Boolean.parseBoolean(request.getParameter("active")));

            String start = request.getParameter("startDate");
            String end = request.getParameter("endDate");

            if (start != null && !start.isEmpty()) {
                banner.setStartDate(LocalDateTime.parse(start));
            }
            if (end != null && !end.isEmpty()) {
                banner.setEndDate(LocalDateTime.parse(end));
            }

            if (banner.getId() > 0) {
                bannerDao.update(banner);
            } else {
                bannerDao.insert(banner);
            }
            response.sendRedirect(request.getContextPath() + "/admin/banners");
        }
    }
}
