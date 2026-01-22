package dao.admin.order;

import dao.JDBIConnector;
import model.order.Order;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class OrderDao
{
    private final Jdbi jdbi;
    public OrderDao(){ this.jdbi = JDBIConnector.getJdbi();}

//  DOANH THU NGAY HIEN TAI
    public Integer todayRevenue()
    {
        String sql = """
                SELECT COALESCE(SUM(grand_total), 0)
                FROM orders
                WHERE created_at >= CURDATE()
                AND created_at < CURDATE() + INTERVAL 1 DAY;
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .one());
    }

//  TONG SO ORDER DUOC TAO RA TRONG NGAY
    public List<Order> todayOrders()
    {
        String sql = """
            SELECT
                id,
                user_id,
                created_at,
                shipping_fee,
                sub_total,
                grand_total,
                shipping_address,
                phone_number,
                order_status,
                payment_method,
                payment_status,
                order_note
            FROM orders o
            WHERE o.created_at >= CURDATE()
            AND created_at < CURDATE() + INTERVAL 1 DAY;
        """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Order.class)
                        .list());
    }

//  TIM TAT CA DON HANG TRONG WEBSITE
    public List<Order> findAll()
    {
        String sql = """
            SELECT
                    id,
                    user_id,
                    created_at,
                    shipping_fee,
                    sub_total,
                    grand_total,
                    shipping_address,
                    phone_number,
                    order_status,
                    payment_method,
                    payment_status,
                    order_note
            FROM orders
            ORDER BY id ASC;
        """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    public Integer totalRevenue()
    {
        String sql = """
                SELECT SUM(grand_total) AS total_Revenue
                FROM orders
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public static void main (String[] args) {
        OrderDao orderDao = new OrderDao();
        System.out.println("today order: " + orderDao.todayOrders());
        System.out.println("total order: " + orderDao.findAll().size());
        System.out.println("today revenue: " + orderDao.todayRevenue());
        System.out.println("total revenue: " + orderDao.totalRevenue());
    }
}
