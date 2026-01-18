package controller.admin;

import dao.UserDao;
import dao.admin.user.WishlistDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.user.User;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet({"/accounts", "/wishlist"})
public class AdminUserController extends HttpServlet {
    private UserDao userDao = new UserDao();
    private WishlistDao wishlistDao = new WishlistDao();

    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/wishlist")) {
            // Load wishlist data
            request.setAttribute("wishlists", wishlistDao.findAll());
            request.setAttribute("contentPage", "/admin-wishlist.jsp");
            request.setAttribute("active", "wishlist");
        } else {

            // DELETTE BUTTON
            String deleteId = request.getParameter("delete");
            if (deleteId != null) {
                userDao.delete(Integer.parseInt(deleteId));
                response.sendRedirect(request.getContextPath() + "/accounts");
                return;
            }

            // EDIT BUTTON (load user into form)
            User user;
            String editId = request.getParameter("user");

            if (editId != null) { user = userDao.findById(Integer.parseInt(editId)); }
            else{ user = new User(); }

            // load list
            request.setAttribute("user", user);
            request.setAttribute("users", userDao.findAll());
            request.setAttribute("contentPage", "/admin-accounts.jsp");
            request.setAttribute("active", "accounts");
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.endsWith("/wishlist")) {
            // Handle wishlist CRUD

            response.sendRedirect(request.getContextPath() + "/wishlist");
            return;
        }
        // Handle account CRUD
        String id = request.getParameter("id");
        boolean isCreate = (id == null || id.isEmpty());

        User u = new User();
        u.setFullName(request.getParameter("full_name"));
        u.setPhoneNumber(request.getParameter("phone_number"));
        u.setAddress(request.getParameter("address"));
        u.setRole(request.getParameter("role"));
        u.setEmail(request.getParameter("email"));
        u.setActive(Boolean.parseBoolean(request.getParameter("is_active")));
        u.setCreatedAt(LocalDateTime.now());

        String onPassword = request.getParameter("password");
        if (onPassword != null && !onPassword.isEmpty()) {
            u.setPasswordHash(BCrypt.hashpw(onPassword, BCrypt.gensalt()));
        }

        if (isCreate) {
            userDao.insertUser(u);
        } else {
            u.setId(Integer.parseInt(id));
            userDao.update(u);
        }

        response.sendRedirect(request.getContextPath() + uri);
    }

}
