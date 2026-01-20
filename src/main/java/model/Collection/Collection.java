package model.Collection;

import java.io.Serializable;

public class Collection  implements Serializable {
    private int id;
    private String name;
    private String slug;
    private String ruleSet_type;
    private boolean is_active;

    public Collection() {
    }

    public Collection(int id, String name, String slug, String ruleSet_type, boolean is_active) {
        this.id = id;
        this.name = name;
        this.slug = slug;
        this.ruleSet_type = ruleSet_type;
        this.is_active = is_active;
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

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getRuleSetType() {
        return ruleSet_type;
    }

    public void setRuleSetType(String ruleSet_type) {
        this.ruleSet_type = ruleSet_type;
    }

    public boolean isActive() {
        return is_active;
    }

    public void setActive(boolean is_active) {
        this.is_active = is_active;
    }
}
