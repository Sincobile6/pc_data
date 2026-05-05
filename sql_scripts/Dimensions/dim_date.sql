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
  from [computer_std].[dbo].[pc_dataset]
   
   --select all payment methods
   select* from [computer_std].[dbo].[dim_date]