package services;

import dao.UserDao;
import model.user.User;
import org.mindrot.jbcrypt.BCrypt;

import java.time.LocalDateTime;

public class UserServices {
    private final UserDao userDao;

    public UserServices(UserDao userDao) {
        this.userDao = userDao;
    }
    public UserServices() {
        this.userDao = new UserDao();
    }
    public UserDao getUserDao() {
        return userDao;
    }
    public User loginByEmail(String email, String password) {
        User user = userDao.findByEmail(email);
        if (user != null && BCrypt.checkpw(password, user.getPasswordHash())) {
            return user;
        }
        return null;
    }

    public boolean register(String fullName, String phone, String email, String password) {

        // check trùng email / phone
        if (userDao.findByEmail(email) != null ||
                userDao.findByPhone(phone) != null) {
            return false;
        }

        User user = new User();
        user.setFullName(fullName);
        user.setPhoneNumber(phone);
        user.setEmail(email);
        user.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt(12)));
        user.setRole("user");
        user.setActive(true);
        user.setCreatedAt(LocalDateTime.now());
        user.setFirebaseUID(null);

        return userDao.insertUser(user) > 0;
    }
    public User processSocialLogin(String email, String name, String firebase_uid, String provider) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            return user;
        } else {
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setFullName(name);
            newUser.setFirebaseUID(firebase_uid);
            newUser.setRole("user");
            userDao.insertUser(newUser);
            return newUser;
        }
    }
}

