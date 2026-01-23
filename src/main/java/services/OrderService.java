package services;

import dao.JDBIConnector;
import dao.Order.OrderDao;
import dao.Order.OrderDetailDao;
import dao.Product.ProductVariantDao;
import model.user.CartItem;
import org.jdbi.v3.core.Jdbi;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;


public class OrderService {

    private final ProductVariantDao variantDao = new ProductVariantDao();
    private final OrderDao orderDao = new OrderDao();
    private final OrderDetailDao orderDetailDao = new OrderDetailDao();
    private final PromotionService promotionService = new PromotionService();

    private final Jdbi jdbi;

    public OrderService() {
        this.jdbi = JDBIConnector.getJdbi();
    }

    public void placeOrder(int userId, Map<String, CartItem> cart) {

        jdbi.useTransaction(handle -> {

            BigDecimal subTotal = BigDecimal.ZERO;
            Map<String, BigDecimal> unitPrices = new HashMap<>();

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

                BigDecimal unitPrice =
                        promotionService.parsePrice(item.getFinalPrice());

                unitPrices.put(item.getKey(), unitPrice);

                subTotal = subTotal.add(
                        unitPrice.multiply(BigDecimal.valueOf(item.getQuantity()))
                );
            }

            BigDecimal shippingFee = BigDecimal.ZERO;
            BigDecimal grandTotal = subTotal.add(shippingFee);

            int orderId = orderDao.insertOrder(
                    handle,
                    userId,
                    subTotal,
                    shippingFee,
                    grandTotal
            );

            orderDetailDao.insertOrderDetails(
                    handle,
                    orderId,
                    cart,
                    unitPrices
            );

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
