package services;

import dao.JDBIConnector;
import dao.Order.OrderDao;
import dao.Order.OrderDetailDao;
import dao.Product.ProductVariantDao;
import model.user.CartItem;
import org.jdbi.v3.core.Jdbi;

import java.util.Map;


public class OrderService {

    private final ProductVariantDao variantDao = new ProductVariantDao();
    private final OrderDao orderDao = new OrderDao();
    private final OrderDetailDao orderDetailDao = new OrderDetailDao();
    private final Jdbi jdbi;

    public OrderService() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public void placeOrder(int userId, Map<String, CartItem> cart) {

        jdbi.useTransaction(handle -> {

            for (CartItem item : cart.values()) {

                int stock = variantDao.lockAndGetStock(
                        handle,
                        item.getProductId(),
                        item.getColorId(),
                        item.getSizeId()
                );

                if (stock < item.getQuantity()) {
                    throw new RuntimeException(
                            "Sản phẩm " + item.getName() + " không đủ hàng"
                    );
                }
            }

            //  INSERT ORDER
            int orderId = orderDao.insertOrder(handle, userId, cart);

            //  INSERT ORDER DETAIL
            orderDetailDao.insertOrderDetails(handle, orderId, cart);

            //  UPDATE STOCK
            for (CartItem item : cart.values()) {

                int stock = variantDao.lockAndGetStock(
                        handle,
                        item.getProductId(),
                        item.getColorId(),
                        item.getSizeId()
                );

                variantDao.updateStock(
                        handle,
                        item.getProductId(),
                        item.getColorId(),
                        item.getSizeId(),
                        stock - item.getQuantity()
                );
            }
        });
    }
}
