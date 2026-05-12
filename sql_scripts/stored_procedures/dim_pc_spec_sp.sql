

CREATE PROCEDURE [dbo].[sp_create_dim_pc_spec]

AS
BEGIN
drop table [computer_std].[dbo].[dim_pc_spec]

  create table [computer_std].[dbo].[dim_pc_spec](
  [Pc_Spec_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [PC_Make] [nvarchar](50) NOT NULL,
  [PC_Model] [nvarchar](50) NOT NULL,
  [Storage_Type] [nvarchar](50) NOT NULL,
  [RAM] [nvarchar](50) NOT NULL,
  [Storage_Capacity] [nvarchar](50) NOT NULL,
  [Load_date] DATETIME DEFAULT GETDATE()
) 

  --insert data into table
  insert into [computer_std].[dbo].[dim_pc_spec](PC_Make, PC_Model, Storage_Type, RAM, Storage_Capacity   )
  select distinct PC_Make, PC_Model, Storage_Type, RAM, Storage_Capacity
  from [computer_std].[dbo].[pc_dataset]

  --select all data from dim_pc_spec
  select* from [computer_std].[dbo].[dim_pc_spec]
 END;
GO


