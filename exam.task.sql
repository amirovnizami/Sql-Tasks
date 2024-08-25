---1 
create function getStudentsByGroupName(@GroupName nvarchar(50))
returns table 
as 
return(
select  s.FirstName,s.LastName,Groups.Name as GroupName,Faculties.Name as FacultyName from Students as s
join Groups on Groups.Id = s.GroupId
join Faculties on Faculties.Id = Groups.FacultyId

where Groups.Name = @GroupName
)
select * from dbo.getStudentsByGroupName ('KM01' )  

--2
--create function getWorkersByPosition(@PositionName nvarchar(50))
--returns table 
--as 
--return(
--select w.Id,w.FirstName as FirstName ,w.LastName as LastName, Positions.Position as PositionName from Workers as w
--join Positions on Positions.WorkerId = w.id
--where @PositionName = Positions.Position
--)

--select *  from dbo.getWorkersByPosition('Asistent')
--select * from Positions

--3
--use Academy2
--create function getSchedulesByGroup(@groupName nvarchar(10))
--returns table
--as
--return(
--	select s.DayOfWeek as Day ,s.Week as Week,
--	Groups.Name as GroupName,Faculties.Name as FacultyName,Subjects.Name as Subject 
--	from Schedules as s
--	join Subjects on Subjects.Id = s.SubjectId
--	join Faculties on Faculties.Id = Subjects.FacultyId
--	join Groups on Groups.Id = s.GroupId
--	where @groupName = Groups.Name
--)

--select *  from dbo.getSchedulesByGroup('IT01') 

--select * from Groups

--5

create function getSchedulesByAuditoria(@auditoriaName nvarchar(10))
--returns table
--as
--return(
--	select s.DayOfWeek as Day ,s.Week as Week,
--	Groups.Name as GroupName,Faculties.Name as FacultyName,Subjects.Name as Subject 
--	from Schedules as s
--	join Subjects on Subjects.Id = s.SubjectId
--	join Faculties on Faculties.Id = Subjects.FacultyId
--	join Groups on Groups.Id = s.GroupId
--	where @groupName = Groups.Name