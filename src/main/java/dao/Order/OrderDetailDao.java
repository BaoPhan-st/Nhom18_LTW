package dao.Order;

import dao.JDBIConnector;
import model.user.CartItem;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import services.PromotionService;

import java.math.BigDecimal;
import java.util.Map;

public class OrderDetailDao {

    public void insertOrderDetails(
            Handle handle,
            int orderId,
            Map<String, CartItem> cart,
            Map<String, BigDecimal> unitPrices
    ) {
        for (CartItem item : cart.values()) {

            BigDecimal unitPrice = unitPrices.get(item.getKey());
            BigDecimal subtotal =
                    unitPrice.multiply(BigDecimal.valueOf(item.getQuantity()));

            handle.createUpdate("""
            INSERT INTO order_detail
            (order_id, product_id, color_id, size_id,
             quantity, unit_price, subtotal)
            VALUES
            (:order_id, :product_id, :color_id, :size_id,
             :quantity, :unit_price, :subtotal)
        """)
                    .bind("order_id", orderId)
                    .bind("product_id", item.getProductId())
                    .bind("color_id", item.getColorId())
                    .bind("size_id", item.getSizeId())
                    .bind("quantity", item.getQuantity())
                    .bind("unit_price", unitPrice)
                    .bind("subtotal", subtotal)
                    .execute();
        }
    }

}
