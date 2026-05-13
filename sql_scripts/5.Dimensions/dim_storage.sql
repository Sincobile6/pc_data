-- table dim_storage
  drop table [computer_std].[dbo].[dim_storage]

  create table [computer_std].[dbo].[dim_storage](
  [Storage_ID] INT IDENTITY(1,1) PRIMARY KEY ,
   [Storage_Type] [nvarchar](50) NOT NULL,
  [Storage_Capacity] [nvarchar](50) NOT NULL,
  [Load_date] DATETIME DEFAULT GETDATE()
) 

  --insert data into table
  insert into [computer_std].[dbo].[dim_storage]( Storage_Type,  Storage_Capacity   )
  select distinct  Storage_Type, Storage_Capacity
  from [computer_std].[dbo].[pc_dataset_clean]

  --select all data from dim_storage
  select* from [computer_std].[dbo].[dim_storage]