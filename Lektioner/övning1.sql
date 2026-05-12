--select * from GameOfThrones;
select * into #users2 from users;

select
    title,
    season,
    EpisodeInSeason,
    --format(Season, 'S0#') + format(EpisodeInSeason, 'E0#') as 'Episodes'
    'S' +format(Season, '00') + 'E' + format(EpisodeInSeason, '00') as 'Episodes'
from
    GameOfThrones

select
    firstname,
    lastname,
    lower(left(firstname, 2) + left(lastname, 2))
from
    #users2
    
select top 5 * from #users2;
update #users2 set UserName = lower(left(firstname, 2) + left(lastname, 2));

select * into #airports from Airports;

select * from #airports where DST is NULL or Time is NULL;

update #airports set DST = isnull(DST, '-');
update #airports set Time = isnull(Time, '-');

select * into #elements from Elements;
select * from #elements;

delete from #elements where name like '[dkmou]%' or name in ('Erbium', 'Helium', 'Nitrogen', 'Selenium');

drop table #elements;

select * into #elements from elements where [number] < 13;
select [period], symbol, [name] from #elements where [number] < 13;
SELECT
    symbol,
    [name]
from
    #elements
where left([name], len(symbol)) = symbol;
-- vilken av följande produceras av ovanstående?
-- Symbol Name 
-- F	Fluorine
-- Ne	Neon
-- Al	Aluminium
-- Si	Silicon
-- P	Phosphorus
-- S	Sulfur
-- Ar	Argon
-- Ca	Calcium

-- Symbol Name
-- F	Fluorine
-- Ne	Neon
-- Na	Sodium
-- Mg	Magnesium
-- Al	Aluminium
-- Si	Silicon
-- P	Phosphorus
-- S	Sulfur
select symbol, 
       [name] 
from #elements 
where [name] like '[hlb]%' or [name] in ('Carbon', 'Nitrogen', 'Oxygen');



-- Number Symbol Name Period Group Mass Radius
-- 1	H	Hydrogen	1	1	1.008	25
-- 2	He	Helium	1	18	4.003	31
-- 3	Li	Lithium	2	1	6.941	145
-- 4	Be	Beryllium	2	2	9.012	105
-- 5	B	Boron	2	13	10.81	85
-- 6	C	Carbon	2	14	12.011	70
-- 7	N	Nitrogen	2	15	14.007	65
-- 8	O	Oxygen	2	16	15.999	60
-- 9	F	Fluorine	2	17	18.998	50
-- 10	Ne	Neon	2	18	20.18	38

SELECT
    *
from
    #elements
where symbol in ('F', 'Ar', 'K', 'U')

SELECT * from Colors;

select Name, Red, Green, Blue into #colors from Colors;

select
    *,
    '#' + format(Red, 'X2') + format(Green, 'X2') + format(Blue, 'X2') as my_code
from
    Colors;

alter table #colors
add code as '#' + format(Red, 'X2') + format(Green, 'X2') + format(Blue, 'X2');

select * from #colors;

select * from Types;

select Integer, String into #types from Types;
SELECT
    *,
    Integer*0.01,
    DATEADD(minute, Integer, dateadd(day, Integer, '2018-12-31 09:00')),
    Integer % 2
from
    #types


select
    Period,
    Number
from
    #elements
group by
    Period;