select * from company.products;
select * from company.orders;
select count(*) from company.products;

select
    count(distinct(od.ProductId)) / cast((select count(*) from company.products) as float) as ratio
from
    company.order_details od
    inner join company.orders o on od.OrderId = o.Id
where
    o.ShipCity = 'London';

select top 1
    ShipCity,
    count(distinct(ProductId)) as 'Number shipped'
from
    company.orders
    join company.order_details on company.orders.Id = company.order_details.OrderId
group by 
    ShipCity
order by
    'Number shipped' desc;
select * from company.products;
select
    sum(od.UnitPrice *od.Quantity) - sum(od.UnitPrice *od.Quantity * od.Discount)
from company.order_details od
    join company.products p on od.ProductId = p.Id
    join company.orders o on od.OrderId = o.Id
where ShipCountry='Germany' and p.Discontinued = 1

select top 1
    c.CategoryName
from
    company.products p
    join company.categories c on p.categoryId = c.Id
group by
    c.CategoryName
order by sum(p.UnitsInStock * p.UnitPrice) desc;

select
    sup.CompanyName,
    sum(company.order_details.Quantity) as 'Sales'
from company.orders
    join company.order_details on company.order_details.OrderId = company.orders.Id
    join company.products on company.order_details.ProductId = company.products.id
    join company.suppliers sup on company.products.SupplierId = sup.Id
where company.orders.OrderDate >= '2013-06-01' and company.orders.OrderDate <= '2013-09-01'
group by
    sup.CompanyName
order by
    'Sales' desc;

select * from music.playlists;
declare @playlist nvarchar(max) = 'Heavy Metal Classic';

select 
    g.Name as 'Genre',
    ar.Name as 'Artist',
    ab.Title as 'Album',
    mt.Name as 'Track',
    format(dateadd(MILLISECOND, mt.Milliseconds, 0), 'mm:ss') as 'Duration',
    format(Bytes / power(1024, 2), 'N1') + 'MB'as 'Size',
    isnull(Composer, 'N/A') as 'Composer'
from
    music.tracks mt
    join music.genres g on mt.GenreId = g.GenreId
    join music.albums ab on ab.AlbumId = mt.AlbumId
    join music.artists ar on ab.ArtistId = ar.ArtistId
    join music.playlist_track pt on pt.TrackId = mt.TrackId
    join music.playlists p on p.PlaylistId = pt.PlaylistId
where
    p.Name = @playlist
order by
    g.Name, ar.Name, ab.Title;