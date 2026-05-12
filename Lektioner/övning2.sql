select * from Elements;
    
select
    Period,
    min(Number) as 'from',
    max(Number) as 'to',
    format(avg(convert(float, Stableisotopes)), 'N2') as 'average isotopes',
    string_agg(Symbol, ',') as 'Elements'
from
    Elements
group by
    Period;

select * from company.customers;

select
    Region, 
    Country, 
    City,
    count(*) as 'Number of Customers'
from
    company.customers
group by
    Region,
    Country,
    City
having
    count(*) > 1
order by
    count(*);

SELECT * from GameOfThrones;
/*
”Säsong 1 sändes från april till juni 2011. Totalt 
sändes 10 avsnitt, som i genomsnitt sågs av 2.5 
miljoner människor i USA.”, följt av radbyte/char(13), följt av 
”Säsong 2 sändes …” osv. 
*/

declare @output nvarchar(max) = '';

with SeasonSummary as (
    select
        Season,
        min([Original air date]) as StartDate,
        max([Original air date]) as EndDate,
        count(*) as EpisodeCount,
        avg([U.S. viewers(millions)]) as AvgViewers
    from GameOfThrones
    group by
        Season
)
select @output = @output + 
    'Säsong ' + cast(Season as VARCHAR) +  ' sändes från ' + 
    format(StartDate, 'MMMM', 'sv') + ' till ' + 
    format(EndDate, 'Y', 'sv') + '. ' +
    'Totalt sändes ' + cast(EpisodeCount as VARCHAR) + ' avnsitt, som i genomsnitt sågs av ' +
    cast(cast(cast(AvgViewers as FLOAT) as decimal(10, 2)) as VARCHAR) + ' miljoner människor i USA.' + CHAR(13) + CHAR(10)
from SeasonSummary
order by Season;

print @output;

select * from INFORMATION_SCHEMA.COLUMNS c where c.TABLE_NAME = 'GameOfThrones';
select * from Users;
select
    concat(FirstName, ' ', LastName) as 'Namn',
    datediff(day, convert(date, left(ID, 6)), getdate()) / 365.25 as 'Ålder',
    case 
        when substring(right(ID, 2), 1, 1) % 2 = 0 then 'Kvinna'
        else 'Man'
    end as 'Kön'
from Users
order by
    FirstName,
    LastName;

/*
Ta ut en lista över regioner i tabellen ”Countries” där det för varje region 
framgår regionens namn, antal länder i regionen, totalt antal invånare, 
total area, befolkningstätheten med 2 decimaler, samt 
spädbarnsdödligheten per 100.000 födslar avrundat till heltal. 

*/
select * from Countries;

select
    Region,
    count(Country) as 'Number of countries',
    sum(convert(bigint, [Population])) as 'Total population',
    sum([Area (sq# mi#)]) as 'Total Area',
    sum(convert(bigint, [Population]))/sum(convert(bigint, [Area (sq# mi#)])) as 'Population density'
from Countries
group by 
    Region


/*
 Från tabellen ”Airports”, gruppera per land och ta ut kolumner som visar: 
land, antal flygplatser (IATA-koder), antal som saknar ICAO-kod, samt hur 
många procent av flygplatserna i varje land som saknar ICAO-kod.
*/
select * from Airports;

select
    left([Location Served], charindex(',', reverse([Location Served])))
from
    Airports