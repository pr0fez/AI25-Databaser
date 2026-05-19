drop table teachers;

create table teachers (
    id int primary key identity(100, 5),
    name nvarchar(max),
    birthdate datetime2);

insert into teachers values ('Teacher', getdate());
select * from teachers;

insert into teachers values ('Another', getdate());

delete from teachers where id between 105 and 115;
insert into teachers values ('Teacher', getdate());

truncate table teachers;

select newid();

drop table products;
create table products (
    id uniqueidentifier primary key,
    name nvarchar(max)
);

insert into products values(newid(), 'product name');
select * from products;

select cast(5.6 as int);

select convert(int, 5.6);
select convert(nvarchar, getdate(), 121);

select format(getdate(), 'yy, MM, dd, hh - HH:mm:ss.fff')


declare @name nvarchar(max) = 'Arthur';

declare @firstname nvarchar(max);
declare @lastname nvarchar(max);

select @firstname = firstname, @lastname = lastname from users 
where firstname = @name
order by FirstName;

select @firstname, @lastname;

select * from users;

declare @names nvarchar(max) = '';

select @names += firstname from users;

print @names

select @names