use datasearch

create table #temp_rank(
  manager_code VARCHAR(15) ,
  archive_year INT ,
  archive_day_of_year INT,
  open_account_count INT ,
  rank_in_department INT ,
  branch_code INT,
  correct_rank INT
)


INSERT INTO #temp_rank
select *, rank() over(PARTITION BY branch_code, archive_year, archive_day_of_year ORDER BY open_account_count DESC) as correct_rank
from dbo.open_account_by_manager_per_day

update oa
set rank_in_department = tr.correct_rank
from dbo.open_account_by_manager_per_day oa
inner join #temp_rank tr
  on tr.branch_code = oa.branch_code and tr.manager_code = oa.manager_code
and tr.archive_year = oa.archive_year and tr.archive_day_of_year = oa.archive_day_of_year


select * from  dbo.open_account_by_manager_per_day
ORDER BY branch_code, archive_year, archive_day_of_year

