package com.nhom18.webshoes.util;

import org.checkerframework.checker.nullness.qual.NonNull;
import org.mindrot.jbcrypt.BCrypt;

public class Password
{
    public static @NonNull String hashPassword(String plainPassword)
    {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    public static boolean checkPassword(String plainPassword, String hashedPassword)
    {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}
