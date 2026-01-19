package model.product;

import java.io.Serializable;

public class Brand implements Serializable {
    private int id;
    private String name;
    private String logo_url;
    private boolean is_active;

    public Brand() {
    }

    public String getLogo_url() {
        return logo_url;
    }

    public void setLogo_url(String logo_url) {
        this.logo_url = logo_url;
    }

    public boolean isActive() {
        return is_active;
    }

    public void setActive(boolean is_active) {
        this.is_active = is_active;
    }

    public Brand(int id, String name, String logo_url, boolean is_active) {
        this.id = id;
        this.name = name;
        this.logo_url = logo_url;
        this.is_active= is_active;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogoUrl() {
        return logo_url;
    }

    public void setLogoUrl(String logo_url) {
        this.logo_url = logo_url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}

