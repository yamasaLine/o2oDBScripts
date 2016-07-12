use datasearch

CREATE TABLE dbo.open_account_by_manager_per_month_with_chanel (
  manager_code VARCHAR(15) NOT NULL DEFAULT '',
  archive_year INT NOT NULL DEFAULT 0,
  archive_month_of_year INT NOT NULL DEFAULT 0,
	source_type INT NOT NULL DEFAULT 0,
	channel_type INT NOT NULL DEFAULT 0,
  open_account_count INT NOT NULL DEFAULT 0,
  rank_in_department INT NOT NULL DEFAULT 0,
	percentage DECIMAL(5, 2) NULL
)

alter table dbo.open_account_by_manager_per_month_with_chanel
add constraint cons_unique_code_year_month_source_channel UNIQUE NONCLUSTERED (manager_code, archive_year, archive_month_of_year, source_type, channel_type)
with (PAD_INDEX = ON, IGNORE_DUP_KEY = OFF , FILLFACTOR = 80)


create NONCLUSTERED index idx_archive_year_day_source
ON dbo.open_account_by_manager_per_month_with_chanel (archive_year, archive_month_of_year, source_type)
with (PAD_INDEX = ON, ONLINE = ON, FILLFACTOR = 80)

