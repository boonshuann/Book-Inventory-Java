package com.example.demo.book;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;

@Configuration
public class BookConfig {

    @Bean
    CommandLineRunner commandLineRunner(BookRepository repository) {
        return  args -> {
            Book harry_potter_sorcerer_stone = new Book(
                    "Harry Potter and the Sorcerer's Stone",
                    "JK Rowling",
                    LocalDate.of(2000, Month.JANUARY,1),
                    1L
            );

            Book harry_potter_chamber_of_secrets = new Book(
                    "Harry Potter and the Chamber of Secrets",
                    "JK Rowling",
                    LocalDate.of(2001, Month.JANUARY,1),
                    1L
            );

            Book harry_potter_prisoner_of_azkaban = new Book(
                    "Harry Potter and the Prisoner of Azkaban",
                    "JK Rowling",
                    LocalDate.of(2002, Month.JANUARY,1),
                    1L
            );

            repository.saveAll(
                    List.of(harry_potter_sorcerer_stone,harry_potter_chamber_of_secrets,harry_potter_prisoner_of_azkaban)
            );
        };
    }
}
