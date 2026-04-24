USE school_database;
-- STUDENT Table

-- Naya Kaba
-- 4/24/2025
-- CS420


-- Phase1 Starts Here
CREATE TABLE STUDENT
(Student_ID INT unique PRIMARY KEY, FName VARCHAR(255), LName VARCHAR(255), Major VARCHAR(255), AcademicYear DATE);

SELECT * from STUDENT;
DESCRIBE STUDENT;

-- INSTRUCTOR Table
CREATE TABLE INSTRUCTOR
(Instructor_ID INT UNIQUE PRIMARY KEY, FullName VARCHAR(255), Department VARCHAR(255));
-- Rename the full-name column
ALTER TABLE INSTRUCTOR RENAME COLUMN FullName TO Full_Name;

select * from INSTRUCTOR;
DESCRIBE INSTRUCTOR;

-- COURSE Table
CREATE TABLE COURSE
(Course_ID INT UNIQUE PRIMARY KEY, Course_Title VARCHAR(255), Instructor INT,
CONSTRAINT fk_instructor_id FOREIGN KEY (Instructor) REFERENCES INSTRUCTOR(Instructor_ID)
);
-- Rename the Instructor column to Instructor_ID
ALTER TABLE COURSE RENAME COLUMN Instructor TO Instructor_ID;
SELECT * FROM COURSE;
DESCRIBE COURSE;

-- ENROLLMENT Table
CREATE TABLE ENROLLMENT
(Enrollment_ID INT UNIQUE PRIMARY KEY, Student_ID INT, Course_ID INT,
CONSTRAINT fk_student_id FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID),
CONSTRAINT fk_course_id FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID)
);
-- ADD A GRADE COLUMN 
ALTER TABLE ENROLLMENT ADD COLUMN Grade CHAR(5);
SELECT * FROM ENROLLMENT;
DESCRIBE ENROLLMENT;

-- SHOW ALL TABLES
show tables;

-- Phase2 Starts Here
-- INSRT DATA INTO STUDENT
INSERT INTO STUDENT VALUES
(1, 'Sam', 'White', 'Computer Science', '2022_09_23'),
(2, 'James', 'Bing', 'Business', '2025_09_23'),
(3, 'Ben', 'Anderson', 'Art', '2023_09_23'),
(4, 'Peter', 'Scott', 'Computer Science', '2019_09_23'),
(5, 'Amie', 'Black', 'Mathematics', '2024_09_23'),
(6, 'Hannah', 'Berns', 'Computer Science', '2022_09_23');

SELECT * FROM STUDENT;


-- INSERT DATA INTO INSTRUCTOR
INSERT INTO INSTRUCTOR VALUES
(1, 'John Liang', 'Computer Science Department'),
(2, 'Nancy Smith', 'Mathmematics Department'),
(3, 'John Liang', 'Art Department'),
(4, 'James White', 'Computer Science Department'),
(5, 'Carl Johnson', 'Business Department');

SELECT * FROM INSTRUCTOR;

-- INSERT DATA INTO COURSE
INSERT INTO COURSE VALUES
(1, 'MATH330 - Sets and Logic', 2),
(2, 'ART101 - Intro to Drawing', 3),
(3, 'BUS101 - Intro to Business Management', 5),
(4, 'CS40 - Software Engineering', 1),
(5, 'CS301 - Computer Architecture', 4);

SELECT * FROM COURSE;


-- INSERT DATA INTO ENROLLMENT
INSERT INTO ENROLLMENT VALUES
(1, 1, 4, 'A+'),
(2, 4, 4, 'B+'),
(3, 2, 3, 'A-'),
(4, 5, 1, 'B-'),
(5, 6, 5, 'B+'),
(6, 1, 5, 'A+'),
(7, 3, 2, 'A+');

SELECT * FROM ENROLLMENT;


-- Phase3 Starts Here
-- update the major of one student
UPDATE STUDENT SET Major = 'Marketing' WHERE Student_ID = 2;
select * from STUDENT;

-- update the instructor assigned to one course
Update COURSE SET Instructor_ID = 1 WHERE Course_ID = 5;
SELECT * from COURSE;

-- update the grade of one student in a course
UPDATE ENROLLMENT SET Grade = 'A-' WHERE Enrollment_ID = 2;
SELECT * FROM ENROLLMENT;

-- delete one enrollment record
DELETE FROM ENROLLMENT WHERE Enrollment_ID = 7;
SELECT * FROM ENROLLMENT;

-- Attempt to delete a student who still has enrollment records and observe the result
DELETE FROM STUDENT WHERE Student_ID = 6;
DELETE FROM ENROLLMENT WHERE Enrollment_ID = 5;
DELETE FROM STUDENT WHERE Student_ID = 6;
SELECT * FROM ENROLLMENT;
SELECT * FROM STUDENT;