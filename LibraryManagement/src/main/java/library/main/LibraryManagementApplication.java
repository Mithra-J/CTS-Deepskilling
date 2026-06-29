package com.library.main;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {
    public static void main(String[] args) {
        ApplicationContext context = 
            new ClassPathXmlApplicationContext("applicationContext.xml");

        BookService bookService = context.getBean("bookService", BookService.class);

        System.out.println("\n--- Testing addBook ---");
        bookService.addBook("The Great Gatsby");

        System.out.println("\n--- Testing findBook ---");
        String book = bookService.findBook("Clean Code");
        System.out.println("Found: " + book);

        ((ClassPathXmlApplicationContext) context).close();
    }
}