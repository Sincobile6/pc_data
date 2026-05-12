

CREATE PROCEDURE sp_create_dim_shop

AS
BEGIN
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
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_shop

  select* from [computer_std].[dbo].[dim_shop]
 END;