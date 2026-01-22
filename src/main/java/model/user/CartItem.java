package model.user;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable {

    @ColumnName("user_id")
    private int userId;
    @ColumnName("product_id")
    private int productId;
    @ColumnName("color_id")
    private int colorId;
    @ColumnName("size_id")
    private int sizeId;

    private int quantity;
    private BigDecimal price;
    @ColumnName("total_price")
    private BigDecimal totalPrice; // generated column

    public CartItem() {}

    // ===== GETTERS =====
    public int getUserId() { return userId; }
    public int getProductId() { return productId; }
    public int getColorId() { return colorId; }
    public int getSizeId() { return sizeId; }
    public int getQuantity() { return quantity; }
    public BigDecimal getPrice() { return price; }
    public BigDecimal getTotalPrice() { return totalPrice; }

    // ===== SETTERS =====
    public void setUserId(int userId) { this.userId = userId; }
    public void setProductId(int productId) { this.productId = productId; }
    public void setColorId(int colorId) { this.colorId = colorId; }
    public void setSizeId(int sizeId) { this.sizeId = sizeId; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public void setTotalPrice(BigDecimal totalPrice) { this.totalPrice = totalPrice; }
}
