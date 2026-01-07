package JavaMail;

public class EmailProperties {
    public static final String HOST_NAME = "smtp.gmail.com";
    public static final int SSL_PORT = 465;
    public static final int TSL_PORT = 587;

    public static final String APP_EMAIL = System.getenv("APP_EMAIL");
    public static final String APP_PASSWORD = System.getenv("APP_PASSWORD");
}
