package dao.Order;

import dao.JDBIConnector;
import model.Order.Order;
import model.user.CartItem;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import services.PromotionService;

import java.math.BigDecimal;
import java.util.Map;

public class OrderDao {

    private PromotionService promotionService;

    public int insertOrder(Handle handle, int userId, Map<String, CartItem> cart) {

        BigDecimal subTotal = BigDecimal.ZERO;

        for (CartItem item : cart.values()) {
            subTotal = subTotal.add(promotionService.parsePrice(item.getFinalPrice()));
        }

        BigDecimal shippingFee = BigDecimal.ZERO;
        BigDecimal grandTotal = subTotal.add(shippingFee);

        return handle.createUpdate("""
            INSERT INTO orders
            (user_id, sub_total, shipping_fee, grand_total,
             order_status, payment_status)
            VALUES
            (:user_id, :sub_total, :shipping_fee, :grand_total,
             'NEW', 'UNPAID')
        """)
                .bind("user_id", userId)
                .bind("sub_total", subTotal)
                .bind("shipping_fee", shippingFee)
                .bind("grand_total", grandTotal)
                .executeAndReturnGeneratedKeys("id")
                .mapTo(Integer.class)
                .one();
    }
}
