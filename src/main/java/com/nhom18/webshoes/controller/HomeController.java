@WebServlet("/Products")
public class HomeController extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.getAllProducts();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Products.jsp");
        dispatcher.forward(request, response);
    }
}
