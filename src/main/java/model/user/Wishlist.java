package model.user;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.time.LocalDateTime;

public class Wishlist
{
    @ColumnName("user_id")
    private int idUser;

    @ColumnName("product_id")
    private int idProduct;

    @ColumnName("added_at")
    private LocalDateTime addedAt;

    public Wishlist() {}
    public Wishlist(int idUser, int idProduct, LocalDateTime addedAt)
    {
        this.idUser = idUser;
        this.idProduct = idProduct;
        this.addedAt = addedAt;
    }

    public int getIdUser(){ return idUser; }
    public int getIdProduct() { return idProduct; }
    public LocalDateTime getAddedAt() { return addedAt; }

    public void setIdUser(int idUser) { this.idUser = idUser; }
    public void setIdProduct(int idProduct) { this.idProduct = idProduct; }
    public void setAddedAt(LocalDateTime addedAt) { this.addedAt = addedAt; }

}
