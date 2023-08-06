package com.example.demo.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;
import com.example.demo.book.BookService;

@RestController
@RequestMapping(path = "api/v1/book")
public class BookController {

    private final BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping
    public List<Book> getStudents() {
        return bookService.getBooks();
    }

    @PostMapping
    public void registerNewBook(@RequestBody Book book) {
        bookService.addNewBook(book);
    }

    @DeleteMapping(path = "{bookId}")
    public void deleteBook(@PathVariable("bookId") Long bookId) {
        bookService.deleteStudent(bookId);
    }

    @PutMapping(path = "{bookId}")
    public void updateStudent(
            @PathVariable("bookId") Long bookId,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Long quantity) {
        bookService.updateBook(bookId,name,quantity);
    }

//    @GetMapping(path = "{bookId}")
//    public String getQuantityOfBook() {
//        return "Quantity of " + bookService.getBookById()
//    }

}
