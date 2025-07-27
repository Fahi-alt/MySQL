CREATE DATABASE Student_INFO;

USE Student_INFO;

CREATE TABLE Student_Table (
    STUDENT_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    GPA DECIMAL(3, 2),
    ENROLLMENT_DATE DATETIME,
    MAJOR VARCHAR(50)
);

INSERT INTO Student_Table (STUDENT_ID, FIRST_NAME, LAST_NAME, GPA, ENROLLMENT_DATE, MAJOR) VALUES
(201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01 09:30:000', 'Computer Science'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01 08:30:000', 'Mathematics'),
(203, 'Rakesh', 'Kumar', 5.6, '2021-09-01 10:00:000', 'Biology'),
(204, 'Radha', 'Sharma', 9.2, '2021-09-01 12:45:000', 'Chemistry'),
(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:000', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01 09:24:000', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:000', 'English'),
(208, 'Navleen', 'Kaur', 7, '2021-09-01 06:30:000', 'Mathematics');


CREATE TABLE Program_Table (
    STUDENT_REF_ID INT PRIMARY KEY,
    PROGRAM_NAME VARCHAR(50),
    PROGRAM_START_DATE DATETIME
);

INSERT INTO Program_Table (STUDENT_REF_ID, PROGRAM_NAME, PROGRAM_START_DATE) VALUES
(201, 'Computer Science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');


CREATE TABLE Scholarship_Table (
    STUDENT_REF_ID INT PRIMARY KEY,
    SCHOLARSHIP_AMOUNT INT,
    SCHOLARSHIP_DATE DATETIME
);

INSERT INTO Scholarship_Table (STUDENT_REF_ID, SCHOLARSHIP_AMOUNT, SCHOLARSHIP_DATE) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(204, 4000, '2021-10-15 00:00:00');



-- Retrieve student details along with their scholarship amount and date, if any.
-- Uses LEFT JOIN to include all students, even those without scholarships.
SELECT s.STUDENT_ID, s.FIRST_NAME, s.LAST_NAME, sc.SCHOLARSHIP_AMOUNT, sc.SCHOLARSHIP_DATE
FROM Student_Table s
LEFT JOIN Scholarship_Table sc ON s.STUDENT_ID = sc.STUDENT_REF_ID;
