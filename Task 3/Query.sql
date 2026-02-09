CREATE DATABASE Task3;
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Task3              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+

---Un-Normalized / 1NF
 CREATE TABLE student (
    StudentID INT,
    StudentName VARCHAR (60),
    Email VARCHAR (60),
    ClubName VARCHAR (60),
    ClubRoom VARCHAR (60),
    ClubMentor VARCHAR (60),
    JoinDate DATE
    );

INSERT INTO student 
(StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate)
VALUES 
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');

--2NF

-- Students Table
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(100),
Email VARCHAR(100) UNIQUE
);

-- Clubs Table
CREATE TABLE Clubs (
ClubName VARCHAR(100) PRIMARY KEY,
ClubRoom VARCHAR(50),
ClubMentor VARCHAR(100)
);

-- Memberships Table
CREATE TABLE Memberships (
StudentID INT ,
ClubName VARCHAR(100),
JoinDate DATE,
PRIMARY KEY (StudentID, ClubName),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (ClubName) REFERENCES Clubs(ClubName)
);

-- Insert Students
INSERT INTO Students
VALUES (1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

-- Insert Clubs
INSERT INTO Clubs
VALUES ('Music Club', 'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club', 'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

-- Insert Memberships
INSERT INTO Memberships
VALUES (1, 'Music Club', '2024-01-10'),
(2, 'Sports Club', '2024-01-12'),
(1, 'Sports Club', '2024-01-15'),
(3, 'Music Club', '2024-01-20'),
(4, 'Drama Club', '2024-01-18'),
(5, 'Music Club', '2024-01-22'),
(2, 'Drama Club', '2024-01-25'),
(6, 'Sports Club', '2024-01-27'),
(3, 'Coding Club', '2024-01-28'),
(7, 'Coding Club', '2024-01-30');

SELECT 
s.StudentID,
s.StudentName,
s.Email,
m.JoinDate,
c.ClubName,
c.ClubRoom,
c.ClubMentor
FROM Memberships m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Clubs c ON m.ClubName = c.ClubName
ORDER BY s.StudentID;

+-----------+-------------+------------------+------------+-------------+----------+------------+
| StudentID | StudentName | Email            | JoinDate   | ClubName    | ClubRoom | ClubMentor |
+-----------+-------------+------------------+------------+-------------+----------+------------+
|         1 | Asha        | asha@email.com   | 2024-01-10 | Music Club  | R101     | Mr. Raman  |
|         1 | Asha        | asha@email.com   | 2024-01-15 | Sports Club | R202     | Ms. Sita   |
|         2 | Bikash      | bikash@email.com | 2024-01-25 | Drama Club  | R303     | Mr. Kiran  |
|         2 | Bikash      | bikash@email.com | 2024-01-12 | Sports Club | R202     | Ms. Sita   |
|         3 | Nisha       | nisha@email.com  | 2024-01-28 | Coding Club | Lab1     | Mr. Anil   |
|         3 | Nisha       | nisha@email.com  | 2024-01-20 | Music Club  | R101     | Mr. Raman  |
|         4 | Rohan       | rohan@email.com  | 2024-01-18 | Drama Club  | R303     | Mr. Kiran  |
|         5 | Suman       | suman@email.com  | 2024-01-22 | Music Club  | R101     | Mr. Raman  |
|         6 | Pooja       | pooja@email.com  | 2024-01-27 | Sports Club | R202     | Ms. Sita   |
|         7 | Aman        | aman@email.com   | 2024-01-30 | Coding Club | Lab1     | Mr. Anil   |
+-----------+-------------+------------------+------------+-------------+----------+------------+

--3NF
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

 DESCRIBE Student;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| StudentID   | int          | NO   | PRI | NULL    |       |
| StudentName | varchar(100) | YES  |     | NULL    |       |
| Email       | varchar(100) | YES  | UNI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+

CREATE TABLE Club (
ClubID INT PRIMARY KEY,
ClubName VARCHAR(100),
ClubRoom VARCHAR(50),
ClubMentor VARCHAR(100)
);

DESCRIBE Club;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| ClubID     | int          | NO   | PRI | NULL    |       |
| ClubName   | varchar(100) | YES  |     | NULL    |       |
| ClubRoom   | varchar(50)  | YES  |     | NULL    |       |
| ClubMentor | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

CREATE TABLE Membership (
MembershipID INT PRIMARY KEY,
StudentID INT,
ClubID INT,
JoinDate DATE,
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

DESCRIBE Membership;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| MembershipID | int  | NO   | PRI | NULL    |       |
| StudentID    | int  | YES  | MUL | NULL    |       |
| ClubID       | int  | YES  | MUL | NULL    |       |
| JoinDate     | date | YES  |     | NULL    |       |
+--------------+------+------+-----+---------+-------+

INSERT INTO Student
VALUES (1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

SELECT *FROM Student;
+-----------+-------------+------------------+
| StudentID | StudentName | Email            |
+-----------+-------------+------------------+
|         1 | Asha        | asha@email.com   |
|         2 | Bikash      | bikash@email.com |
|         3 | Nisha       | nisha@email.com  |
|         4 | Rohan       | rohan@email.com  |
|         5 | Suman       | suman@email.com  |
|         6 | Pooja       | pooja@email.com  |
|         7 | Aman        | aman@email.com   |
+-----------+-------------+------------------+

INSERT INTO Club
VALUES (1, 'Music Club', 'R101', 'Mr. Raman'),
(2, 'Sports Club', 'R202', 'Ms. Sita'),
(3, 'Drama Club', 'R303', 'Mr. Kiran'),
(4, 'Coding Club', 'Lab1', 'Mr. Anil');

 SELECT *FROM Club;
+--------+-------------+----------+------------+
| ClubID | ClubName    | ClubRoom | ClubMentor |
+--------+-------------+----------+------------+
|      1 | Music Club  | R101     | Mr. Raman  |
|      2 | Sports Club | R202     | Ms. Sita   |
|      3 | Drama Club  | R303     | Mr. Kiran  |
|      4 | Coding Club | Lab1     | Mr. Anil   |
+--------+-------------+----------+------------+

INSERT INTO Membership
VALUES (101, 1, 1, '2024-01-10'),
(102, 2, 2, '2024-01-12'),
(103, 1, 2, '2024-01-15'),
(104, 3, 1, '2024-01-20'),
(105, 4, 3, '2024-01-18'),
(106, 5, 1, '2024-01-22'),
(107, 2, 3, '2024-01-25'),
(108, 6, 2, '2024-01-27'),
(109, 3, 4, '2024-01-28'),
(110, 7, 4, '2024-01-30');

SELECT *FROM Membership;
+--------------+-----------+--------+------------+
| MembershipID | StudentID | ClubID | JoinDate   |
+--------------+-----------+--------+------------+
|          101 |         1 |      1 | 2024-01-10 |
|          102 |         2 |      2 | 2024-01-12 |
|          103 |         1 |      2 | 2024-01-15 |
|          104 |         3 |      1 | 2024-01-20 |
|          105 |         4 |      3 | 2024-01-18 |
|          106 |         5 |      1 | 2024-01-22 |
|          107 |         2 |      3 | 2024-01-25 |
|          108 |         6 |      2 | 2024-01-27 |
|          109 |         3 |      4 | 2024-01-28 |
|          110 |         7 |      4 | 2024-01-30 |
+--------------+-----------+--------+------------+

--Verification Query
SELECT 
s.StudentID,
s.StudentName,
s.Email,
c.ClubName,
c.ClubRoom,
c.ClubMentor,
m.JoinDate
FROM Membership m
JOIN Student s ON m.StudentID = s.StudentID
JOIN Club c ON m.ClubID = c.ClubID
ORDER BY s.StudentID;

+-----------+-------------+------------------+-------------+----------+------------+------------+
| StudentID | StudentName | Email            | ClubName    | ClubRoom | ClubMentor | JoinDate   |
+-----------+-------------+------------------+-------------+----------+------------+------------+
|         1 | Asha        | asha@email.com   | Music Club  | R101     | Mr. Raman  | 2024-01-10 |
|         1 | Asha        | asha@email.com   | Sports Club | R202     | Ms. Sita   | 2024-01-15 |
|         2 | Bikash      | bikash@email.com | Sports Club | R202     | Ms. Sita   | 2024-01-12 |
|         2 | Bikash      | bikash@email.com | Drama Club  | R303     | Mr. Kiran  | 2024-01-25 |
|         3 | Nisha       | nisha@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-20 |
|         3 | Nisha       | nisha@email.com  | Coding Club | Lab1     | Mr. Anil   | 2024-01-28 |
|         4 | Rohan       | rohan@email.com  | Drama Club  | R303     | Mr. Kiran  | 2024-01-18 |
|         5 | Suman       | suman@email.com  | Music Club  | R101     | Mr. Raman  | 2024-01-22 |
|         6 | Pooja       | pooja@email.com  | Sports Club | R202     | Ms. Sita   | 2024-01-27 |
|         7 | Aman        | aman@email.com   | Coding Club | Lab1     | Mr. Anil   | 2024-01-30 |
+-----------+-------------+------------------+-------------+----------+------------+------------+
