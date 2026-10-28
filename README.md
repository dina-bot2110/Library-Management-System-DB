# 📚 Library Management System - Database Project

## 📝 Overview
This project is a relational database designed to manage a library's daily operations and extract analytical insights. It was developed as part of the Software Engineering course requirements to demonstrate database design, normalization, and advanced SQL querying.

## 🎯 Business Questions Solved
This database is built to answer 6 main business questions:
1. What are the most borrowed books? (Demand analysis)
2. What are the most popular book categories?
3. What is the late return rate?
4. Who are the most active library members?
5. How do borrowing trends change monthly? (Seasonal analysis)
6. Which books have high demand compared to available copies? (Inventory planning)

## 🗄️ Database Schema
The database consists of 9 core tables to ensure data integrity and avoid redundancy:
- `users` (Members)
- `books` (Titles)
- `copies` (Physical copies)
- `loans` (Borrowing transactions)
- `reservations` (Book requests)
- `categories`, `authors`, `book_authors`, `fines`.

## ⚙️ Technologies Used
- **Database:** MySQL
- **Tool:** MySQL Workbench

## 🚀 How to Run
1. Open your MySQL environment.
2. Run the `01_Database/create_tables.sql` script to create the schema.
3. Run the `02_Queries/q1_...sql` to `q6_...sql` scripts to view the analytical reports.
