CREATE DATABASE Teachers

CREATE TABLE Posts(
Id INT PRIMARY KEY ,
Name NVARCHAR(20)
);
CREATE TABLE Teachers1(
Id INT PRIMARY KEY ,
Name NVARCHAR(15),
Code CHAR(10),
IdPost INT FOREIGN KEY REFERENCES Posts(Id),
Tel CHAR(7),
Salary INT ,
Rise NUMERIC(6,2),
HireDate DATETIME
);

--1
ALTER TABLE Teachers1
DROP CONSTRAINT FK__Teachers1__IdPos__45F365D3;
DROP TABLE Posts
--2
--Foreing key i silmek

ALTER TABLE Teachers1
DROP CONSTRAINT FK__Teachers1__IdPos__45F365D3;
--Column u silme
ALTER TABLE Teachers1
DROP COLUMN IdPost

--3

ALTER TABLE Teachers1
ADD CONSTRAINT HireDate_Before_1990
CHECK(HireDate <= '1990-01-01 ')

--4
ALTER TABLE Teachers1
ADD CONSTRAINT UNK_CODE UNIQUE(Code)

--5
ALTER TABLE Teachers1
ALTER COLUMN Salary NUMERIC(6,2)

--6
ALTER TABLE Teachers1
ADD CONSTRAINT CHK_Salary_Range
CHECK(Salary BETWEEN 1000 AND 5000)

--7
EXEC sp_rename 'Teachers1.Tel','Phone','COLUMN'

--8
ALTER TABLE Teachers1
ALTER COLUMN Phone CHAR(11)

--9
CREATE TABLE Posts(
Id INT PRIMARY KEY ,
Name NVARCHAR(20)
);

--10

ALTER TABLE Posts
ADD CONSTRAINT CHK_NAME_Posts
CHECK(Name IN ('professor', 'assistant professor', 'teacher', 'assistant'))

--11
ALTER TABLE Teachers1
ADD CONSTRAINT CHK_NAME_Teachers
CHECK (Name NOT LIKE '%[0-9]%')

--12
ALTER TABLE Teachers1
ADD  IdPost INT 

--13
ALTER TABLE Teachers1
ADD FOREIGN KEY (IdPost) REFERENCES Posts(Id) 

--15

INSERT INTO Posts (Id, Name)
VALUES (1, N'Professor ');
INSERT INTO Posts (Id, Name)
VALUES (2, N'Docent ');
INSERT INTO Posts(Id, Name)
VALUES (3, N'Teacher');
INSERT INTO Posts (Id, Name)
VALUES (4, N'Assistant ');
INSERT INTO Teachers1 (Id, Name, Code, IdPost, Tel, Salary, Rise, HireDate)
VALUES 
(1, N'Sidorov', '0123456789', 1, NULL, 1070, 470, '1992-09-01'),
(2, N'Ramishevsky', '4567890123', 2, '4567890', 1110, 370, '1998-09-09'),
(3, N'Horenko', '1234567890', 3, NULL, 2000, 230, '2001-10-10'),
(4, N'Vibrovsky', '2345678901', 4, NULL, 4000, 170, '2003-09-01'),
(5, N'Voropaev', NULL, 4, NULL, 1500, 150, '2002-09-02'),
(6, N'Kuzintsev', '5678901234', 3, '4567890', 3000, 270, '1991-01-01');--16CREATE VIEW GetAllTitles
AS
SELECT Name
FROM Posts;

SELECT * FROM GetAllTitles;

--16.2
CREATE VIEW TeachersNames
AS
SELECT Name
FROM Teachers1;

SELECT * FROM TeachersNames;

--16.3
CREATE VIEW SortBySalary
AS
SELECT Teachers1.Id AS TeacherId,Teachers1.[Name] AS TeacherName,Posts.[Name]AS PositionName,Teachers1.Salary AS generalSalary
FROM Teachers1
JOIN Posts ON Posts.Id = Teachers1.IdPost

SELECT * FROM SortBySalary
ORDER BY generalSalary

--16.4
CREATE VIEW TeachersOnlyHasPhone
AS
SELECT Teachers1.Id,Teachers1.Name,Teachers1.Tel
FROM Teachers1
WHERE Teachers1.Tel IS NOT NULL

SELECT * FROM TeachersOnlyHasPhone

--16.5
CREATE VIEW TeacherDetails
AS
SELECT Teachers1.Name AS TeacherName ,Posts.Name AS PositionName,FORMAT(Teachers1.HireDate,'dd/MM/yy') AS DateOfAdmission
FROM Teachers1
JOIN Posts ON Posts.Id = Teachers1.IdPost

SELECT * FROM  TeacherDetails

--16.6
CREATE VIEW TeacherDetails2
AS
SELECT Teachers1.Name AS TeacherName ,Posts.Name AS PositionName,FORMAT(Teachers1.HireDate,'[dd month_text yyyy') AS DateOfAdmission
FROM Teachers1
JOIN Posts ON Posts.Id = Teachers1.IdPost

SELECT * FROM  TeacherDetails2