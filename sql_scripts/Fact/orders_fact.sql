--create orders_fact 
  drop table [computer_std].[dbo].[orders_fact]

  create table [computer_std].[dbo].[orders_fact](
  [Order_ID] INT IDENTITY(1,1) PRIMARY KEY ,
  [Customer_ID] INT,
  [Location_ID] INT,
  [Date_ID]INT ,
  [Shop_ID] INT ,
  [SalesPerson_ID] INT,
  [Priority_ID] INT,
  [Pc_Spec_ID] INT,
  [Payment_ID] INT,
  [Channel_ID] INT,
  [Storage_ID] INT,
  [Cost_Price] [int] NOT NULL,
  [Sale_Price] [int] NOT NULL,
  [Discount_Amount] [int] NOT NULL,
  [Finance_Amount] [nvarchar](50) NOT NULL,
  [Cost_of_Repairs] [nvarchar](50) NOT NULL,
  [Total_Sales_per_Employee] [int] NOT NULL,
  [PC_Market_Price] [int] NOT NULL,
  [Credit_Score] [int] NOT NULL,
  constraint fk_CustomerID
             foreign key (Customer_ID)
             references [computer_std].[dbo].[dim_customer] (Customer_ID), 
 constraint fk_Location_ID
             foreign key (Location_ID)
             references [computer_std].[dbo].[dim_location] (Location_ID), 
constraint fk_Date_ID
             foreign key (Date_ID)
             references [computer_std].[dbo].[dim_date] (Date_ID) ,         
constraint fk_Shop_ID
             foreign key (Shop_ID)
             references [computer_std].[dbo].[dim_shop] (Shop_ID),          
constraint fk_SalesPerson_ID
             foreign key (SalesPerson_ID)
             references [computer_std].[dbo].[dim_salesperson] (SalesPerson_ID) ,         
constraint fk_Priority_ID
             foreign key (Priority_ID)
             references [computer_std].[dbo].[dim_priority] (Priority_ID) ,         
constraint fk_Pc_Spec_ID
             foreign key (Pc_Spec_ID)
             references [computer_std].[dbo].[dim_pc_spec] (Pc_Spec_ID) ,         
constraint fk_Payment_ID
             foreign key (Payment_ID)
             references [computer_std].[dbo].[dim_payment] (Payment_ID),          
constraint fk_Channel_ID
             foreign key (Channel_ID)
             references [computer_std].[dbo].[dim_channel] (Channel_ID),          
constraint fk_Storage_ID
             foreign key (Storage_ID)
             references [computer_std].[dbo].[dim_storage] (Storage_ID),         

 [Load_date] DATETIME DEFAULT GETDATE()
  )
  

  

  --insert data into table
  insert into [computer_std].[dbo].[orders_fact] (Customer_ID, Location_ID, Date_ID, Shop_ID, SalesPerson_ID,
                                                  Priority_ID, Pc_Spec_ID, Payment_ID, Channel_ID, Storage_ID,
                                                  Cost_Price, Sale_Price, Discount_Amount, Finance_Amount, 
                                                  Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price, Credit_Score  )
  select distinct cust.Customer_ID, loc.Location_ID, dat.Date_ID, sho.Shop_ID, sp.SalesPerson_ID,pri.Priority_ID, pcs.Pc_Spec_ID, 
                  pay.Payment_ID, cha.Channel_ID, sto.Storage_ID, stg.Cost_Price, stg.Sale_Price, stg.Discount_Amount,stg.Finance_Amount, 
                  stg.Cost_of_Repairs, stg.Total_Sales_per_Employee, stg.PC_Market_Price, stg.Credit_Score

  from [computer_std].[dbo].[pc_dataset] stg
 

 inner join [computer_std].[dbo].[dim_customer] cust
   on stg.Customer_Name =cust.Customer_Name
    and stg.Customer_Surname =cust.Customer_Surname
    and cust.[Customer_Email_Address]=cust.[Customer_Email_Address]
    and stg.Customer_Email_Address =cust.Customer_Email_Address

   inner join [computer_std].[dbo].[dim_location] loc
    on stg.Continent=loc.Continent
    and stg.Country_or_State=loc.Country_or_State
    and stg.Province_or_City= loc.Province_or_City

   inner join [computer_std].[dbo].[dim_shop] sho
   on stg.Shop_Name=sho.Shop_Name
   and stg.Shop_Age= sho.Shop_Age
      
   inner join [computer_std].[dbo].[dim_pc_spec] pcs
   on stg.PC_Make=pcs.PC_Make
   and stg.PC_Model= pcs.PC_Model
   and stg.RAM=pcs.RAM

   inner join [computer_std].[dbo].[dim_storage] sto 
   on stg.Storage_Type= sto.Storage_Type
   and stg.Storage_Capacity=sto.Storage_Capacity
      
   inner join [computer_std].[dbo].[dim_salesperson] sp
    on stg.Sales_Person_Name= sp.Sales_Person_Name
    and stg.Sales_Person_Department= sp.Sales_Person_Department
      
    inner join[computer_std].[dbo].[dim_payment] pay
    on stg.Payment_Method=pay.Payment_Method
      

   inner join [computer_std].[dbo].[dim_channel] cha
   on stg.Channel= cha.Channel
      

   inner join [computer_std].[dbo].[dim_priority] pri
    on stg.Priority= pri.Priority
      
    inner join [computer_std].[dbo].[dim_date] dat
    on stg.Purchase_Date= dat.Purchase_Date
     and stg.Ship_Date = dat.Ship_Date;
     

  --select all data from orders_fact
  select* from [computer_std].[dbo].[orders_fact]


  




