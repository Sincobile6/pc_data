--Basic Check (Identify duplicate values and their counts)

--Dim_Shop
SELECT Shop_Name, Shop_Age, COUNT(*)
FROM [computer_std].[dbo].[dim_shop]
GROUP BY Shop_Name, Shop_Age
HAVING COUNT(*) > 1;

--Dim_storage
SELECT Storage_Type, Storage_Capacity, COUNT(*)
FROM [computer_std].[dbo].[dim_storage]
GROUP BY Storage_Type, Storage_Capacity
HAVING COUNT(*) > 1;

--Dim_Location
SELECT Continent,Country_or_State,Province_or_City, COUNT(*)
FROM [computer_std].[dbo].[dim_location]
GROUP BY Continent,Country_or_State,Province_or_City
HAVING COUNT(*) > 1;

--Dim_Channel
SELECT Channel, COUNT(*)
FROM [computer_std].[dbo].[dim_channel]
GROUP BY Channel
HAVING COUNT(*) > 1;

--Dim_Customer
SELECT Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address,
COUNT(*)
FROM [computer_std].[dbo].[dim_customer]
GROUP BY Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address
HAVING COUNT(*) > 1;


--Dim_Date
SELECT Purchase_Date, Ship_Date, COUNT(*)
FROM [computer_std].[dbo].[dim_date]
GROUP BY Purchase_Date, Ship_Date
HAVING COUNT(*) > 1;


--Dim_Pc_Spec
SELECT PC_Make, PC_Model, RAM , COUNT(*)
FROM [computer_std].[dbo].[dim_pc_spec]
GROUP BY PC_Make, PC_Model, RAM 
HAVING COUNT(*) > 1;


--Dim_Priority
SELECT Priority, COUNT(*)
FROM [computer_std].[dbo].[dim_priority]
GROUP BY Priority
HAVING COUNT(*) > 1;


--Dim_Salesperson
SELECT Sales_Person_Name, Sales_Person_Department, COUNT(*)
FROM [computer_std].[dbo].[dim_salesperson]
GROUP BY Sales_Person_Name, Sales_Person_Department
HAVING COUNT(*) > 1;


--Dim_Payment
SELECT Payment_Method, COUNT(*)
FROM [computer_std].[dbo].[dim_payment]
GROUP BY Payment_Method
HAVING COUNT(*) > 1;

