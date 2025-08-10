CREATE DATABASE Employee_Attendance_System;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    department_Id INT,
    designation_Id INT,
    hire_date DATE,
    FOREIGN KEY (department_Id) REFERENCES employeeDepartment(department_Id)
    FOREIGN KEY(designationId) REFERENCES employeeDesignation(designation_Id)
    status ENUM('active', 'inactive') DEFAULT 'active'
);
CREATE TABLE employeeDesignation(
    designation_Id INT AUTO_INCREMENT PRIMARY KEY,
    designation_name VARCHAR(100)
);

CREATE TABLE employeeDepartment(
    department_Id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100)
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

CREATE TABLE EmployeeLeave (
    leave_type VARCHAR(50),
    employee_id INT,
    leave_typeId INT,
    start_date DATE,
    end_date DATE,
    approval_status VARCHAR(50),
    reason VARCHAR(50),
    FOREIGN KEY (leave_typeId) REFERENCES leavetype(leave_typeId)
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

/*option employeeId */
CREATE TABLE adminUsers (
    adminID INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    username VARCHAR(50) NOT NULL UNIQUE,
    passwordHash VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Manager') NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
CREATE TABLE leavetype (
    leave_typeId INT AUTO_INCREMENT PRIMARY KEY,
    leave_typeName VARCHAR(100)
);


CREATE TABLE holidays (
    holidayID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    description TEXT
);
INSERT INTO holidays (name, date, description)
VALUES 
('New Year''s Day', '2025-01-01', 'Celebration of the New Year'),
('Freedom Day', '2025-04-27', 'Celebrate Freedom day'),
('Mandela Day', '2025-07-18', "Nelson mandela's BirthdayDay"),
('Independence Day', '2025-08-15', 'India''s Independence Day'),
('Human right Day', '2025-10-21', 'Celebarting our rights'),
('Christmas Day', '2025-12-25', 'Celebration of Christmas'),
('Youth Day', '2025-06-16', 'Celebrating youth day'),
('Holi', '2025-03-17', 'Festival of colors'),
('Workers Day', '2025-05-01', 'Birthday of Mahatma Gandhi'),
('Good Friday', '2025-04-18', 'Christian holiday commemorating crucifixion of Jesus');


INSERT INTO employees (first_name, last_name, email, department_Id, designation_Id, hire_date, status) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', 1,1 , '2022-03-01', 'active'),
('Bob', 'Smith', 'bob.smith@example.com', 2, 2, '2021-06-15', 'active'),
('Catherine', 'Lee', 'catherine.lee@example.com', 3, 3, '2023-01-10', 'active'),
('David', 'Brown', 'david.brown@example.com', 2, 4, '2020-11-20', 'inactive'),
('Ella', 'White', 'ella.white@example.com', 4,5, '2022-07-05', 'active'),
('Frank', 'Black', 'frank.black@example.com', 5, 6, '2019-02-18', 'active'),
('Grace', 'Green', 'grace.green@example.com', 3, 7, '2021-12-01', 'inactive'),
('Henry', 'Adams', 'henry.adams@example.com', 2, 8, '2023-08-01', 'active'),
('Ivy', 'Baker', 'ivy.baker@example.com', 1, 9, '2022-05-25', 'active'),
('Jack', 'Wilson', 'jack.wilson@example.com',6,10, '2020-09-30', 'active');

INSERT INTO employeeDepartment (department_name)
VALUES
("HR"),
("IT"),
("Finance"),
("Marketing"),
("Sales"),
("Admin")

INSERT INTO employeeDesignation (designation_name)
VALUES
("HR Manager"),
("Software Engineer"),
("Accountant"),
("System Admin"),
("Marketing Specialist"),
("Sales Executive"),
("Finacial Analyst"),
("DevOps Engineer"),
("Recruiter"),
("Office Assistant");

INSERT INTO attendance (employee_id, date, checkInTime, checkOutTime, status) VALUES
(1, '2025-08-07', '08:00:00', '17:00:00', 'Present'),
(2, '2025-08-07', '08:20:00', '17:00:00', 'Late'),
(3, '2025-08-07', NULL, NULL, 'On Leave'),
(4, '2025-08-07', NULL, NULL, 'Absent'),
(5, '2025-08-07', '08:05:00', '17:10:00', 'Present'),
(6, '2025-08-07', '08:00:00', '16:50:00', 'Present'),
(7, '2025-08-07', NULL, NULL, 'Absent'),
(8, '2025-08-07', '08:30:00', '17:15:00', 'Late'),
(9, '2025-08-07', '08:00:00', '17:00:00', 'Present'),
(10, '2025-08-07', NULL, NULL, 'On Leave');

INSERT INTO EmployeeLeave (leave_typeId, employee_id, start_date, end_date, approval_status, reason)
VALUES 
(1, 1, '2025-08-01', '2025-08-03', 'Approved', 'Flu recovery'),
(2, 2, '2025-07-15', '2025-07-20', 'Pending', 'Family trip'),
(3, 3, '2025-08-05', '2025-08-06', 'Approved', 'Family emergency'),
(4, 1, '2025-08-10', '2025-08-10', 'Rejected', 'Personal reasons'),
(1, 4, '2025-07-25', '2025-07-28', 'Approved', 'Fever and rest'),
(2, 2, '2025-08-12', '2025-08-16', 'Pending', 'Honeymoon'),
(5, 5, '2025-06-01', '2025-08-31', 'Approved', 'Childbirth'),
(6, 3, '2025-07-01', '2025-07-10', 'Approved', 'Newborn support'),
(7, 4, '2025-08-20', '2025-08-25', 'Pending', 'Travel abroad'),
(4, 5, '2025-08-03', '2025-08-04', 'Approved', 'Doctor appointment');

INSERT INTO leavetype (leave_typeName)
VALUES
("Sick leave"),
("Vacation"),
("Emergency Leave"),
("Casual Leave"),
("Maternity leave"),
("Paternity leave"),
("Unpaid leave");

INSERT INTO employee_shifts (employee_id, shift_id, effective_from)
VALUES 
(1, 1, '2025-08-01'),
(2, 2, '2025-08-01'),
(3, 3, '2025-08-01'),
(4, 1, '2025-08-05'),
(5, 2, '2025-08-05'),
(1, 2, '2025-09-01'),
(2, 3, '2025-09-01'),
(3, 1, '2025-09-01'),
(4, 3, '2025-09-10'),
(5, 1, '2025-09-10');

INSERT INTO shifts (shift_name, start_time, end_time)
VALUES 
('Morning Shift', '08:00:00', '16:00:00'),
('Evening Shift', '16:00:00', '00:00:00'),
('Night Shift', '00:00:00', '08:00:00');

INSERT INTO adminUsers (username, passwordHash, role)
VALUES
('admin_john', '$125#HashForJohn', 'Admin'),
('manager_sara', '$120#HashForSara', 'Manager'),
('admin_mike', '$2y$10$abc123exampleHashForMike', 'Admin'),
('manager_lisa', '$2y$10$abc123exampleHashForLisa', 'Manager'),
('admin_raj', '$2y$10$abc123exampleHashForRaj', 'Admin'),
('manager_ali', '$2y$10$abc123exampleHashForAli', 'Manager'),
('admin_nina', '$2y$10$abc123exampleHashForNina', 'Admin'),
('manager_david', '$2y$10$abc123exampleHashForDavid', 'Manager'),
('admin_kevin', '$2y$10$abc123exampleHashForKevin', 'Admin'),
('manager_sophia', '$2y$10$abc123exampleHashForSophia', 'Manager');
