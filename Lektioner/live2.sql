drop table cities;
drop table my_countries;
create table my_countries (
    id int PRIMARY KEY,
    name nvarchar(max)
);

select * from my_countries;

insert into my_countries values (1, 'Sweden');
insert into my_countries values (2, 'Norway');
insert into my_countries values (3, 'Denmark');
insert into my_countries values (4, 'Finland');

create table cities (
    id int,
    name nvarchar(max),
    countryId int,
    CONSTRAINT fk_countryId
    FOREIGN KEY (countryId)
    REFERENCES my_countries(id)
);

insert into cities values (1, 'Stockholm', 1)
insert into cities values (2, 'Gethoburg', 1)
insert into cities values (3, 'Malmö', 1)
insert into cities values (4, 'Oslo', 2)
insert into cities values (5, 'Bergen', 2)
insert into cities values (6, 'Köpenhamn', 3)
insert into cities values (7, 'London', 5)

select * from cities;

select distinct Season from GameOfThrones;
select distinct [Directed by], [Written by] from GameOfThrones where [Directed by] like 'Alan%';

SELECT distinct [Directed by], [Written by], 
       CONVERT(varbinary(max), [Written by]) as len1
FROM GameOfThrones
where [Directed by] like 'Alan%';

select
    Episode,
    Title,
    [U.S. viewers(millions)],
    case
        when [U.S. viewers(millions)] < 3 then 'Few'
        when [U.S. viewers(millions)] < 6 then 'Average'
        else 'Many'
    end as 'Viewers'
 from GameOfThrones
 where
    Season < 5;