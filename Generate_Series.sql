select 	
	y.value,
	count(Spacecraft) 'Missions'
from 
	MoonMissions m
	right join generate_series(1958, 2019) y on y.value = year(m.[Launch date])
group by
	y.value

select * from MoonMissions
select * from generate_series(1958, 2019)


declare @text nvarchar(500) = 'In SQL Server, you can use T-SQL to check the compatibility level of a database. All you need to do is query sys.databases to find the compatibility level for the database in question.';
declare @newText nvarchar(500) = '';

select 
	@newText += substring(@text, value, 1)
from 
	generate_series(1, len(@text)) 
where 
	substring(@text, value, 1) not in (' ', 'a', 'i', 'e', 'o');

print @newText;

create table movies
(
	Id int primary key identity(1, 1),
	Name nvarchar(100),
	CreatedAt datetime default(getdate())
)

-- Client side loop (14 seconds)
insert into movies (Name) values('MyMovie');
go 10000

truncate table movies

-- Server side loop (3 seconds)
declare @i int = 0;
while @i < 10000
begin
	insert into movies (Name) values('MyMovie');	
	set @i += 1;
end

truncate table movies

-- Set based solution (0.25 seconds)
insert into movies(Name) select 'MyMovie' from generate_series(1, 10000);

select top 20 * from movies
