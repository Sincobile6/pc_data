--table dim_priority 
  drop table [computer_std].[dbo].[dim_priority]

  create table [computer_std].[dbo].[dim_priority](
  [Priority_ID] INT IDENTITY(1,1) PRIMARY KEY,
 [Priority] [nvarchar](250 ) not null,
 [Load_date] DATETIME DEFAULT GETDATE()
 )

  --insert data into table
  insert into [computer_std].[dbo].[dim_priority](Priority)
  select distinct Priority
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_channel

  select* from [computer_std].[dbo].[dim_priority]