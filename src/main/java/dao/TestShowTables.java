package dao;

public class TestShowTables {
    public static void main(String[] args) {
        JDBIConnector.getJdbi().useHandle(handle -> {
            handle.createQuery("SHOW TABLES")
                    .mapTo(String.class)
                    .list()
                    .forEach(System.out::println);
        });
    }
}


