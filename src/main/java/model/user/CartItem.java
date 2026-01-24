package model.user;

import java.io.Serializable;

public class CartItem implements Serializable
{
    private int productId;
    private String productName;
    private int sizeId;
    private int colorId;
    private double price;
    private int quantity;

    public CartItem () {}

    public CartItem (int productId, String productName, int sizeId, int colorId, double price, int quantity)
    {
        this.productId = productId;
        this.productName = productName;
        this.sizeId = sizeId;
        this.colorId = colorId;
        this.price = price;
        this.quantity = quantity;
    }

    // GET
    public int getProductId() { return productId; }
    public String getProductName() { return productName; }
    public int getSizeId() { return sizeId; }
    public int getColorId() { return colorId; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }

    // SET
    public void setProductId(int productId) { this.productId = productId; }
    public void setProductName(String productName) { this.productName = productName; }
    public void setSizeId(int sizeId) { this.sizeId = sizeId; }
    public void setColorId(int colorId) { this.colorId = colorId; }
    public void setPrice(double price) { this.price = price; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotalPrice() {
        return price * quantity;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", sizeId=" + sizeId +
                ", colorId=" + colorId +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}