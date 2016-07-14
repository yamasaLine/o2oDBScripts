use datasearch

-- add new "RowId" column, make it IDENTITY (= auto-incrementing)
ALTER TABLE dbo.open_account_by_branch_per_month
ADD id INT IDENTITY(1,1)
GO

-- add new primary key constraint on new column
ALTER TABLE dbo.open_account_by_branch_per_month
ADD CONSTRAINT PK_open_account_by_branch_per_month
PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE dbo.open_account_by_branch_per_month
    add create_time DATETIME NOT NULL DEFAULT getdate()
go

ALTER TABLE dbo.open_account_by_branch_per_month
    add update_time DATETIME NOT NULL DEFAULT getdate()
go

create trigger oabbpm_trg_updated_time on dbo.open_account_by_branch_per_month
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
       dbo.open_account_by_branch_per_month d join inserted i
    on d.id = i.id;

end
go



