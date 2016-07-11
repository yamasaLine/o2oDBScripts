use datasearch
go

declare
@total_rows BIGINT,
@index BIGINT

set @total_rows = 30
set @index = 1

while @index <= @total_rows 
begin
  insert into open_account_by_manager_per_week
  select '460000000098', 2016, @index  ,  dbo.randbetween(77,120), 0

  insert into open_account_by_manager_per_week
  select '050000000098', 2016, @index,  dbo.randbetween(77,120, 0

  insert into open_account_by_manager_per_week
  select '731000000039', 2016, @index,  dbo.randbetween(77,120), 0

  insert into open_account_by_manager_per_week
  select '731000000036', 2016, @index,  dbo.randbetween(77,120), 0

  insert into open_account_by_manager_per_week
  select '731000000033', 2016, @index,  dbo.randbetween(77,120), 0
  set @index = @index +1 
  end

  go
