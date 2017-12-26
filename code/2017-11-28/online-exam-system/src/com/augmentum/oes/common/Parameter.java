package com.augmentum.oes.common;

import java.util.HashMap;
import java.util.Map;

public class Parameter {
    private Parameter() {}

    private static Parameter paremeter = new Parameter();

    public static Parameter getInstance() {
        return paremeter;
    }

    private static Map<String, Object> parameterMap = new HashMap<String, Object>();

    public Map<String, Object> getParameterMap() {
        return parameterMap;
    }

    public Object getParameter(String key) {
        return parameterMap.get(key);
    }

    public void addParameterMap(String key, Object value) {
        parameterMap.put(key, value);
    }

    public void clear() {
        parameterMap.clear();
    }
}
