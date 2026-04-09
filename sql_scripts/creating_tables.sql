--creating tables

--create table dim_channel on computer_std database

SELECT distinct
      [Channel]
    into  [computer_std].[dbo].[dim_channel]
      
  FROM [computer_std].[dbo].[pc_dataset]

  --create table dim_credit_score on computer_std database
  --drop table dim_credit_score
     drop table [computer_std].[dbo].[dim_credit_score]
 

  --creating table dim_customers on computer_std database

SELECT  distinct
      [Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
       into [computer_std].[dbo].[dim_customer]
  FROM [computer_std].[dbo].[pc_dataset]

--create table dim_location on computer_std database
SELECT distinct  [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      into [computer_std].[dbo].[dim_location]
      FROM [computer_std].[dbo].[pc_dataset]

--create table dim_pc on computer_std

SELECT distinct
      [PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[RAM]
      ,[Storage_Capacity]
      into [computer_std].[dbo].[dim_pc]
  FROM [computer_std].[dbo].[pc_dataset]


--create table dim_priority on computer_std database

SELECT distinct
      
      [Priority]
     into [computer_std].[dbo].[dim_priority] 
  FROM [computer_std].[dbo].[pc_dataset]

  --create table dim_shop on computer_std database
SELECT  distinct
      [Shop_Name]
      ,[Shop_Age]
      into [computer_std].[dbo].[dim_shop]
  FROM [computer_std].[dbo].[pc_dataset]

--creating table orders_fact on computer_std database
SELECT 
[Cost_Price]
      ,[Sale_Price]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
     into [computer_std].[dbo].[orders_fact]
  FROM [computer_std].[dbo].[pc_dataset]

--drop table orders_fact
drop table [computer_std].[dbo].[orders_fact]
  

  SELECT distinct
[Cost_Price]
      ,[Sale_Price]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      , [Credit_Score]
     into [computer_std].[dbo].[orders_fact]
  FROM [computer_std].[dbo].[pc_dataset]
