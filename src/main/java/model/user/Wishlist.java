package model.user;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.time.LocalDateTime;

public class Wishlist
{
    @ColumnName("user_id")
    private int userID;

    @ColumnName("product_id")
    private int productID;

    @ColumnName("added_at")
    private LocalDateTime addedAt;

    public Wishlist(int userID, int productID, LocalDateTime addedAt)
    {
        this.userID = userID;
        this.productID = productID;
        this.addedAt = addedAt;
    }

    public int getUserID(){ return userID; }
    public int getProductID() { return productID; }
    public LocalDateTime getAddedAt() { return addedAt; }

    public void setUserID(int userID) { this.userID = userID; }
    public void setProductID(int productID) { this.productID = productID; }
    public void setAddedAt(LocalDateTime addedAt) { this.addedAt = addedAt; }

}
