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

@WebServlet({"/admin/accounts", "/admin/wishlist"})
public class AdminUserController extends HttpServlet
{
    private final UserDao userDao = new UserDao();
    private final WishlistDao wishlistDao = new WishlistDao();
    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/wishlist"))
        {
            // Load wishlist data
            request.setAttribute("wishlists", wishlistDao.findAll());
            request.setAttribute("contentPage", "/admin-wishlist.jsp");
            request.setAttribute("active", "admin/wishlist");
        } else
        {
            // DELETTE BUTTON
            String deleteId = request.getParameter("delete");
            if (deleteId != null)
            {
                userDao.delete(Integer.parseInt(deleteId));
                response.sendRedirect(request.getContextPath() + "/admin/accounts");
                return;
            }

            // EDIT BUTTON (load user into form)
            User user;
            String editId = request.getParameter("user");

            if (editId != null)
            {
                user = userDao.findById(Integer.parseInt(editId));
            } else
            {
                user = new User();
            }

            // load list
            request.setAttribute("user", user);
            request.setAttribute("users", userDao.findAll());
            request.setAttribute("contentPage", "/admin-accounts.jsp");
            request.setAttribute("active", "admin/accounts");
        }
        request.getRequestDispatcher("/Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();

        if (uri.endsWith("/admin/wishlist"))
        {
            // Handle wishlist CRUD


            response.sendRedirect(request.getContextPath() + "/admin/wishlist");
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
        u.setIsActive(Boolean.parseBoolean(request.getParameter("is_active")));

        u.setCreatedAt(LocalDateTime.now());

        String rawPassword = request.getParameter("password");
        if (rawPassword != null && !rawPassword.isBlank())
        {
            u.setPasswordHash(BCrypt.hashpw(rawPassword, BCrypt.gensalt()));
        }
        if (isCreate)
        {
            u.setCreatedAt(LocalDateTime.now());
            userDao.insertUser(u);
        } else
        {
            u.setId(Integer.parseInt(id));
            userDao.update(u);
        }

        response.sendRedirect(request.getContextPath() + "/admin/accounts");
    }

}
