

CREATE PROCEDURE [dbo].[sp_create_dim_payment]

AS
BEGIN
drop table [computer_std].[dbo].[dim_payment]
  create table [computer_std].[dbo].[dim_payment](
  [Payment_ID]INT IDENTITY(1,1) PRIMARY KEY,
  [Payment_Method][nvarchar](250) not null,
  [Load_date] DATETIME DEFAULT GETDATE()
  )

  --insert data into table 
  insert into [computer_std].[dbo].[dim_payment](Payment_Method)
  select distinct Payment_Method
  from [computer_std].[dbo].[pc_dataset]
   
   --select all payment methods
   select* from [computer_std].[dbo].[dim_payment]
 END;
GO


