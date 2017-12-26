package com.augmentum.oes.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.augmentum.oes.Constants;

public class PropertyUtil {
    private static Properties property = null;

    static {
        InputStream ins = null;

        try {
            ins = PropertyUtil.class.getClassLoader().getResourceAsStream(Constants.APP_PROPERTIES);
            property = new Properties();
            property.load(ins);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (ins != null) {
                try {
                    ins.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Load configuration file
     * @param parameter key in app.properties
     * @return parameter value in app.properties
     */
    public static String getProperty(String key) {
        return property.getProperty(key);
    }
}
