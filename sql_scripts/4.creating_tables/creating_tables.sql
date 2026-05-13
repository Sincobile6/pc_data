--creating tables

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
  from [computer_std].[dbo].[pc_dataset_clean]

  --select all data from dim_channel
  select* from [computer_std].[dbo].[dim_channel]


  -- table dim_customers 
  drop table [computer_std].[dbo].[dim_customer]

  create table [computer_std].[dbo].[dim_customer](
  [Customer_ID] INT IDENTITY(1,1) PRIMARY KEY,
  [Customer_Name] [nvarchar](250) not null,
  [Customer_Surname] [nvarchar](250) not null,
  [Customer_Contact_Number] [nvarchar](250) not null,
  [Customer_Email_Address] [nvarchar](250) not null,
  [Load_date] DATETIME DEFAULT GETDATE()
  )

  --insert data into table

  insert into [computer_std].[dbo].[dim_customer](Customer_Name, Customer_Surname, 
                                  Customer_Contact_Number, Customer_Email_Address )
select distinct Customer_Name, Customer_Surname, 
               Customer_Contact_Number, Customer_Email_Address
from [computer_std].[dbo].[pc_dataset_clean]

--select all data from dim_customers

select* from [computer_std].[dbo].[dim_customer]

--table dim_date 


  drop table [computer_std].[dbo].[dim_date]
  create table [computer_std].[dbo].[dim_date](
  [Date_ID]INT IDENTITY(1,1) PRIMARY KEY,
  [Purchase_Date] [datetime2](7) NOT NULL,
  [Ship_Date] [nvarchar](50) NOT NULL,
  [Load_date] DATETIME DEFAULT GETDATE()
    )

  --insert data into table 
  insert into [computer_std].[dbo].[dim_date](Purchase_Date, Ship_Date)
  select distinct Purchase_Date, Ship_Date
  from [computer_std].[dbo].[pc_dataset_clean]
   
   --select all payment methods
   select* from [computer_std].[dbo].[dim_date]


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
  from [computer_std].[dbo].[pc_dataset_clean]

  --select all data in the table
  select * from [computer_std].[dbo].[dim_location]


  -- table dim_payment

  drop table [computer_std].[dbo].[dim_payment]
  create table [computer_std].[dbo].[dim_payment](
  [Payment_ID]INT IDENTITY(1,1) PRIMARY KEY,
  [Payment_Method][nvarchar](250) not null,
  [Load_date] DATETIME DEFAULT GETDATE()
  )

  --insert data into table 
  insert into [computer_std].[dbo].[dim_payment](Payment_Method)
  select distinct Payment_Method
  from [computer_std].[dbo].[pc_dataset_clean]
   
   --select all payment methods
   select* from [computer_std].[dbo].[dim_payment]


   -- table dim_pc_spec
  drop table [computer_std].[dbo].[dim_pc_spec]

  create table [computer_std].[dbo].[dim_pc_spec](
  [Pc_Spec_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [PC_Make] [nvarchar](50) NOT NULL,
  [PC_Model] [nvarchar](50) NOT NULL,
  [RAM] [nvarchar](50) NOT NULL,
  [Load_date] DATETIME DEFAULT GETDATE()
) 

  --insert data into table
  insert into [computer_std].[dbo].[dim_pc_spec](PC_Make, PC_Model, RAM   )
  select distinct PC_Make, PC_Model, RAM 
  from [computer_std].[dbo].[pc_dataset_clean]

  --select all data from dim_pc_spec
  select* from [computer_std].[dbo].[dim_pc_spec]

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
  from [computer_std].[dbo].[pc_dataset_clean]

  --select all data from dim_channel

  select* from [computer_std].[dbo].[dim_priority]


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


  --table dim_shop 

  drop table [computer_std].[dbo].[dim_shop]

  create table [computer_std].[dbo].[dim_shop](
 [Shop_ID] INT IDENTITY(1,1) PRIMARY KEY ,
 [Shop_Name] [nvarchar](50) NOT NULL,
 [Shop_Age] [nvarchar](50) NOT NULL,
 [Load_date] DATETIME DEFAULT GETDATE()
 )

  --insert data into table
  insert into [computer_std].[dbo].[dim_shop](Shop_Name, Shop_Age)
  select distinct Shop_Name, Shop_Age
  from [computer_std].[dbo].[pc_dataset_clean]

  --select all data from dim_shop

  select* from [computer_std].[dbo].[dim_shop]

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


