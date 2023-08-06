package com.example.demo.book;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table
public class Book {
    @Id
    @SequenceGenerator(
            name = "book_sequence",
            sequenceName = "book_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "book_sequence"
    )
    private Long id;
    private String name;
    private String author;
    private LocalDate date_published;

    private Long quantity;

    public Book() {
    }

    public Book(Long id, String name, String author, LocalDate date_published, Long quantity) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.date_published = date_published;
        this.quantity = quantity;
    }



    public Book(String name, String author, LocalDate date_published, Long quantity) {
        this.name = name;
        this.author = author;
        this.date_published = date_published;
        this.quantity = quantity;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public LocalDate getDate_published() {
        return date_published;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setDate_published(LocalDate date_published) {
        this.date_published = date_published;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", date_published='" + date_published +'\'' +
                ", quantity=" + quantity +
                '}';
    }
}
