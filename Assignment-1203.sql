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


DROP TABLE student_table;

-- Question 3
SELECT SUBSTRING(FIRST_NAME, 1, 3) AS first_three_chars
FROM Student_Table;

-- Question 4
SELECT INSTR(FIRST_NAME, 'a') AS position_of_a
FROM Student_Table
WHERE FIRST_NAME = 'Shivansh';

-- Question 5
SELECT DISTINCT MAJOR, LENGTH(MAJOR) AS major_length
FROM Student_Table;

-- Question 6
SELECT REPLACE(FIRST_NAME, 'a', 'A') AS modified_first_name
FROM Student_Table;

-- Question 7
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME
FROM Student_Table;

-- Question 8
SELECT * FROM Student_Table
ORDER BY FIRST_NAME ASC, MAJOR DESC;

-- Question 9
SELECT * FROM Student_Table
WHERE FIRST_NAME IN ('Prem', 'Shivansh');

-- Question 10
SELECT * FROM Student_Table
WHERE FIRST_NAME NOT IN ('Prem', 'Shivansh');

-- Question 11
SELECT * FROM Student_Table
WHERE FIRST_NAME LIKE '%a';

-- Question 12
SELECT * FROM Student_Table
WHERE FIRST_NAME LIKE '____a';

-- Question 13
SELECT * FROM Student_Table
WHERE GPA BETWEEN 9.00 AND 9.99;

-- Question 14
SELECT COUNT(*) AS computer_science_count
FROM Student_Table WHERE MAJOR = 'Computer Science';

-- Question 15
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME
FROM Student_Table WHERE GPA BETWEEN 8.5 AND 9.5;

-- Question 16
SELECT MAJOR, COUNT(*) AS STUDENT_COUNT
FROM Student_Table
GROUP BY MAJOR
ORDER BY STUDENT_COUNT DESC;


-- Question 17
SELECT s.STUDENT_ID, 
       s.FIRST_NAME, 
       s.LAST_NAME, 
       sc.SCHOLARSHIP_AMOUNT, 
       sc.SCHOLARSHIP_DATE
FROM Student_Table s
INNER JOIN Scholarship_Table sc ON s.STUDENT_ID = sc.STUDENT_REF_ID;


-- Question 18
SELECT * 
FROM Student_Table WHERE STUDENT_ID % 2 != 0;


-- Question 19
SELECT * 
FROM Student_Table WHERE STUDENT_ID % 2 = 0;


-- Question 20
SELECT s.STUDENT_ID, s.FIRST_NAME, s.LAST_NAME, sc.SCHOLARSHIP_AMOUNT, sc.SCHOLARSHIP_DATE
FROM Student_Table s
LEFT JOIN Scholarship_Table sc ON s.STUDENT_ID = sc.STUDENT_REF_ID;


-- Question 21
SELECT *
FROM Student_Table ORDER BY GPA DESC LIMIT 5;


-- Question 22
SELECT * FROM Student_Table
ORDER BY GPA DESC LIMIT 1 OFFSET 4;


-- Question 23
SELECT * FROM Student_Table s1
WHERE 4 =
	(SELECT COUNT(DISTINCT(s2.GPA))
    FROM Student_Table s2
    WHERE s2.GPA >= s1.GPA
);


-- Question 24
SELECT S1.* FROM Student_Table S1, Student_Table S2 WHERE S1.GPA AND S1.Student_ID !=S2.Student_ID;


-- Question 25
SELECT MAX(GPA) FROM Student_Table
WHERE GPA NOT IN(SELECT MAX(GPA) FROM Student_Table);


-- Question 26
SELECT * FROM Student_Table
UNION ALL
SELECT * FROM Student_Table ORDER BY Student_ID;


-- Quesion 27
SELECT Student_ID FROM Student_Table
WHERE Student_ID NOT IN (SELECT Student_Ref_ID FROM Scholarship_Table);


-- Question 28
SELECT * FROM Student_Table
LIMIT(SELECT FLOOR(COUNT(*)/2) FROM Student_Table);


-- Question 29
SELECT Major, COUNT(Major) AS Major_Count FROM Student_Table GROUP BY Major HAVING COUNT(Major)<4;


-- Question 30
SELECT Major, COUNT(Major) AS ALL_Major FROM Student_Table GROUP BY Major;


-- Question 31
SELECT * FROM Student_Table WHERE Student_ID = (SELECT MAX(Student_ID) FROM Student_Table);


-- Question 32
SELECT * FROM Student_Table WHERE Student_ID = (SELECT MIN(Student_ID) FROM Student_Table);


-- Question 33
SELECT *
FROM(
   SELECT *
   FROM Student_Table
   ORDER BY Student_ID DESC
   LIMIT 5)
AS Subquery
ORDER BY Student_ID;


-- Question 34
SELECT DISTINCT GPA FROM Student_Table S1
WHERE 3>=(SELECT COUNT(DISTINCT GPA) FROM Student_Table S2 WHERE S1.GPA <= S2.GPA)
ORDER BY S1.GPA DESC;


-- Question 35
SELECT DISTINCT GPA FROM Student_Table S1
WHERE 3>= (SELECT COUNT(DISTINCT GPA) FROM Student_Table S2 WHERE S1.GPA>=S2.GPA)
ORDER BY S1.GPA;


-- Question 36
SELECT DISTINCT GPA FROM Student_Table S1
WHERE 2=(SELECT COUNT(DISTINCT GPA) FROM Student_Table S2 WHERE S1.GPA <= S2.GPA)
ORDER BY S1.GPA DESC;


-- Question 37
SELECT Major, MAX(GPA) AS MaxGPA FROM Student_Table GROUP BY Major;


-- Question 38
SELECT First_Name, GPA FROM Student_Table WHERE GPA=(SELECT MAX(GPA) FROM Student_Table);


-- Question 39
SELECT CURDATE();
SELECT NOW();


-- Question 40
CREATE TABLE CloneTable As SELECT * FROM Student_Table;


-- Question 41
UPDATE Student_Table SET GPA = 7.5 WHERE Major = 'CSE';


-- Question 42
SELECT Major, AVG(GPA) AS Average_GPA FROM Student_Table GROUP BY Major;


-- Question 43
SELECT * FROM Student_Table ORDER BY GPA DESC LIMIT 3;


-- Question 44
SELECT Major, COUNT(Student_ID) AS High_GPA_COUNT FROM Student_Table
WHERE GPA>7.5
GROUP BY Major;


-- Question 45
SELECT * FROM Student_Table WHERE GPA=(SELECT GPA FROM Student_Table WHERE Student_ID=201);

