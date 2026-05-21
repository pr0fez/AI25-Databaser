create procedure myProcedure @text nvarchar(max), @count int = 5, @outdata nvarchar(max) output as
begin
	set nocount on;

	declare @result table
	(
		value nvarchar(max)
	);

	while @count > 0
	begin
		insert into @result values(@text);
		set @count -= 1;
	end

	select @outdata = string_agg(value, ', ') from @result;
	--select @text from generate_series(1, @count);

	set nocount off;
end;

-- Execute stored procedure
declare @result nvarchar(max);
exec myProcedure 'Fredrik', 3, @outdata = @result output;
print @result;

-- Dynamic SQL (always use parameterized queries to avoid SQL-injection)
declare @query nvarchar(max) = 'Select * from users where firstname = ''Ulla'';'
exec sp_executesql @query;
