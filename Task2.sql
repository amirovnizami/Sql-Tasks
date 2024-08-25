--2
SELECT Asistant.TeacherId, Teachers.Name,Teachers.SurName
FROM Asistant
JOIN Teachers ON Teachers.Id = Asistant.TeacherId
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
WHERE Groups.Name = 'Qrup 1'

--3

SELECT Subjects.Name
FROM Subjects
JOIN Lectures ON Subjects.Id = Lectures.SubjectId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
WHERE Teachers.Name = 'Rashad' AND Groups.Year = 5
 --4
 SELECT Teachers.Name
FROM Teachers
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN Schedules ON Lectures.Id = Schedules.LectureId
WHERE DayOfWeek != 1

--6
SELECT Teachers.Name
FROM Teachers
JOIN Deans ON Deans.TeacherId = Teachers.Id
JOIN Faculties ON Faculties.DeanId = Deans.Id
WHERE Faculties.Name != 'Tebiyyat elmler fakultesi'

--7
SELECT Faculties.Building
FROM Faculties
UNION
SELECT Departments.Building
FROM Departments
UNION 
SELECT LectureRooms.Building
FROM LectureRooms

--8
