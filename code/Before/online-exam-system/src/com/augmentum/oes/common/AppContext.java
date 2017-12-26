package com.augmentum.oes.common;

import java.util.HashMap;
import java.util.Map;

import com.augmentum.oes.model.User;

public class AppContext {
    private AppContext() {}

    private static final ThreadLocal<AppContext> appContextThreadLocal = new ThreadLocal<AppContext>();
    private static String contextPath;

    public static String getContextPath() {
        return contextPath;
    }

    public static void setContextPath(String contextPath) {
        if (AppContext.contextPath == null) {
            AppContext.contextPath = contextPath;
        }
    }

    public static AppContext getAppContext() {
        AppContext appContext = appContextThreadLocal.get();

        if (appContext == null) {
            appContext = new AppContext();
            appContextThreadLocal.set(appContext);
        }

        return appContextThreadLocal.get();
    }

    private Map<String, Object> objectMap = new HashMap<String, Object>();

    public Map<String, Object> getObjectMap() {
        return objectMap;
    }

    public void setObjectMap(Map<String, Object> objectMap) {
        if (objectMap == null) {
            objectMap = new HashMap<String, Object>();
        }

        this.objectMap = objectMap;
    }

    public Object getObject(String key) {
        return objectMap.get(key);
    }

    public void addObject(String key, Object value) {
        objectMap.put(key, value);
    }

    public void clear() {
        objectMap.clear();
    }

    public User getUser() {
        User user = (User)objectMap.get("app_context_username");

        if (user != null) {
            return user;
        }

        return null;
    }

    public String getUsername() {
        User user = (User)objectMap.get("app_context_username");

        if (user != null) {
            return user.getUsername();
        }

        return "";
    }
}
