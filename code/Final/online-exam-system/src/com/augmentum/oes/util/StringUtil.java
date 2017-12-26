package com.augmentum.oes.util;

public class StringUtil {
    /**
     * Determine whether the string is empty
     * @param a string parameter
     * @return true or false
     */
    public static boolean isEmpty(String data) {
        if (data == null || data.equals("")) {
            return true;
        }

        return false;
    }
}

