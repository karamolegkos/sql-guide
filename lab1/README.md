# SQL with MySQL (Part1)

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
- **[Next Steps](#next-steps)**.

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
CREATE DATABASE IF NOT EXISTS myNewDB;
-- THIS IS A MySQL Comment!!
-- If you know that your DB does not exist you can execute the following as well
-- CREATE DATABASE myNewDB
```

Then, specify that you are now using this Database:
```
USE myNewDB;
```

Here’s what the SQL command looks like to create a table:
```sql
CREATE TABLE Books (
  id INT,
  title VARCHAR(100),
  author VARCHAR(100),
  PRIMARY KEY (id)
);
-- You can also use something like this: CREATE TABLE IF NOT EXISTS Books
```
What this means:
- `Books` is the name of the table.
- `id INT` means we’re creating a column called id that will store whole numbers (like 1, 2, 3).
- `title VARCHAR(100)` means the title column will store text, up to 100 characters.
- `author VARCHAR(100)` is also text, up to 100 characters.
- `PRIMARY KEY (id)` the field is the Primary Key for this table ~ It can't have the same value more than once in the table.

Once we run this command, the table exists — it’s empty at first, just like an empty sheet in Excel.

> You can have a look on all the MySQL Data Types [here](https://www.w3schools.com/mysql/mysql_datatypes.asp).

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
| 4 | Dana | 28 | London |
| 5 | Eva | 22 | Berlin |
| 6 | Frank | 40 | New York |
| 7 | Grace | 31 | Rome |
| 8 | Hassan | 29 | Cairo |
| 9 | Ivy | 27 | Paris |
| 10 | Jack | 33 | London |

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
INSERT INTO People VALUES (2, 'Bob', 25, 'London');
INSERT INTO People VALUES (3, 'Charlie', 35, 'Paris');
INSERT INTO People VALUES (4, 'Dana', 28, 'London');
INSERT INTO People VALUES (5, 'Eva', 22, 'Berlin');
INSERT INTO People VALUES (6, 'Frank', 40, 'New York');
INSERT INTO People VALUES (7, 'Grace', 31, 'Rome');
INSERT INTO People VALUES (8, 'Hassan', 29, 'Cairo');
INSERT INTO People VALUES (9, 'Ivy', 27, 'Paris');
INSERT INTO People VALUES (10, 'Jack', 33, 'London');
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

Now that you know how to view data using `SELECT`, let’s learn how to **narrow it down** using the `WHERE` clause. `WHERE` tells the database: **"Only show me the rows that match certain conditions".**

You use `WHERE` when you don’t want everything, just the data that meets specific rules.

Basic Format:
```sql
SELECT column1, column2 FROM table_name
WHERE condition;
```

Let's try some `WHERE` Queries on the `People` table:
1. Find People Over 30:
```sql
SELECT * FROM People
WHERE age > 30;
-- This shows only people whose age is greater than 30.
```

2. Find People in London:
```sql
SELECT name, city FROM People
WHERE city = 'London';
-- This shows the name and city of people who live in London.
```

3. Combine Conditions:
```sql
SELECT * FROM People
WHERE city = 'London' AND age < 30;
-- This shows people who live in London and are under 30 years old.
```

### Common Symbols in `WHERE`

| Symbol  | Meaning | Example |
| ------------- | ------------- | ------------- |
| = | Equal to | `city = 'Paris'` |
| <> | Not equal to | `city <> 'Paris'` |
| > | Greater than | `age > 25` |
| < | Less than | `age < 40` |
| AND | Both must be true | `age > 25 AND city = 'NY'` |
| OR | One (or both) must be true | `age < 20 OR age > 35` |

>Question: Can you write a query to find people who are not from London?

## Basic Logic
In SQL, you can combine multiple conditions using logical operators to filter data even more precisely. These logical operators are:
- `AND`
- `OR`
- `NOT`

These work like the logic we use in everyday language.

1. `AND` Operator

The `AND` operator is used when you want all conditions to be true. Think of it as saying, "Only show the data where both conditions are met".

Let’s say you want to find people who live in London and are under 30 years old.
```sql
SELECT * FROM People
WHERE city = 'London' AND age < 30;
/* (This is a multi-line comment)
This will show people who meet both conditions:
- They must live in London
- They must be younger than 30
*/
```
2. `OR` Operator

The `OR` operator is used when you want **at least one of the conditions to be true**. Think of it as saying, **"Show me the data where either condition is met"**.

Let’s say you want to find people who are either from Paris or Cairo.
```sql
SELECT * FROM People
WHERE city = 'Paris' OR city = 'Cairo';
-- This will return people who live in Paris or Cairo, or both.
```

3. `NOT` Operator
The `NOT` operator is used to **exclude** certain values. Think of it like saying, "Show me everything except this condition".

Let’s say you want to find people who are not from London.
```sql
SELECT * FROM People
WHERE NOT city = 'London';
-- This will show people who are not from London, meaning all the cities except London.
```

### Combining Logic
You can also combine these logical operators for more complex queries.

**Example 1**: People Who Are Under 30 and Live in London or Paris.
```sql
SELECT * FROM People
WHERE age < 30 AND (city = 'London' OR city = 'Paris');
-- This query returns people who are under 30 and live in either London or Paris.
```

**Example 2**: People Who Are Over 30 and Are Not from New York.
```sql
SELECT * FROM People
WHERE age > 30 AND NOT city = 'New York';
-- This query returns people who are over 30 and are not from New York.
```

### Tip for Beginners
- Parentheses `()` are very important when combining AND and OR. They help you control the order in which conditions are evaluated.
- Always think about what you’re trying to filter. Are you looking for people who **match all** the criteria (use `AND`), or are you okay with **matching one or more** (use `OR`)?

## Sorting Results
Sometimes you don’t just want to see data—you want to see it in a specific order. Maybe you want the youngest people first, or you want to sort names alphabetically. That’s where the `ORDER BY` clause comes in. `ORDER BY` tells SQL: **"Sort the results by this column"**.

Basic Format:
```sql
SELECT column1, column2 FROM table_name
ORDER BY column_name;
```
By default, SQL will sort from:
- A to Z for text (alphabetical order).
- Smallest to largest for numbers.

### Examples
**Example 1**: Sort by Age (Youngest to Oldest)
```sql
SELECT * FROM People
ORDER BY age;
-- This will list the people starting with the **youngest**.
```

**Example 2**: Sort by Age (Oldest to Youngest)
To sort in reverse order, add the word DESC (short for descending):
```sql
SELECT * FROM People
ORDER BY age DESC;
```

**Example 3**: Sort by Name (A–Z)
To sort in reverse order, add the word DESC (short for descending):
```sql
SELECT * FROM People
ORDER BY name;
-- This sorts the list alphabetically by name.
```

**Example 4**: Sort by City, then by Name
To sort in reverse order, add the word DESC (short for descending):
```sql
SELECT * FROM People
ORDER BY city, name;
/*
This:
- First sorts people by city name
- Then, within each city, sorts them by name
*/
```

## Practice Time
### Step 1
Inside of your MySQL DBMS, create a Database named as `MoviesDB` and **use it**.

### Step 2
Create the following Tables in the Database using `CREATE TABLE` statements:
- Table: `Movies`

| movie_id | title | release_year | director_id |
| ------------- | ------------- | ------------- | ------------- |
| 1 | The Cold Wind Blows | 2020 | 101 |
| 2 | Love in the Sky | 2019 | 102 |
| 3 | The Last Ice | 2021 | 101 |
| 4 | City Lights | 2018 | 103 |
| 5 | Journey to Marquet | 2022 | 104 |
| 6 | Fire in the Ocean | 2023 | 105 |
| 7 | The Whispering Trees | 2017 | 106 |
| 8 | Beyond the Fog | 2020 | 107 |
| 9 | Silent Melody | 2016 | 102 |
| 10 | Glass Horizon | 2023 | 103 |

- Table: `Actors`

| actor_id | name | birth_year | country |
| ------------- | ------------- | ------------- | ------------- |
| 201 | Anna Blue | 1985 | USA |
| 202 | Liam Stone | 1990 | UK |
| 203 | Sophia Hart | 1988 | Canada |
| 204 | Marcus Vega | 1979 | Brazil |
| 205 | Elena Rossi | 1992 | Italy |
| 206 | Takeshi Saito | 1984 | Japan |
| 207 | Maria Alvarez | 1995 | Mexico |
| 208 | Pierre Leclair | 1980 | France |
| 209 | Chloe Wang | 1987 | China |
| 210 | David Kim | 1991 | South Korea |

- Directors: `Directors`

| director_id | name | country |
| ------------- | ------------- | ------------- |
| 101 | Nora Winters | USA |
| 102 | Raj Kapoor | India |
| 103 | Chloe Zhang | China |
| 104 | Max Fontaine | France|
| 105 | Ingrid Svensson | Sweden |
| 106 | Diego Martinez | Argentina |
| 107 | Fatima El-Amin | Egypt |

### Step 3
Insert the Values in the tables you have created using the `INSERT INTO` command.

### Step 4
Make queries to retrieve the following information:
1. Show all movies released after the year 2020.
2. Show the names and birth years of all actors from Italy or France.
3. Show all directors from Asia. (India, China, Japan, South Korea, etc.)
4. Show all actors who were born before 1990, sorted by birth year (oldest first).
5. Show all movies directed by director with ID = 101.
6. Show the titles of all movies and the year they were released, sorted by newest first.
7. Show all actors not from the USA or UK.
8. Show all directors whose names start with the letter "C".
  - Try to use `LIKE`.
9. Show all movies and their director names.
  - Try to use `JOIN` for this.
10. Show the number of movies each director has made.
  - Try to use `JOIN` and/or `GROUP BY` for this.

## Next Steps
- Relational Schema.
- Introduction to `JOIN`.
- Aggregation Functions.
- `GROUP BY` and `HAVING`.
- `UPDATE` and `DELETE`.