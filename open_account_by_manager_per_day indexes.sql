alter table open_account_by_manager_per_day
add constraint cons_unique_code_year_day UNIQUE NONCLUSTERED (manager_code, archive_year, archive_day_of_year)
with (PAD_INDEX = ON, IGNORE_DUP_KEY = OFF , FILLFACTOR = 80)


create NONCLUSTERED index idx_archive_year_day   
ON dbo.open_account_by_manager_per_day (archive_year, archive_day_of_year)
with (PAD_INDEX = ON, ONLINE = ON, FILLFACTOR = 80)

