--Database "Library"
  
--1. Select all publishers that have books published (3 methods - EXISTS, ANY, SOME).
--2. Display the book with the maximum number of pages (2 ways - ALL, aggregate function).
--3. Select all teachers who did not take books in the library (2 methods - EXISTS or ANY, JOIN) .
--4. Choose the books that students and teachers took (2 ways - EXISTS or ANY, JOINs).
--5. Choose categories in which books were not taken.


--1

SELECT Authors.FirstName ,Authors.LastName	
FROM Authors
WHERE EXISTS(SELECT * FROM Books WHERE Books.Id_Author = Authors.Id)

--ANY,SOME

SELECT *
FROM Authors
WHERE Authors.Id = ANY(SELECT Id_Author FROM Books)

--2
SELECT *
FROM Books
WHERE Books.Pages >= ALL(SELECT Books.Pages  FROM Books)
--AGREGATE FUNC

SELECT Books.Name,Books.Pages 
FROM Books
WHERE Books.Pages = (SELECT MAX(Books.Pages) FROM Books)

--3

SELECT *
FROM Teachers
JOIN T_Cards ON Teachers.Id = T_Cards.Id_Teacher
WHERE T_Cards.Id_Teacher = ANY (SELECT Teachers.Id FROM Teachers)

--4
SELECT DISTINCT Books.Name 
FROM Books
JOIN S_Cards ON S_Cards.Id = Books.ID
JOIN Libs ON Libs.Id = S_Cards.Id_Lib
JOIN T_Cards ON Libs.Id = T_Cards.Id_Lib
JOIN Students ON Students.Id = S_Cards.Id_Student
WHERE T_Cards.Id_Teacher = ANY (SELECT Teachers.Id FROM Teachers) AND
S_Cards.Id_Student = ANY(SELECT Students.Id FROM Students)



--5
SELECT Categories.Name
FROM Categories
EXCEPT
SELECT DISTINCT Categories.Name 
FROM Categories
JOIN Books ON Books.Id_Category = Categories.Id
JOIN S_Cards ON S_Cards.Id = Books.ID
JOIN Libs ON Libs.Id = S_Cards.Id_Lib
JOIN T_Cards ON Libs.Id = T_Cards.Id_Lib
JOIN Students ON Students.Id = S_Cards.Id_Student
WHERE T_Cards.Id_Teacher = ANY (SELECT Teachers.Id FROM Teachers) AND
S_Cards.Id_Student = ANY(SELECT Students.Id FROM Students)
