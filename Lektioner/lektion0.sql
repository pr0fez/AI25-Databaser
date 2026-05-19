create table my_countries (
    id int,
    name nvarchar(max)
)

insert into my_countries values (1, 'Sweden');
insert into my_countries values (2, 'Norway');
insert into my_countries values (3, 'Denmark');
insert into my_countries values (4, 'Finland');

create table cities (
    id int,
    name nvarchar(max),
    countryId int
)

insert into cities values (1, 'Stockholm', 1);
insert into cities values (2, 'Gethonburg', 1);
insert into cities values (3, 'Malmö', 1);
insert into cities values (4, 'Olso', 2);
insert into cities values (5, 'Bergen', 2);
insert into cities values (6, 'Copenhagen', 3);
insert into cities values (7, 'London', 5);

select
    cities.id,
    my_countries.id,
    countryId,
    cities.*,
    *
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
    right join cities ci on co.id  = ci.countryId






select
    my_countries.name as 'Country',
    count(cities.id) as 'Number of cities',
    isnull(string_agg(cities.name, ', '), '-') as 'Cities'
from
    my_countries
    full outer join cities on my_countries.id = cities.countryId
group by
    my_countries.name;

select * from my_countries,cities where my_countries.id =cities.countryId

create table students (
    id int primary key,
    name nvarchar(max)
);
insert into students values (1, 'Thomas');
insert into students values (2, 'Stefan');
insert into students values (3, 'Camilla');
insert into students values (4, 'Daniel');
insert into students values (5, 'Niklas');
insert into students values (6, 'Anna');
insert into students values (7, 'Helena');

create table courses (
    id int primary key,
    name nvarchar(max)
);
insert into courses values (1, 'Python');
insert into courses values (2, 'Databehandling');
insert into courses values (3, 'Databaser');
insert into courses values (4, 'Linjär algebra');

create table studentsCourses (
    studentId int,
    courseId int
);

insert into studentsCourses values (1,1), (3,1), (4,1);
insert into studentsCourses values (6,1);
insert into studentsCourses values (1,2);
insert into studentsCourses values (6,2);
insert into studentsCourses values (7,2)
insert into studentsCourses values (1,3);
insert into studentsCourses values (2,1);
insert into studentsCourses values (3,1);
insert into studentsCourses values (4,1);
insert into studentsCourses values (5,1);
insert into studentsCourses values (6,1);

select * from students;
SELECT * from courses;
select * from studentsCourses;

select
    s.name as 'Student name',
    c.name as 'Course'
from
    students s
    join studentsCourses sc on s.id = sc.studentId
    join courses c on c.id = sc.courseId;

select
    c.name as 'Course Name',
    count(s.id) as 'Number of students' 
from
    students s
    right join studentsCourses sc on s.id = sc.studentId
    right join courses c on c.id = sc.courseId
group by
    c.name
order by
    c.name;

select
    students.name as 'Student',
    count(studentId) as 'Number of courses'
from
    studentsCourses
    right join students on students.id = studentsCourses.studentId
group by
    students.name


