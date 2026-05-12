drop table my_countries;
drop table cities;

create table my_countries (
    id int primary key,
    name nvarchar(max)
);

create table cities (
    id int primary key,
    name nvarchar(max),
    countryId int
);

insert into my_countries values (1, 'Sweden');
insert into my_countries values (2, 'Norway');
insert into my_countries values (3, 'Denmark');
insert into my_countries values (4, 'Finland');

insert into cities values (1, 'Stockholm', 1);
insert into cities values (2, 'Gothenburg', 1);
insert into cities values (3, 'Malmö', 1);
insert into cities values (4, 'Oslo', 2);
insert into cities values (5, 'Bergen', 2);
insert into cities values (6, 'Copenhagen', 3);
insert into cities values (7, 'London', 5);

select * from my_countries;
select * from cities;

select
    cities.id,
    my_countries.id,
    cities.name,
    my_countries.name
from
    my_countries
    cross join cities;


select
    ci.id,
    ci.name as 'City',
    co.name as 'Country',
    co.id,
    ci.countryId
from
    my_countries co
    right join cities ci on co.id = ci.countryId;

/* 
    Ta ut alla länder med en kolumn för namn på landet, en kolumn med 
    antal städer och en kolumn med en kommaseparerad list med namnen
    på städerna. 
*/

select
    co.name as 'Country',
    count(ci.id) as 'Number of cities',
    isnull(string_agg(ci.name, ', '), '-') as 'Cities'
from 
    my_countries co
    full outer join cities ci on co.id = ci.countryId
group by co.name;

select * from students;

create table students(
    id int primary key,
    name nvarchar(max)
);

insert into students values (1, 'Thomas')
--insert into students values (1, 'Thomas')
--insert into students values (1, 'Thomas')
--insert into students values (1, 'Thomas')

create table courses (
    id int primary key,
    name nvarchar(max)
);

select * from courses;

create table studentsCourses(
    studentId int,
    courseId int
);

select * from studentsCourses;

select
    s.name as 'Student name',
    c.name as 'Course'
from
    students s
    join studentsCourses sc on s.id = sc.studentId
    join courses c on c.id = sc.courseId
order by s.name;

/*
    Ta ut en lista med de olika kurserna samt hur många studenter
    det är på varje kurs.
*/
select
    c.name as 'Course Name',
    COUNT(s.id) as 'Number of students'
from 
    students s
    right join studentsCourses sc on s.id = sc.studentId
    right join courses c on c.id = sc.courseId
group by
    c.name
order by
    c.name;

/*
    Sök ut en lista med de olika studenterna samt hur många kurser
    varje student går
*/
select
    students.name as 'Student',
    count(studentId) as 'Number of courses'
from
    studentsCourses
    right join students on students.id = studentsCourses.studentId
group by
    students.name;

