--table dim_location

  drop table [computer_std].[dbo].[dim_location]

  create table [computer_std].[dbo].[dim_location](
  [Location_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [Continent] [nvarchar](250) not null,
  [Country_or_State] [nvarchar](250) not null,
  [Province_or_City] [nvarchar](250) not null,
  [Load_date] DATETIME DEFAULT GETDATE()
  )
  

  --insert data into table
  insert into [computer_std].[dbo].[dim_location](Continent,Country_or_State,Province_or_City)
  select distinct Continent,Country_or_State,Province_or_City
  from [computer_std].[dbo].[pc_dataset]

  --select all data in the table
  select * from [computer_std].[dbo].[dim_location]
