CREATE DATABASE Theory


CREATE TABLE Subjects(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(100) NOT NULL CHECK(LEN([Name]) >0) UNIQUE,
);

CREATE TABLE Teachers(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(MAX) NOT NULL CHECK(LEN([Name]) >0),
SurName NVARCHAR(MAX) NOT NULL CHECK(LEN(SurName) >0),
);

CREATE TABLE Asistant(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
TeacherId INT FOREIGN KEY REFERENCES Teachers(Id) NOT NULL
);

CREATE TABLE Curators(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
TeacherId INT FOREIGN KEY REFERENCES Teachers(Id) NOT NULL
);

CREATE TABLE Deans(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
TeacherId INT FOREIGN KEY REFERENCES Teachers(Id) NOT NULL
);

CREATE TABLE Departments(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Building INT NOT NULL CHECK(Building BETWEEN 1 AND 5),
[Name] NVARCHAR(100) NOT NULL CHECK(LEN([Name]) >0),
FacultyId INT FOREIGN KEY REFERENCES Faculties(Id) NOT NULL,
HeadId INT FOREIGN KEY REFERENCES Heads(Id) NOT NULL,
);

CREATE TABLE Faculties(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Building INT NOT NULL CHECK(Building BETWEEN 1 AND 5),
[Name] NVARCHAR(100) NOT NULL CHECK(LEN([Name]) >0),
DeanId INT FOREIGN KEY REFERENCES Deans(Id) NOT NULL,
);

CREATE TABLE Groups(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(100) NOT NULL CHECK(LEN([Name]) >0) UNIQUE,
Year INT NOT NULL CHECK(Year BETWEEN 1 AND 5),
DeparmentId INT FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
);

CREATE TABLE GroupsCurators(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CuratorId INT FOREIGN KEY REFERENCES Curators(Id) NOT NULL,
GroupId INT FOREIGN KEY REFERENCES Groups(Id) NOT NULL,
);

CREATE TABLE GroupsLectures(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
GroupId INT FOREIGN KEY REFERENCES Groups(Id) NOT NULL,
LectureId INT FOREIGN KEY REFERENCES Lectures(Id) NOT NULL,
);

CREATE TABLE Heads(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
TeacherId INT FOREIGN KEY REFERENCES Teachers(Id) NOT NULL
);

CREATE TABLE LectureRooms(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Building INT NOT NULL CHECK(Building BETWEEN 1 AND 5),
ClassRoom NVARCHAR(100) NOT NULL CHECK(LEN(ClassRoom) >0),
);

CREATE TABLE Lectures(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
SubjectId INT FOREIGN KEY REFERENCES Subjects(Id) NOT NULL,
TeacherId INT FOREIGN KEY REFERENCES Teachers(Id) NOT NULL
);

CREATE TABLE Schedules(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Class INT NOT NULL CHECK(Class BETWEEN 1 AND 8),
[DayOfWeek] INT NOT NULL CHECK([DayOfWeek] BETWEEN 1 AND 7),
[Week] INT NOT NULL CHECK([Week] BETWEEN 1 AND 52),
LectureId INT FOREIGN KEY REFERENCES Lectures(Id) NOT NULL,
LectureRoomId INT FOREIGN KEY REFERENCES LectureRooms(Id) NOT NULL
);


-- Subjects tablosu için insert komutlar?
INSERT INTO Subjects ([Name]) VALUES (N'Riyaziyyat');
INSERT INTO Subjects ([Name]) VALUES (N'Fizika');
INSERT INTO Subjects ([Name]) VALUES (N'Kimya');
INSERT INTO Subjects ([Name]) VALUES (N'Biologiya');
INSERT INTO Subjects ([Name]) VALUES (N'Tarix');

-- Teachers tablosu için insert komutlar?
INSERT INTO Teachers ([Name], SurName) VALUES (N'Elchin', N'Veliyev');
INSERT INTO Teachers ([Name], SurName) VALUES (N'Leyla', N'Mammadova');
INSERT INTO Teachers ([Name], SurName) VALUES (N'Tahir', N'Guliyev');
INSERT INTO Teachers ([Name], SurName) VALUES (N'Nigar', N'Hesenova');
INSERT INTO Teachers ([Name], SurName) VALUES (N'Rashad', N'Abbasov');

-- Asistant tablosu için insert komutlar?
INSERT INTO Asistant (TeacherId) VALUES (1);
INSERT INTO Asistant (TeacherId) VALUES (2);
INSERT INTO Asistant (TeacherId) VALUES (3);
INSERT INTO Asistant (TeacherId) VALUES (4);
INSERT INTO Asistant (TeacherId) VALUES (5);

