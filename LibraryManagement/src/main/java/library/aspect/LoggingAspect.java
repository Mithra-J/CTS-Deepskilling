package com.library.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.After;
import org.springframework.stereotype.Component;

// Ex 3,8: AOP Aspect for logging
@Aspect
@Component
public class LoggingAspect {

    // Ex 8: Before advice — runs before any method in com.library
    @Before("execution(* com.library.*.*(..))")
    public void logBefore() {
        System.out.println("AOP [Before]: Method execution starting...");
    }

    // Ex 8: After advice — runs after any method in com.library
    @After("execution(* com.library.*.*(..))")
    public void logAfter() {
        System.out.println("AOP [After]: Method execution completed.");
    }

    // Ex 3: Around advice — measures execution time
    @Around("execution(* com.library.service.*.*(..))")
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();

        Object result = joinPoint.proceed(); // run the actual method

        long end = System.currentTimeMillis();
        System.out.println("AOP [Around]: " + joinPoint.getSignature().getName() 
            + " executed in " + (end - start) + "ms");

        return result;
    }
}