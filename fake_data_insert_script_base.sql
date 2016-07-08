use datasearch
go

declare
@total_rows BIGINT,
@index BIGINT

set @total_rows = 30
set @index = 1

while @index <= @total_rows 
begin
  insert into open_account_by_manager_per_day 
  select '460000000098', 2016,  datepart(dy, '2016-06-' + (cast(@index as varchar))),  dbo.randbetween(10,30), 0
  insert into open_account_by_manager_per_day 
  select '050000000098', 2016, datepart(dy, '2016-06-' + (cast(@index as varchar))),  dbo.randbetween(10,30), 0
  insert into open_account_by_manager_per_day 
  select '731000000039', 2016, datepart(dy, '2016-06-' + (cast(@index as varchar))),  dbo.randbetween(10,30), 0
  set @index = @index +1 
  end

  go