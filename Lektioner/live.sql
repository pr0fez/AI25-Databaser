select len(firstname) as 'Length', firstname from users;

select len(firstname), DATALENGTH(firstname), firstname from users;

SELECT IDENTITY(int, 1, 1) as Ident, * into users2 from users;
select * from users2;

select getdate();
select getUTCdate();

select dateadd(year, 3, dateadd(hour, 2, getdate()));

select dateadd(year, -2, '1981-02-04 15:10:00.13')

select datediff(year, '1981-02-04', getdate())

select DATEFROMPARTS(1992,2,4);

select isdate('2025-02-28 15:53:00');

set datefirst 1;

select datepart (WEEKDAY, getdate())

select abs(-5), sin(1), cos(1 + 2*pi()), tan(1), DEGREES(pi()), RADIANS(180.0);

select choose(3, 'röd', 'grön', 'blå');

select iif(1=2, 'sant', 'falskt');

select
    count(*) as 'Antal rader',
    count(Meltingpoint) as 'Antal värden i Meltingpoint',
    count(Boilingpoint) as 'Antal värden i Boilingpoint',
    count(*) - count(Meltingpoint) as 'Antal nullvärden i Meltingpoint',
    count(*) - count(Boilingpoint) as 'Antal nullvärden i Boilingpoint'
from
    Elements
where
    Number <= 20;

-- select count(*) from Elements where Meltingpoint is null and Number <= 20;
select * from Elements;

select 
    [Group],
    sum(Mass) as 'Total massa',
    min(Meltingpoint) as 'Minsta smältpunkt',
    max(Meltingpoint) as 'Högsta smältpunkt',
    avg(Meltingpoint) as 'Genomsnittlig smältpunkt',
    count(Meltingpoint) as 'Anta värden',
    sum(Meltingpoint) / count(Meltingpoint),
    string_agg(Symbol, ', ') as 'Symbols'
from
    Elements
group by
    [Group];

-- radkommentar
/*
Block kommentar
*/

select * from company.orders where OrderDate < '2013-01-01' order by ShipCountry;

-- Uppgift 1
-- Skriv en query som ger en kolumn med alla olika länder, samt en kolumn med antalet ordrar till vardera land, sortera på antalet ordrar
select
    ShipCountry,
    count(*) as 'Amount of orders'
from
    company.orders
group by
    ShipCountry
order by
    'Amount of orders';

-- Skriv en query som listar de olika regionerna, samt två kolumner som visar första respektive senaste order som lagts i varje region
select
    ShipRegion,
    min(OrderDate) as 'First order',
    max(OrderDate) as 'Last order'
from
    company.orders
group by
    ShipRegion;

select
    ShipRegion,
    ShipCountry,
    ShipCity,
    count(*) as 'Number of orders'
from
    company.orders
group by
    ShipRegion,
    ShipCountry,
    ShipCity

select 
    ShipCountry,
    count(*) as 'Number of orders'
from
    company.orders
group by
    ShipCountry
having
    count(*) between 10 and 20
order by
    'Number of orders' desc;

exec sp_spaceused;