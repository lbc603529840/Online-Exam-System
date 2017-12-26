package com.augmentum.oes.common;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.log4j.Logger;

import com.augmentum.oes.service.impl.UserServiceImpl;

public class LogMethodTime implements MethodInterceptor {
    private final static Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Override
    public Object invoke(MethodInvocation invocation) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object returnValue = invocation.proceed();
        String methodName = invocation.getMethod().getName();
        long endTime = System.currentTimeMillis();
        StringBuffer sb = new StringBuffer();
        sb.append(AppContext.getAppContext().getUsername());
        sb.append(":");
        sb.append(invocation.getMethod().getDeclaringClass().getSimpleName());
        sb.append(":");
        sb.append(methodName);
        sb.append(":");
        sb.append(endTime - startTime);
        sb.append("ms");
        logger.info(sb.toString());
        return returnValue;
    }
}
