package com.example.demo.book;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    private final BookRepository bookRepository;

    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> getBooks() {
        return bookRepository.findAll();
    }

//    public Optional<Book> getBookById(Long bookId) {
//        return bookRepository.findById(bookId);
//    }

    public void addNewBook(Book book) {

        Optional<Book> bookOptional = bookRepository.findBookByName(book.getName());
        if (bookOptional.isPresent()) {
            throw new IllegalStateException("Book exists already");
        }
        bookRepository.save(book);
    }

    public void deleteStudent(Long bookId) {
        boolean exists = bookRepository.existsById(bookId);
        if (!exists) {
            throw new IllegalStateException(
                    "Book with id " + bookId + " does not exist");
        }
        bookRepository.deleteById(bookId);
    }

    @Transactional
    public void updateBook(Long bookId, String name, Long quantity) {
        Book book = bookRepository.findById(bookId)
                .orElseThrow(() -> new IllegalStateException("Book with id " + bookId + " does not exist"));

//        if (name != null && name.length() > 0 && !Objects.equals(book.getName(), name)) {
//            book.setName(name);
//        }

        book.setQuantity(quantity);
//
//        if (name != null && name.length() > 0 && !Objects.equals(book.getName(), name)) {
//            book.setName(name);
//        }

    }
}
