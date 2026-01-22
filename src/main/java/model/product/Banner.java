package model.product;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.sql.Time;

public class Banner
{
    private int id;
    private String title;

    @ColumnName("img_url")
    private String imgURL;

    @ColumnName("link_url")
    private String linkURL;

    @ColumnName("target_type")
    private String targetType;

    @ColumnName("target_entity_id")
    private int targetEntityID;

    private String position;

    @ColumnName("sort_order")
    private int sortOrder;

    @ColumnName("is_active")
    private boolean isActive;

    @ColumnName("start_date")
    private Time startDate;

    @ColumnName("end_date")
    private Time endDate;

    public Banner (int id, String title, String imgURL, String linkURL, String targetType, int targetEntityID, String position, int sortOrder, boolean isActive, Time startDate, Time endDate)
    {
        this.id = id;
        this.title = title;
        this.imgURL = imgURL;
        this.linkURL = linkURL;
        this.targetType = targetType;
        this.targetEntityID = targetEntityID;
        this.position = position;
        this.sortOrder = sortOrder;
        this.isActive = isActive;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId () { return id;}
    public String getTitle () { return title; }
    public String getImgURL () { return imgURL; }
    public String getLinkURL () { return linkURL; }
    public String getTargetType () { return targetType; }
    public int getTargetEntityID () { return targetEntityID; }
    public String getPosition () { return position; }
    public int getSortOrder () { return sortOrder; }
    public boolean isActive () { return isActive; }
    public Time getStartDate () { return startDate; }
    public Time getEndDate () { return endDate; }

    public void setId (int id) { this.id = id; }
    public void setTitle (String title) { this.title = title; }
    public void setImgURL (String imgURL) { this.imgURL = imgURL; }
    public void setLinkURL (String linkURL) { this.linkURL = linkURL; }
    public void setTargetType (String targetType) { this.targetType = targetType; }
    public void setTargetEntityID (int targetEntityID) { this.targetEntityID = targetEntityID; }
    public void setPosition (String position) { this.position = position; }
    public void setSortOrder (int sortOrder) { this.sortOrder = sortOrder; }
    public void setActive (boolean active) { isActive = active; }
    public void setStartDate (Time startDate) { this.startDate = startDate; }
    public void setEndDate (Time endDate) { this.endDate = endDate; }
}
