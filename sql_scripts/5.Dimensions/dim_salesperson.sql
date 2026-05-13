--create table dim_SalesPerson 
  drop table [computer_std].[dbo].[dim_salesperson]

  create table [computer_std].[dbo].[dim_salesperson](
  [SalesPerson_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [Sales_Person_Name] varchar(250),
  [Sales_Person_Department] varchar (250),
  [Load_date] DATETIME DEFAULT GETDATE()
  )


  --insert data into table
  insert into [computer_std].[dbo].[dim_salesperson] (Sales_Person_Name, Sales_Person_Department )
  select distinct Sales_Person_Name, Sales_Person_Department
  from [computer_std].[dbo].[pc_dataset_clean]

  --select all data from dim_salesperson
  select* from [computer_std].[dbo].[dim_salesperson]