# Book-Inventory-demo

JAVA Component:
This Github Repository is to demonstrate a simple Book Inventory application using Spring Boot and Java, as well as MySQL as the database. This code is developed on IntelliJ IDEA and I recommend you to do so too. 

This application serves as a Book Inventory where you can:
1. Add new books
2. Remove existing books
3. Update the quantity of each book
4. Retrieve the quantity in stock of a given book
5. List all books in the inventory

Steps to Setup:
1. Run the DemoApplication in IntelliJ IDEA
2. Open a browser and enter the URL: http://localhost:8080/api/v1/book
3. Open the generated-requests.http file
   a. Run the POST request - to add book \n
   b. Run the DELETE request - to remove book \n
   c. Run the PUT request - to update quantity of book \n
   d. (Refresh the browser tab after running each request to see the changes made) \n

Things To Note for Setup:
1. This repository only contains the Spring Boot and Java code
2. Please connect to your MySQL server locally, as there may be credential issues: username and password

After connecting the this codebase to your MySQL server in your localhost, please change the credentials in the application.properties folder accordingly
1. spring.datasource.url=jdbc:mysql://localhost:3306/BookInventory
2. spring.datasource.username=root
3. spring.datasource.password=Mysql123

Stack:
1. Java 17 on IntelliJ
2. Spring Boot
3. MySQL 8.0

SQL Component:
The SQL Queries for the SQL Assignment - 6 Questions can be found in the SQL Queries folder.

SQL Component Setup:
1. Run the create_table_autodesk.sql - To initialize an empty table
2. Run the data_insertion_script.sql - To populate with mock data
3. There are 6 queries written in the Autodesk queries file - To answer the 6 questions
