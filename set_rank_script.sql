	use datasearch
	
	;with cte as (
	select oa.* , rrrank  = rank() over(partition by ctu.branch_code, oa.archive_year, oa.archive_week_of_year order by open_account_count desc) 
	from open_account_by_manager_per_week oa
	inner join  kdcc30data..crm_tb_user ctu on ctu.user_code = oa.manager_code
	)
	update c set rank_in_department = rrrank from cte c

