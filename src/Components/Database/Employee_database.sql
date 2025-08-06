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

<<<<<<< Updated upstream
CREATE TABLE attendance (
    attendanceID INT AUTO_INCREMENT PRIMARY KEY,
    employeeID INT,
    date DATE,
    checkInTime TIME,
    checkOutTime TIME,
    status ENUM('Present', 'Absent', 'On Leave', 'Late') DEFAULT 'Present',
    FOREIGN KEY (employeeID) REFERENCES Employees(employeeID)
);

=======
>>>>>>> Stashed changes
CREATE TABLE Leave (
    type VARCHAR(50),
    sartDate DATE,
    enddate  DATE,
    Approval Status VARCHAR(50),
    reason VARCHAR(50),
    FOREIGN KEY (employeeID) REFERENCES Employees(employeeID)
);
