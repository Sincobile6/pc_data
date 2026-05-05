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
from [computer_std].[dbo].[pc_dataset]

--select all data from dim_customers

select* from [computer_std].[dbo].[dim_customer]