-- Curators tablosu için insert komutlar?
INSERT INTO Curators (TeacherId) VALUES (1);
INSERT INTO Curators (TeacherId) VALUES (2);
INSERT INTO Curators (TeacherId) VALUES (3);
INSERT INTO Curators (TeacherId) VALUES (4);
INSERT INTO Curators (TeacherId) VALUES (5);

-- Deans tablosu için insert komutlar?
INSERT INTO Deans (TeacherId) VALUES (1);
INSERT INTO Deans (TeacherId) VALUES (2);
INSERT INTO Deans (TeacherId) VALUES (3);
INSERT INTO Deans (TeacherId) VALUES (4);
INSERT INTO Deans (TeacherId) VALUES (5);

-- Faculties tablosu için insert komutlar?
INSERT INTO Faculties (Building, [Name], DeanId) VALUES (1, N'Humanitar elmler fakultesi', 1);
INSERT INTO Faculties (Building, [Name], DeanId) VALUES (2, N'Tebiyyat elmler fakultesi', 2);
INSERT INTO Faculties (Building, [Name], DeanId) VALUES (3, N'Tarix fakultesi', 3);
INSERT INTO Faculties (Building, [Name], DeanId) VALUES (4, N'Maliyy? fakultesi', 4);
INSERT INTO Faculties (Building, [Name], DeanId) VALUES (5, N'?qtisadiyyat fakultesi', 5);

-- Heads tablosu için insert komutlar?
INSERT INTO Heads (TeacherId) VALUES (1);
INSERT INTO Heads (TeacherId) VALUES (2);
INSERT INTO Heads (TeacherId) VALUES (3);
INSERT INTO Heads (TeacherId) VALUES (4);
INSERT INTO Heads (TeacherId) VALUES (5);

-- Departments tablosu için insert komutlar?
INSERT INTO Departments (Building, [Name], FacultyId, HeadId) VALUES (1, N'Riyaziyyat', 1, 1);
INSERT INTO Departments (Building, [Name], FacultyId, HeadId) VALUES (2, N'Fizika', 2, 2);
INSERT INTO Departments (Building, [Name], FacultyId, HeadId) VALUES (3, N'Kimya', 3, 3);
INSERT INTO Departments (Building, [Name], FacultyId, HeadId) VALUES (4, N'Biologiya', 4, 4);
INSERT INTO Departments (Building, [Name], FacultyId, HeadId) VALUES (5, N'Tarix', 5, 5);

-- Groups tablosu için insert komutlar?
INSERT INTO Groups ([Name], Year, DeparmentId) VALUES (N'Qrup 1', 1, 1);
INSERT INTO Groups ([Name], Year, DeparmentId) VALUES (N'Qrup 2', 2, 2);
INSERT INTO Groups ([Name], Year, DeparmentId) VALUES (N'Qrup 3', 3, 3);
INSERT INTO Groups ([Name], Year, DeparmentId) VALUES (N'Qrup 4', 4, 4);
INSERT INTO Groups ([Name], Year, DeparmentId) VALUES (N'Qrup 5', 5, 5);

-- GroupsCurators tablosu için insert komutlar?
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (1, 1);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (2, 2);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (3, 3);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (4, 4);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (5, 5);

-- LectureRooms tablosu için insert komutlar?
INSERT INTO LectureRooms (Building, ClassRoom) VALUES (1, N'Otaq 101');
INSERT INTO LectureRooms (Building, ClassRoom) VALUES (2, N'Otaq 102');
INSERT INTO LectureRooms (Building, ClassRoom) VALUES (3, N'Otaq 103');
INSERT INTO LectureRooms (Building, ClassRoom) VALUES (4, N'Otaq 104');
INSERT INTO LectureRooms (Building, ClassRoom) VALUES (5, N'Otaq 105');

-- Lectures tablosu için insert komutlar?
INSERT INTO Lectures (SubjectId, TeacherId) VALUES (1, 1);
INSERT INTO Lectures (SubjectId, TeacherId) VALUES (2, 2);
INSERT INTO Lectures (SubjectId, TeacherId) VALUES (3, 3);
INSERT INTO Lectures (SubjectId, TeacherId) VALUES (4, 4);
INSERT INTO Lectures (SubjectId, TeacherId) VALUES (5, 5);

-- GroupsLectures tablosu için insert komutlar?
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (1, 1);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (2, 2);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (3, 3);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (4, 4);
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES (5, 5);

-- Schedules tablosu için insert komutlar?
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 1, 1, 1, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 2, 2, 2, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 3, 3, 3, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 4, 4, 4, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 5, 5, 5, 5);

--Tasks
--1
SELECT LectureRooms.ClassRoom
FROM LectureRooms
JOIN Schedules ON LectureRooms.Id = Schedules.LectureRoomId
JOIN Lectures ON Schedules.LectureId = Lectures.Id
JOIN Teachers ON Teachers.Id = Lectures.TeacherId

WHERE Teachers.Name = 'Leyla'

--2

