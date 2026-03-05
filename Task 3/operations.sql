--Verification Query
--2NF
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

--SQL Operations
--Insert into Student Table
INSERT INTO Student
VALUES (8, 'Kiran', 'kiran@email.com');

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
|         8 | Kiran       | kiran@email.com  |
+-----------+-------------+------------------+
  
--Insert into Club Table
INSERT INTO Club
VALUES ('5', 'Art Club', 'R404', 'Ms. Meera');

SELECT *FROM Club;
+--------+-------------+----------+------------+
| ClubID | ClubName    | ClubRoom | ClubMentor |
+--------+-------------+----------+------------+
|      1 | Music Club  | R101     | Mr. Raman  |
|      2 | Sports Club | R202     | Ms. Sita   |
|      3 | Drama Club  | R303     | Mr. Kiran  |
|      4 | Coding Club | Lab1     | Mr. Anil   |
|      5 | Art Club    | R404     | Ms. Meera  |
+--------+-------------+----------+------------+

