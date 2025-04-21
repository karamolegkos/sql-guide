# MySQL with Python

By the end of this lesson, the student will understand how to connect a Python application to a MySQL database and interact with it using Python code. They will learn how to execute SQL commands like `CREATE`, `SELECT`, `INSERT`, `UPDATE`, and `DELETE` directly from Python, and how to build reusable functions for database operations. The lesson culminates in designing a simple console-based app that puts all of these concepts into practice. Students will also face a final challenge to apply what they’ve learned in a hands-on, creative task.

## Environment Setup
### Prerequisites
- [Docker (Desktop for Windows)](https://www.docker.com/products/docker-desktop/)
- [MySQL Workbench](https://www.mysql.com/products/workbench/)
- [Python3 (Version 3.13+)](https://www.python.org/downloads/)

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

### Python's Virtual Environment Installation
In a terminal/CMD execute the following command to install Python's Virtual Environment in your machine:
```bash
pip install virtualenv
```

### Uninstallation
To uninstall your database you can run the following command in a Terminal/CMD:
```docker
docker rm -f my-own-mysql
```

You can also uninstall Python's Virtual Environment with the following command ~ but it is not advised in case that you will be using Python for development:
```bash
pip uninstall virtualenv
```

## Table of Contents
- **[Intro to Python](#intro-to-python)**.
- **[Python and MySQL](#python-and-mysql)**.
- **[Executing SQL Queries from Python](#executing-sql-queries-from-python)**.
- **[Creating Reusable Functions](#creating-reusable-functions)**.
- **[Creating a Console App](#creating-a-console-app)**.
- **[Challenge](#challenge)!**
- **[Next Steps](#next-steps)**.

## Intro to Python

## Python and MySQL

## Executing SQL Queries from Python

## Creating Reusable Functions

## Creating a Console App

## Challenge
TODO

## Next Steps
- What is NoSQL?
- Types of NoSQL Databases
- Intro to MongoDB (Document-Based NoSQL)
- Basic CRUD Operations in MongoDB
- Data Modeling in NoSQL
- Python and MongoDB
- Mini Project: Build a MongoDB-backed Console App
- **Challenge!**
