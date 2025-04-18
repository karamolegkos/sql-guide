# SQL with MySQL (Part2)

By the end of this lesson, the student will understand how to combine data from multiple tables using different types of `JOIN`s, summarize data using aggregation functions, group and filter grouped results with `GROUP BY` and `HAVING`, and modify or remove data with `UPDATE` and `DELETE` statements. Additionally, they will gain a clear understanding of what a relational schema is and how it helps structure data in a database.

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

### Create Schema in MySQL
On a query file inside the MySQL Workbench and execute the content in [this](./example-schema.sql) SQL file.

### Uninstallation
To uninstall your database you can run the following command in a Terminal/CMD
```docker
docker rm -f my-own-mysql
```

## Table of Contents
- **[Relational Schema](#relational-schema)**.
- **[Introduction to `JOIN`](#introduction-to-join)**.
- **[Aggregation Functions](#aggregation-functions)**.
- **[`GROUP BY` and `HAVING`](#group-by-and-having)**.
- **[`UPDATE` and `DELETE`](#update-and-delete)**.

## Relational Schema

In real-world databases, data is often split into **multiple tables** to keep things organized and avoid repetition. These tables are connected through relationships — just like puzzle pieces that fit together to make a bigger picture. This structure is called a **Relational Schema**.

What Is a Relational Schema?
- What tables exist in a database
- What each table contains (columns)
- How tables are connected to each other
It’s like a blueprint that helps you understand **how the data fits together**.

### Keys: The Connectors
To connect tables, we use two types of keys:
| Type of Key | Description | Example |
| --- | --- | --- |
| **Primary Key** | A unique ID for each row in a table. | `student_id` in `Students` |
| **Foreign Key** | A reference to a primary key in another table. | `student_id` in `Enrollments` (points to `Students`) |

### Example Schema
In our school database, we have three tables:

#### 1. `Students`

Stores information about students.
- **Primary key**: `student_id`

#### 2. `Courses`

Stores information about courses.
- **Primary key**: `course_id`

#### 3. `Enrollments`

Connects students to courses and stores their grades.
- Has two foreign keys:
  - `student_id` → links to `Students`.
  - `course_id` → links to `Courses`.

How They're Connected
```
Students      Enrollments       Courses
----------    -------------     ----------
student_id ←  student_id        
              course_id   →     course_id
```
This means:
- One student can enroll in many courses.
- One course can have many students.
- The `Enrollments` table bridges the two.

## Introduction to `JOIN`

Follow the **[Environment Setup](#environment-setup)** to have the recuired information reafy to follow this Section.

Sometimes, the data you need is **spread across multiple tables**. That’s where `JOIN` comes in. A `JOIN` lets you **combine rows from two or more tables** based on a related column — usually a key. Think of it like this: **"Match rows from Table A with rows from Table B where a specific column is the same."**

Basic Format:
```sql
SELECT table1.column, table2.column
FROM table1
JOIN table2 ON table1.related_column = table2.related_column;
```
There are different types of joins, but let’s start with the most common one: `INNER JOIN`.

Let’s Try Some `JOIN` Queries Using Our School Example! Let’s Try Some JOIN Queries Using Our School Example!
1. List Student Names with the Courses They're Enrolled In:
```sql
SELECT Students.first_name, Students.last_name, Courses.course_name
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;
-- This shows each student along with the name of the course they’re enrolled in.
```
The above is the same as the following:
```sql
SELECT Students.first_name, Students.last_name, Courses.course_name
FROM Students, Enrollments, Courses
WHERE Students.student_id = Enrollments.student_id
  AND Enrollments.course_id = Courses.course_id;
```
You can absolutely write a `JOIN`-like query using only the `WHERE` clause and listing multiple tables in the `FROM` part. This was actually the **classic way to write joins** before `JOIN ... ON` became the standard.

Note:
- Using `JOIN ... ON` is preferred in modern SQL because it’s clearer, especially with more complex queries or different join types (`LEFT JOIN`, etc.).
- But for **simple** `INNER JOIN`s, using `WHERE` works just fine and is helpful to understand how SQL matches data under the hood.

2. Show Students and Their Grades:
```sql
SELECT Students.first_name, Students.last_name, Courses.course_name, Enrollments.grade
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;
-- This gives you a more complete view — who’s studying what, and how they’re doing.
```

3. Filter with a JOIN:
```sql
SELECT Students.first_name, Courses.course_name
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id
WHERE Courses.course_name = 'Mathematics';
-- Only shows students who are enrolled in Mathematics.
```

### Types of JOIN

|Type | Description |
| --- | --- |
| `INNER JOIN` | Only returns rows where there’s a match in both tables. |
| `LEFT JOIN` | Returns all rows from the left table, and matched rows from the right (if any). |
| `RIGHT JOIN` | Returns all rows from the right table, and matched rows from the left (if any). |
| `FULL JOIN` | (Not in MySQL by default) Returns all rows when there’s a match in one of the tables. |

> **Question**: Can you write a query to list each course even if no students are enrolled in it?<br>
> (Hint: You'll need a `LEFT JOIN`)

**Answer**: Yes, by doing the following:
```sql
SELECT Courses.course_name, Enrollments.enrollment_id
FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id;
```
What This Does:
- The `LEFT JOIN` keeps **all courses**, even if there’s **no matching enrollment**.
- If a course has no students enrolled, the `enrollment_id` (and any other columns from `Enrollments`) will be `NULL`.

Here is a query to show only **courses with no enrollments**:
```sql
SELECT course_name
FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
WHERE Enrollments.enrollment_id IS NULL;
-- This shows only the courses that no one has enrolled in yet.
```

## Aggregation Functions

TODO