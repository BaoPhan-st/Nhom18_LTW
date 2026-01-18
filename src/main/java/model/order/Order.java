package model.order;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.math.BigDecimal;
import java.sql.Time;

public class Order
{
    private int id;

    @ColumnName("user_id")
    private int userID;

    @ColumnName("create_at")
    private Time createAt;

    @ColumnName("shipping_fee")
    private BigDecimal shippingFee;

    @ColumnName("sub_total")
    private BigDecimal subTotal;

    @ColumnName("grand_total")
    private BigDecimal grandTotal;

    @ColumnName("shipping_address")
    private String shippingAddress;

    @ColumnName("phone_number")
    private String phoneNumber;

    @ColumnName("order_status")
    private String orderStatus;

    @ColumnName("payment_method")
    private String paymentMethod;

    @ColumnName("payment_status")
    private String paymentStatus;

    @ColumnName("order_note")
    private String orderNote;

    public Order() {}
    public Order(int id, int userID, Time createAt, BigDecimal shippingFee, BigDecimal subTotal, BigDecimal grandTotal, String shippingAddress, String phoneNumber, String orderStatus, String paymentMethod, String paymentStatus, String orderNote)
    {
        this.id = id;
        this.userID = userID;
        this.createAt = createAt;
        this.shippingFee = shippingFee;
        this.subTotal = subTotal;
        this.grandTotal = grandTotal;
        this.shippingAddress = shippingAddress;
        this.phoneNumber = phoneNumber;
        this.orderStatus = orderStatus;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.orderNote = orderNote;
    }
    public int getId() { return id; }
    public int getUserID() { return userID; }
    public Time getCreateAt() { return createAt; }
    public BigDecimal getShippingFee() { return shippingFee; }
    public BigDecimal getSubTotal() { return subTotal; }
    public BigDecimal getGrandTotal() { return grandTotal; }
    public String getShippingAddress() { return shippingAddress; }
    public String getPhoneNumber() { return phoneNumber; }
    public String getOrderStatus() { return orderStatus; }
    public String getPaymentMethod() { return paymentMethod; }
    public String getPaymentStatus() { return paymentStatus; }
    public String getOrderNote() { return orderNote; }

    public void setId(int id) { this.id = id; }
    public void setUserID(int userID) { this.userID = userID; }
    public void setCreateAt(Time createAt) { this.createAt = createAt; }
    public void setShippingFee(BigDecimal shippingFee) { this.shippingFee = shippingFee; }
    public void setSubTotal(BigDecimal subTotal) { this.subTotal = subTotal; }
    public void setGrandTotal(BigDecimal grandTotal) { this.grandTotal = grandTotal; }
    public void setShippingAddress(String shippingAddress) { this.shippingAddress = shippingAddress; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
    public void setOrderNote(String orderNote) { this.orderNote = orderNote; }
}
