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

## `SELECT` Statements

## Filtering with `WHERE`

## Basic Logic

## Sorting Results

## Practice Time

