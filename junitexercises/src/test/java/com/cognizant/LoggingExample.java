package com.cognizant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingExample {
    private static final Logger logger = LoggerFactory.getLogger(LoggingExample.class);

    public static void main(String[] args) {
        logger.error("This is an error message");
        logger.warn("This is a warning message");
        logger.info("This is an info message");
        logger.debug("This is a debug message");

        // Parameterized logging — efficient, no string concat if log level is off
        String user = "Mithu";
        int age = 21;
        logger.info("User {} is {} years old", user, age);
    }
}