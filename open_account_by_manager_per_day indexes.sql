use datasearch

CREATE TABLE dbo.open_account_by_manager_per_month_with_chanel (
  id BIGINT IDENTITY(1, 1) PRIMARY KEY,
  manager_code VARCHAR(15) NOT NULL DEFAULT '',
  archive_year INT NOT NULL DEFAULT 0,
  archive_month_of_year INT NOT NULL DEFAULT 0,
	source_type INT NOT NULL DEFAULT 0,
	channel_type INT NOT NULL DEFAULT 0,
  open_account_count INT NOT NULL DEFAULT 0,
  rank_in_department INT NOT NULL DEFAULT 0,
	percentage DECIMAL(5, 2) NULL,
  create_time DATETIME NOT NULL DEFAULT GETDATE(),
  update_time DATETIME NOT NULL DEFAULT GETDATE()
)

alter table dbo.open_account_by_manager_per_month_with_chanel
add constraint cons_unique_code_year_month_source_channel UNIQUE NONCLUSTERED (manager_code, archive_year, archive_month_of_year, source_type, channel_type)
with (PAD_INDEX = ON, IGNORE_DUP_KEY = OFF , FILLFACTOR = 80)


create NONCLUSTERED index idx_archive_year_day_source
ON dbo.open_account_by_manager_per_month_with_chanel (archive_year, archive_month_of_year, source_type)
with (PAD_INDEX = ON, ONLINE = ON, FILLFACTOR = 80)
go

create trigger oabmpmwc_trg_updated_time on dbo.open_account_by_manager_per_month_with_chanel
for update
as
begin

    -- nothing to do?
    if (@@rowcount = 0)
      return;

    update d
    set
       update_time = getdate()
    from
       dbo.open_account_by_manager_per_month_with_chanel d join inserted i
    on d.id = i.id;

end
go

