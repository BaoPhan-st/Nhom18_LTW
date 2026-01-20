package model.product;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class Brand
{
    private int id;
    private String name;

    @ColumnName("logo_url")
    private String logoURL;
    public Brand () {}
    public Brand(int id, String name, String logoURL)
    {
        this.id = id;
        this.name = name;
        this.logoURL = logoURL;
    }
    public int getId() { return id; }
    public String getName() { return name; }
    public String getLogoURL() { return logoURL; }

    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setLogoURL(String logoURL) { this.logoURL = logoURL;}
}
