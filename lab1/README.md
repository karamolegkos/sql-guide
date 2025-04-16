# Introduction to SQL with MySQL

By the end of the lesson, the student will understand what SQL is, how databases work, and be able to write simple queries to retrieve and filter data from a database.

## Environment Setup
### Prerequisites
- Docker (Desktop for Windows)
- MySQL Workbench

### Installation
In a Terminal / CMD execute the following command while Docker is running in the background. This will:
- Download the `MySQL:8.0` DockerHub image.
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
- **[What is SQL?](what-is-sql)**
- **[What is a Table?]()**
- **[Creating a Table]()**.
- **[`SELECT` Statements]()**.
- **[Filtering with `WHERE`]()**.
- **[Basic Logic]()**.
- **[Sorting Results](#sorting-results)**.
- **[Practice Time](#practice-time)**.

## What is SQL?

## What is a Table?

## Creating a Table

## `SELECT` Statements

## Filtering with `WHERE`

## Basic Logic

## Sorting Results

## Practice Time

