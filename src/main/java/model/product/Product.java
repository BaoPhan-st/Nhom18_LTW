package model.product;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Product implements Serializable {
    private int id;
    private String name;
    private String description;
    private java.math.BigDecimal price;
    private int brand_id;
    private LocalDateTime added_at;
    private boolean is_discontinue;
    private boolean is_available;

    public Product() {
    }

    public Product(int id, String name, String description, BigDecimal price, int brand_id, LocalDateTime added_at, boolean is_discontinue, boolean is_available) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.brand_id = brand_id;
        this.added_at = added_at;
        this.is_discontinue = is_discontinue;
        this.is_available = is_available;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getBrandId() {
        return brand_id;
    }

    public void setBrandId(int brand_id) {
        this.brand_id = brand_id;
    }

    public LocalDateTime getAddedAt() {
        return added_at;
    }

    public void setAddedAt(LocalDateTime added_at) {
        this.added_at = added_at;
    }

    public boolean isDiscontinue() {
        return is_discontinue;
    }

    public void setDiscontinue(boolean is_discontinue) {
        this.is_discontinue = is_discontinue;
    }

    public boolean isAvailable() {
        return is_available;
    }

    public void setAvailable(boolean is_available) {
        this.is_available = is_available;
    }
}
