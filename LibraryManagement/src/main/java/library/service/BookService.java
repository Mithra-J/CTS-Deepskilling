package com.library.service;

import com.library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {
    private BookRepository bookRepository;

    // Ex 7: Constructor injection
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
        System.out.println("BookService: Constructor injection done");
    }

    // Ex 2,7: Setter injection
    @Autowired
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
        System.out.println("BookService: Setter injection done");
    }

    public void addBook(String bookName) {
        System.out.println("BookService: addBook called");
        bookRepository.addBook(bookName);
    }

    public String findBook(String bookName) {
        System.out.println("BookService: findBook called");
        return bookRepository.findBook(bookName);
    }
}