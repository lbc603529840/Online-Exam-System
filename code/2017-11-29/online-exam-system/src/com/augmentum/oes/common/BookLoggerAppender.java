package com.augmentum.oes.common;

import org.apache.log4j.DailyRollingFileAppender;
import org.apache.log4j.Priority;

public class BookLoggerAppender extends DailyRollingFileAppender {
    @Override
    public boolean isAsSevereAsThreshold(Priority priority) {
        return this.getThreshold().equals(priority);
    }
}
