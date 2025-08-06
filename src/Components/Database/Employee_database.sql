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

CREATE TABLE attendance (
    attendanceID INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE,
    checkInTime TIME,
    checkOutTime TIME,
    status ENUM('Present', 'Absent', 'On Leave', 'Late') DEFAULT 'Present',
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

<<<<<<< HEAD
CREATE TABLE Leave (
=======
CREATE TABLE leave (
>>>>>>> refs/remotes/origin/main
    leavetype VARCHAR(50),
    employee_id INT,
    startDate DATE,
    enddate  DATE,
    Approval Status VARCHAR(50),
    reason VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE employee_shifts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    shift_id INT,
    effective_from DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (shift_id) REFERENCES shifts(shift_id)
);

CREATE TABLE shifts (
    shift_id INT AUTO_INCREMENT PRIMARY KEY,
    shift_name VARCHAR(50),
    start_time TIME,
    end_time TIME
);

CREATE TABLE adminUsers (
    adminID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    passwordHash VARCHAR(255),
    role ENUM('Admin', 'Manager')
);


CREATE TABLE holidays (
    holidayID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    date DATE,
    description TEXT
);
