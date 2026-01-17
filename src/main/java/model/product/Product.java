package model.product;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Time;

public class Product implements Serializable
{
    private int id;
    private String name;
    private String description;
    private BigDecimal price;

    @ColumnName("brand_id")
    private int brandID;

    @ColumnName("added_at")
    private Time addedAt;

    @ColumnName("is_discontinue")
    private boolean isDiscontinue;

    @ColumnName("is_available")
    private boolean isAvailable;

    public Product(){}
    public Product (int id, String name, String description, BigDecimal price, int brandID, Time addedAt, boolean isDiscontinue, boolean isAvailable)
    {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.brandID = brandID;
        this.addedAt = addedAt;
        this.isDiscontinue = isDiscontinue;
        this.isAvailable = isAvailable;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getDescription() { return description; }
    public BigDecimal getPrice() { return price; }
    public int getBrandID() { return brandID; }
    public Time getAddedAt() { return addedAt; }
    public boolean isDiscontinue() { return isDiscontinue; }
    public boolean isAvailable () { return isAvailable; }

    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setDescription(String description) { this.description = description; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public void setBrandID(int brandID) { this.brandID = brandID; }
    public void setAddedAt(Time addedAt) { this.addedAt = addedAt; }
    public void setDiscontinue(boolean discontinue) { isDiscontinue = discontinue; }
    public void setIsAvailable(boolean isAvailable) { this.isAvailable = isAvailable; }

    @Override
    public String toString()
    {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description +'\''+
                ", price=" + price +
                ", brandID=" + brandID +
                ", addedAt=" + addedAt +
                ", isDiscontinue=" + isDiscontinue +
                ", isAvailable=" + isAvailable + '}';
    }
}
