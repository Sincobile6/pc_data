 --table dim_channel 
  drop table [computer_std].[dbo].[dim_channel]

  create table [computer_std].[dbo].[dim_channel](
  [Channel_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [Channel] [nvarchar](250) not null,
  [Load_date] DATETIME DEFAULT GETDATE()
  )

  --insert data into table
  insert into [computer_std].[dbo].[dim_channel](Channel)
  select distinct Channel
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_channel
  select* from [computer_std].[dbo].[dim_channel]