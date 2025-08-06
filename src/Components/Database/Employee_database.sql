CREATE DATABASE Employee_Attendance_System;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    designation VARCHAR(50),
    hire_date DATE,
    status ENUM('active', 'inactive') DEFAULT 'active'
);
