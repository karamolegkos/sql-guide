-- Drop the database if it exists
DROP DATABASE IF EXISTS SchoolDB;

-- Create the database
CREATE DATABASE SchoolDB;

-- Select the database to use
USE SchoolDB;

-- Drop tables if they exist (in reverse dependency order)
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Students
INSERT INTO Students (student_id, first_name, last_name, age) VALUES
(1, 'Alice', 'Johnson', 20),
(2, 'Bob', 'Smith', 22),
(3, 'Charlie', 'Davis', 21),
(4, 'Diana', 'Lopez', 23),
(5, 'Ethan', 'Brown', 24),
(6, 'Fiona', 'Wilson', 22),
(7, 'George', 'Clark', 20),
(8, 'Hannah', 'Martinez', 21),
(9, 'Ian', 'Taylor', 25),
(10, 'Julia', 'Anderson', 19);

-- Insert Courses
INSERT INTO Courses (course_id, course_name, instructor) VALUES
(101, 'Mathematics', 'Dr. Newton'),
(102, 'Literature', 'Prof. Austen'),
(103, 'Physics', 'Dr. Feynman'),
(104, 'History', 'Dr. King'),
(105, 'Biology', 'Dr. Darwin'),
-- Courses with no enrollments yet:
(106, 'Philosophy', 'Dr. Plato'),
(107, 'Art', 'Prof. Da Vinci');

-- Insert Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade) VALUES
(1, 1, 101, 88.50),
(2, 1, 102, 92.00),
(3, 2, 101, 75.00),
(4, 2, 103, 68.50),
(5, 3, 101, 91.00),
(6, 3, 104, 82.00),
(7, 4, 101, 90.00),
(8, 4, 102, 87.00),
(9, 4, 103, 91.00),
(10, 5, 104, 79.00),
(11, 5, 105, 85.50),
(12, 6, 101, 67.00),
(13, 6, 102, 73.00),
(14, 6, 103, 70.50),
(15, 7, 104, 95.00),
(16, 7, 105, 88.00),
(17, 8, 105, 91.00),
(18, 9, 102, 65.00),
(19, 9, 103, 72.00),
(20, 10, 101, 93.00),
(21, 10, 105, 89.00);