CREATE DATABASE Theory1


CREATE TABLE Subjects(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Name NVARCHAR(100)  NOT NULL UNIQUE CHECK(LEN(Name)>0)
);

CREATE TABLE Teachers(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Name NVARCHAR(MAX) NOT NULL CHECK(LEN(Name)>0),
Salary MONEY NOT NULL CHECK(Salary>=0),
Surname NVARCHAR(MAX) NOT NULL CHECK(LEN(Surname)>0),
);

CREATE TABLE Curators(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Name NVARCHAR(MAX) NOT NULL CHECK(LEN(Name)>0),
Surname NVARCHAR(MAX) NOT NULL CHECK(LEN(Surname)>0),
);

CREATE TABLE Faculties(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Financing MONEY NOT NULL CHECK(Financing>0) DEFAULT 0,
Name NVARCHAR(100) NOT NULL CHECK(LEN(Name) >0) UNIQUE,
);

CREATE TABLE Departments(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Financing MONEY NOT NULL CHECK(Financing >0) DEFAULT 0,
Name NVARCHAR(100) NOT NULL CHECK(LEN(Name) >0) UNIQUE,
FacultyId INT NOT NULL FOREIGN KEY(FacultyId) REFERENCES Faculties(Id)
);

CREATE TABLE Groups(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Name NVARCHAR(100) NOT NULL CHECK(LEN(Name) >0) UNIQUE,
Year INT NOT NULL CHECK(Year BETWEEN 1 AND 5),
DepartmentId INT NOT NULL FOREIGN KEY(DepartmentId) REFERENCES Departments(Id)
);

CREATE TABLE GroupsCurators(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CuratorId INT FOREIGN KEY  (CuratorId) REFERENCES Curators(Id) NOT NULL,
GroupId INT FOREIGN KEY  (GroupId) REFERENCES Groups(Id) NOT NULL,
);

CREATE TABLE Lectures(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ClassRoom NVARCHAR(MAX) NOT NULL CHECK(LEN(ClassRoom) > 0),
SubjectId INT FOREIGN KEY  (SubjectId) REFERENCES Subjects(Id) NOT NULL,
TeacherId INT FOREIGN KEY  (TeacherId) REFERENCES Teachers(Id) NOT NULL,
);

CREATE TABLE GroupLectures(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
GroupId INT FOREIGN KEY  (GroupId) REFERENCES Groups(Id) NOT NULL,
LectureId INT FOREIGN KEY  (LectureId) REFERENCES Lectures(Id) NOT NULL,
);

-- Insert data into Subjects
INSERT INTO Subjects (Name)
VALUES 
('Riyaziyyat'),
('Fizika'),
('Kimya'),
('Biologiya'),
('?ngilis Dili');

INSERT INTO Subjects(Name)
VALUES('DataBase Theory');
-- Insert data into Teachers
INSERT INTO Teachers (Name, Surname, Salary)
VALUES 
('Murad', '?liyev', 1500),
('Leyla', 'Quliyeva', 1400),
('Rasim', 'H?s?nov', 1300),
('Ayg?n', 'M?mm?dova', 1600),
('Elvin', 'Rzayev', 1200);

INSERT INTO Teachers (Name, Surname, Salary)
VALUES 
('Amid', 'Amilov', 1500);

-- Insert data into Curators
INSERT INTO Curators (Name, Surname)
VALUES 
('Nigar', 'N?sibova'),
('R??ad', '?brahimov'),
('N?rgiz', '?smay?lova'),
('Samir', '?s?dov'),
('G?l??n', '?liyeva');

-- Insert data into Faculties
INSERT INTO Faculties (Name, Financing)
VALUES 
('?qtisadiyyat', 50000),
('H?quq', 45000),
('Tibb', 60000),
('M?h?ndislik', 55000),
('Humanitar Elml?r', 40000);

-- Insert data into Departments
INSERT INTO Departments (Name, Financing, FacultyId)
VALUES 
('Maliyy?', 10000, 1),
('Cinay?t h?ququ', 9000, 2),
('C?rrahl?q', 15000, 3),
('Elektronika', 12000, 4),
('Tarix', 8000, 5);

-- Insert data into Groups
INSERT INTO Groups (Name, Year, DepartmentId)
VALUES 
('Maliyy?-1', 1, 1),
('Cinay?t h?ququ-1', 2, 2),
('C?rrahl?q-1', 3, 3),
('Elektronika-1', 4, 4),
('Tarix-1', 5, 5);

-- Insert data into GroupsCurators
INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert data into Lectures
INSERT INTO Lectures (ClassRoom, SubjectId, TeacherId)
VALUES 
('101', 1, 1),
('102', 2, 2),
('103', 3, 3),
('104', 4, 4),
('105', 5, 5);

INSERT INTO Lectures (ClassRoom, SubjectId, TeacherId)
VALUES 
('106', 6, 6);
-- Insert data into GroupLectures
INSERT INTO GroupLectures (GroupId, LectureId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


SELECT *
FROM Faculties
SELECT *
FROM Departments
--1
SELECT Teachers.Id,Teachers.Name,Teachers.Salary,Teachers.Surname
FROM Teachers
FULL JOIN Groups ON Teachers.Id = Groups.Id
--2
SELECT Faculties.Name
FROM Faculties
INNER JOIN Departments ON Departments.FacultyId = Faculties.Id

--3
SELECT Groups.Name,Curators.Name + ' ' + Curators.Surname AS FullName
FROM Groups
INNER JOIN GroupsCurators ON GroupsCurators.GroupId = Groups.Id
INNER JOIN Curators ON Curators.Id = GroupsCurators.CuratorId

--4 , --5
SELECT Teachers.Name + ' ' + Teachers.Surname AS FullName,GROUPS.Name
FROM Teachers
INNER JOIN Lectures ON Lectures.TeacherId = Teachers.Id
INNER JOIN GroupLectures ON GroupLectures.LectureId = Lectures.Id
INNER JOIN Groups ON Groups.Id = GroupLectures.GroupId
WHERE Groups.Name = 'TARIX -1'

--6
SELECT Groups.Name ,Departments.Name
FROM Groups
INNER JOIN Departments ON Departments.Id = Groups.DepartmentId

--7
SELECT Subjects.Name , Teachers.Name + ' ' + Teachers.Surname AS FullName
FROM Subjects
INNER JOIN Lectures ON Lectures.SubjectId = Subjects.Id
INNER JOIN Teachers ON Teachers.Id = Lectures.TeacherId

WHERE Teachers.Name = 'Elvin'

--8
SELECT Departments.Name
FROM Departments
JOIN Groups  ON Departments.Id = Groups.DepartmentId
JOIN GroupLectures ON Groups.Id = GroupLectures.GroupId
JOIN Lectures ON GroupLectures.LectureId = Lectures.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
WHERE Subjects.Name = 'DataBase Theory'

--9

SELECT Groups.Name
FROM Groups
JOIN Departments ON Groups.DepartmentId = DepartmentS.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id
WHERE Faculties.Name = 'Tibb'

--10
SELECT Groups.Name , Faculties.Name
FROM Groups
JOIN Departments  ON Departments.Id = Groups.DepartmentId
JOIN Faculties ON Faculties.Id = DepartmentS.FacultyId
WHERE Groups.Year = '5'

--11
SELECT Teachers.Name,Subjects.Name,Lectures.ClassRoom
FROM Teachers
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
WHERE Lectures.ClassRoom = '102'
