--creating tables
--add primary key

  --drop table and create new table dim_channel 
  drop table [computer_std].[dbo].[dim_channel]

  create table [computer_std].[dbo].[dim_channel](
  [Channel_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [Channel] [nvarchar](250) not null
  )

  --insert data into table
  insert into [computer_std].[dbo].[dim_channel](Channel)
  select distinct Channel
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_channel
  select* from [computer_std].[dbo].[dim_channel]
 
 
  --drop old table and create new table dim_customers 
  drop table [computer_std].[dbo].[dim_customer]

  create table [computer_std].[dbo].[dim_customer](
  [CustomerID] INT IDENTITY(1,1) PRIMARY KEY,
  [Customer_Name] [nvarchar](250) not null,
  [Customer_Surname] [nvarchar](250) not null,
  [Customer_Contact_Number] [nvarchar](250) not null,
  [Customer_Email_Address] [nvarchar](250) not null
  )

  --insert data into table

  insert into [computer_std].[dbo].[dim_customer](Customer_Name, Customer_Surname, 
                                  Customer_Contact_Number, Customer_Email_Address )
select distinct Customer_Name, Customer_Surname, 
               Customer_Contact_Number, Customer_Email_Address
from [computer_std].[dbo].[pc_dataset]

--select all data from dim_customers

select* from [computer_std].[dbo].[dim_customer]


--drop old table and create new table dim_location 
  drop table [computer_std].[dbo].[dim_location]

  create table [computer_std].[dbo].[dim_location](
  [Location_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [Continent] [nvarchar](250) not null,
  [Country_or_State] [nvarchar](250) not null,
  [Province_or_City] [nvarchar](250) not null
  )

  --insert data into table
  insert into [computer_std].[dbo].[dim_location](Continent,Country_or_State,Province_or_City)
  select distinct Continent,Country_or_State,Province_or_City
  from [computer_std].[dbo].[pc_dataset]

  --select all data in the table
  select * from [computer_std].[dbo].[dim_location]

--create table dim_pc_spec on computer_std

  --drop old table dim_pc and create new table dim_pc_spec
  drop table [computer_std].[dbo].[dim_pc_spec]

  create table [computer_std].[dbo].[dim_pc_spec](
  [Pc_Spec_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [PC_Make] [nvarchar](50) NOT NULL,
  [PC_Model] [nvarchar](50) NOT NULL,
  [Storage_Type] [nvarchar](50) NOT NULL,
  [RAM] [nvarchar](50) NOT NULL,
  [Storage_Capacity] [nvarchar](50) NOT NULL
) 

  --insert data into table
  insert into [computer_std].[dbo].[dim_pc_spec](PC_Make, PC_Model, Storage_Type, RAM, Storage_Capacity   )
  select distinct PC_Make, PC_Model, Storage_Type, RAM, Storage_Capacity
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_pc_spec
  select* from [computer_std].[dbo].[dim_pc_spec]

--create table dim_priority on computer_std database

  --drop this data and create dim_priority again
  drop table [computer_std].[dbo].[dim_priority]

  create table [computer_std].[dbo].[dim_priority](
  [Priority_ID] INT IDENTITY(1,1) PRIMARY KEY,
 [Priority] [nvarchar](250 ) not null
 )

  --insert data into table
  insert into [computer_std].[dbo].[dim_priority](Priority)
  select distinct Priority
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_channel

  select* from [computer_std].[dbo].[dim_priority]

  --create table dim_shop on computer_std database

  --drop this data and create new table dim_shop 

  drop table [computer_std].[dbo].[dim_shop]

  create table [computer_std].[dbo].[dim_shop](
 [Shop_ID] INT IDENTITY(1,1) PRIMARY KEY ,
 [Shop_Name] [nvarchar](50) NOT NULL,
 [Shop_Age] [nvarchar](50) NOT NULL )

  --insert data into table
  insert into [computer_std].[dbo].[dim_shop](Shop_Name, Shop_Age)
  select distinct Shop_Name, Shop_Age
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_shop

  select* from [computer_std].[dbo].[dim_shop]

  --create table dim_payment

  drop table [computer_std].[dbo].[dim_payment]
  create table [computer_std].[dbo].[dim_payment](
  [Payment_ID]INT IDENTITY(1,1) PRIMARY KEY,
  [Payment_Method][nvarchar](250) not null
  )

  --insert data into table 
  insert into [computer_std].[dbo].[dim_payment](Payment_Method)
  select distinct Payment_Method
  from [computer_std].[dbo].[pc_dataset]
   
   --select all payment methods
   select* from [computer_std].[dbo].[dim_payment]

   --create table dim_date 


  drop table [computer_std].[dbo].[dim_date]
  create table [computer_std].[dbo].[dim_date](
  [Date_ID]INT IDENTITY(1,1) PRIMARY KEY,
  [Purchase_Date] [datetime2](7) NOT NULL,
  [Ship_Date] [nvarchar](50) NOT NULL,

    )

  --insert data into table 
  insert into [computer_std].[dbo].[dim_date](Purchase_Date, Ship_Date)
  select distinct Purchase_Date, Ship_Date
  from [computer_std].[dbo].[pc_dataset]
   
   --select all payment methods
   select* from [computer_std].[dbo].[dim_date]

--creating table orders_fact on computer_std database  

  --drop old data and create orders_fact again
  drop table [computer_std].[dbo].[orders_fact]

  create table [computer_std].[dbo].[orders_fact](
  [Order_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [Cost_Price] [int] NOT NULL,
  [Sale_Price] [int] NOT NULL,
  [Discount_Amount] [int] NOT NULL,
  [Finance_Amount] [nvarchar](50) NOT NULL,
  [Cost_of_Repairs] [nvarchar](50) NOT NULL,
  [Total_Sales_per_Employee] [int] NOT NULL,
  [PC_Market_Price] [int] NOT NULL,
  [Credit_Score] [int] NOT NULL)

  --insert data into table
  insert into [computer_std].[dbo].[orders_fact] (Cost_Price, Sale_Price, Discount_Amount, 
               Finance_Amount, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price, Credit_Score  )
  select distinct Cost_Price, Sale_Price, Discount_Amount, 
               Finance_Amount, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price, Credit_Score
  from [computer_std].[dbo].[pc_dataset]

  --select all data from orders_fact
  select* from [computer_std].[dbo].[orders_fact]