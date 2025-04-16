# Introduction to SQL with MySQL

By the end of the lesson, the student will understand what SQL is, how databases work, and be able to write simple queries to retrieve and filter data from a database.

## Environment Setup
### Prerequisites
- [Docker (Desktop for Windows)](https://www.docker.com/products/docker-desktop/)
- [MySQL Workbench](https://www.mysql.com/products/workbench/)

### Installation
In a Terminal / CMD execute the following command while Docker is running in the background. This will:
- Download the `MySQL:8.0` DockerHub [image](https://hub.docker.com/_/mysql).
- Create a `MySQL:8.0` container named as `my-own-mysql` and expose it in the following DNS/port: `localhost:3306`.
  - The container will have a MySQL DBMS with the follogin root credentials: {user: "root", password: "bakobako"}.

```docker
docker run --name my-own-mysql -e MYSQL_ROOT_PASSWORD=bakobako -d -p 3306:3306 mysql:8.0
```

### MySQL Workbench Setup
Open up MySQL Workbench and connect to your local MySQL DBMS with your credentials specified above.

### Uninstallation
To uninstall your database you can run the following command in a Terminal/CMD
```docker
docker rm -f my-own-mysql
```

## Table of Contents
- **[What is SQL?](#what-is-sql)**
- **[What is a Table?](#what-is-a-table)**
- **[Creating a Table](#creating-a-table)**.
- **[`SELECT` Statements](#select-statements)**.
- **[Filtering with `WHERE`](#filtering-with-where)**.
- **[Basic Logic](#basic-logic)**.
- **[Sorting Results](#sorting-results)**.
- **[Practice Time](#practice-time)**.

## What is SQL?
SQL stands for **Structured Query Language**. It is a special language we use to communicate with databases.

>Imagine you have a big digital filing cabinet full of information — maybe about people, books, or products. That cabinet is the database, and SQL is the language you use to ask questions about what’s inside.

With SQL, you can:
- Look at all the data in a table.
- Search for specific information (e.g., "Show me all the people who live in London").
- Add new information.
- Update existing data.
- Delete information you no longer need.
- Organize or sort data in useful ways.

Even though SQL is considered a "programming language," it’s actually more like writing short, clear instructions in English. For example:
```sql
SELECT name, city FROM people WHERE age > 30;
```
This means: ***"Show me the name and city of every person who is older than 30."***

## What is a Table?
In a database, information is stored in something called a **table**.

You can think of a table like a **spreadsheet** or an **Excel sheet**. It has **rows** and **columns**, and each piece of data sits in one of the cells, just like in a table you’d see in real life.

Here's how it works:
- **Each column** in a table has a name and stores a specific type of information, like a person’s name, age, or city.
- **Each row** is a single entry — one complete set of information.

Let’s look at an example: Table `People`

| id  | name | age | city |
| ------------- | ------------- | ------------- | ------------- |
| 1 | Alice | 30 | New York |
| 2 | Bob | 25 | London |
| 3 | Charlie | 35 | Paris |

Table `People`:
- Has 4 columns: `id`, `name`, `age`, and `city`.
- Each **row** *is* a person.

So, if you wanted to see where Bob lives, you’d look at the row with his name and see that his city is London.

In SQL, we’ll use simple commands to:
- Look at tables.
- Search through them.
- Add new rows.
- Change or remove information.

## Creating a Table

Now that you know what a table is, let’s learn how to **create one** using SQL.

To create a table, we use the `CREATE TABLE` command. This tells the database: **"I want to make a new table and define what kind of information it will store."**

### Example
Let’s say we want to create a table to keep track of **books**. Each book has:
- An ID number (to uniquely identify it).
- A title (the name of the book).
- An author (who wrote it).

First of all, create your Database:
```sql
CREATE DATABASE IF NOT EXISTS libraryDB;
-- THIS IS A MySQL Comment!!
-- If you know that your DB does not exist you can execute the following as well
-- CREATE DATABASE libraryDB
```

Then, specify that you are now using this Database:
```
USE libraryDB;
```

Here’s what the SQL command looks like to create a table:
```sql
CREATE TABLE Books (
  id INT,
  title VARCHAR(100),
  author VARCHAR(100),
  PRIMARY KEY (ID)
);
-- You can also use something like this: CREATE TABLE IF NOT EXISTS Books
```
What this means:
- `Books` is the name of the table.
- `id INT` means we’re creating a column called id that will store whole numbers (like 1, 2, 3).
- `title VARCHAR(100)` means the title column will store text, up to 100 characters.
- `author VARCHAR(100)` is also text, up to 100 characters.

Once we run this command, the table exists — it’s empty at first, just like an empty sheet in Excel.

### Adding Information
We’ll learn this in more detail later, but here’s a quick example of how to add a row to the new table:
```sql
INSERT INTO Books VALUES (1, '1984', 'George Orwell');
```
This adds one book to the `Books` table. You can think of it like writing one row into your spreadsheet.

## `SELECT` Statements

Once you have a table with data, the most common thing you’ll want to do is look at the information inside it. In SQL, we do this using the `SELECT` statement. `SELECT` tells the database: **"Please show me some data from a table."**

Basic Format:
```sql
SELECT column1, column2 FROM table_name;
```
You tell SQL:
- Which columns you want to see (`column1`, `column2`, etc).
- Which table the data is coming from.

Let’s say we have this people table: `People`
| id  | name | age | city |
| ------------- | ------------- | ------------- | ------------- |
| 1 | Alice | 30 | New York |
| 2 | Bob | 25 | London |
| 3 | Charlie | 35 | Paris |

Let's also add it in the Database:
```sql
CREATE TABLE IF NOT EXISTS People (
  id INT,
  name VARCHAR(100),
  age INT,
  city VARCHAR(100),
  PRIMARY KEY (ID)
);

-- Let's add the above data with INSERT as well:
INSERT INTO People VALUES (1, 'Alice', 30, 'New York');
INSERT INTO People VALUES (1, 'Bob', 25, 'London');
INSERT INTO People VALUES (1, 'Charlie', 35, 'Paris');
```

Let's try some `SELECT` Queries:
1. Show Everything in the Table:
```sql
SELECT * FROM People;
-- The `*` means "all columns"
-- This will return the whole table
```
2. Show Only Specific Columns:
```sql
SELECT name, city FROM People;
-- This shows just the names and cities of everyone in the table
```
3. Rename Columns:
```sql
SELECT name AS full_name FROM People;
-- `AS` gives a column a new temporary name when showing results
-- You can also try this: SELECT name AS 'Full Name' FROM People;
```

## Filtering with `WHERE`

## Basic Logic

## Sorting Results

## Practice Time

### Exercise 1 
1. Create your own Database and use it.
2. Create a Table that will have the following information stored for movies.
  - Title: A text of at most 100 characters.
  - Year: An integer.
  - Director: A text of at most 40 characters.
  - MovieID: A unique identified for each movie.
3. Add a Few Movies in the Table and `SELECT` it to view it.

### Exercise 2