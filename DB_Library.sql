--select * from Press
--select * from Books
----1
--create function minPage(@sendPublisher varchar(20))
--returns int
--as
--begin 
--	declare @min_Page int
--	select @min_Page =  min(Books.Pages) from Books
--	inner join Press on Press.Id = Books.Id_Press
--	where Press.Name = @sendPublisher
--	return @min_Page
--end

--select dbo.minPage('BHV')

----2

--create function greaterthanN(@n int)
--returns table
--as
--return(
--	select Press.Name  from Press
--	join Books on Books.Id_Press = Press.Id
--	group by Press.Name
--	having @n <AVG(Books.Pages)  
	
--)
--select * from dbo.greaterthanN(330)

----3

--create function sumPage(@sendedPublsiher varchar(20))
--returns int
--as
--begin
--	declare @page_sum int
--	select @page_sum = SUM(Books.Pages) from Books
--	inner join Press on Press.Id = Books.Id_Press
--	where @sendedPublsiher = Press.Name
--	return @page_sum
--end


--select dbo.sumPage('Piter')

--4
--select * from S_Cards
--create function betweentoDate(@date1 date ,@date2 date)
--returns table
--as
--return(
--	select Students.FirstName,Students.LastName from Students
--	join S_Cards on S_Cards.Id_Student = Students.Id
--	where S_Cards.DateOut between @date1 and @date2 
--)

--select * from dbo.betweentoDate('2001-05-10','2001-06-02')

--5

select * from S_Cards

--create function workNow()
--returns table 
--as 
--return(
--	select Students.FirstName,Students.LastName from Students
--	join S_Cards on S_Cards.Id_Student = Students.Id
--	where S_Cards.DateIn is null
--)

--select * from dbo.workNow()

--6

--create function publisherPressThan(@n int)
--returns table 
--as 
--return(
--	select Press.Name from Press
--	join Books on Books.Id_Press = Press.Id
--	group by Press.Name
--	having sum(Books.Pages) > @n
--)

--select  * from dbo.publisherPressThan(1000) 

--7

--create function popularAuthor()
--returns  @PopularAuthor table 
--(
--	FirstName nvarchar(20)
--)
--as
--begin 
--	declare @max_count int
--	SELECT @max_count = MAX(RepeatCount)
--	FROM (
--		SELECT TOP 1 COUNT(*) AS RepeatCount
--		FROM Books
--		JOIN Authors ON Books.Id_Author = Authors.Id
--		GROUP BY Id_Author
--		ORDER BY RepeatCount DESC
--	) AS MaxCountTable;

--	insert into @PopularAuthor
--	select FirstName
--	from Authors
--	join Books on Books.Id_Author = Authors.Id
--	group by FirstName
--	having count(Books.Id_Author) = @max_count
--	return

--end

--select * from Authors
--select * from dbo.popularAuthor()

--8

--create function tookenBook()
--returns table 
--as
--return(
--	select distinct Books.Name from Books
--	join S_Cards on S_Cards.Id_Book = Books.Id
--	join T_Cards on T_Cards.Id_Book = Books.Id
--	where S_Cards.Id_Book = T_Cards.Id_Book
--)

--select * from dbo.tookenBook()

--9

--create function count_Student()
--returns table 
--as 
--RETURN (
--    SELECT 
--        count(*) as StudentCount
--    FROM 
--        Students
--    left join 
--        S_Cards ON S_Cards.Id_Student = Students.Id

--	where S_Cards.Id_Student is null
--    --GROUP BY 
--    --    Students.Id, 
--    --    Students.FirstName
--);

--select * from dbo.count_Student()

--10

create function giveBookLibs()
returns table 
as return(
	select  distinct Libs.FirstName, count(*)as Book_Count  from Libs
	join(
	select S_Cards.Id_Lib from S_Cards
	union all
	select T_Cards.Id_Lib from T_Cards
	) as  tookenByLibs on tookenByLibs.Id_Lib = Libs.Id
	group by Libs.FirstName
)


select * from dbo.giveBookLibs()
