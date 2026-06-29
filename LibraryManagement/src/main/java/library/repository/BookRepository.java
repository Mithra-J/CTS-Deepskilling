package com.library.repository;

import org.springframework.stereotype.Repository;

@Repository
public class BookRepository {
    public void addBook(String bookName) {
        System.out.println("BookRepository: Adding book - " + bookName);
    }

    public String findBook(String bookName) {
        System.out.println("BookRepository: Finding book - " + bookName);
        return bookName;
    }
}