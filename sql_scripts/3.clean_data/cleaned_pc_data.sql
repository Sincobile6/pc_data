drop TABLE [computer_std].[dbo].[pc_dataset_clean];


SELECT

    Continent,
    Country_or_State,
    Province_or_City,
    Shop_Name,

    TRY_CAST(Shop_Age AS INT) AS Shop_Age,

    PC_Make,
    PC_Model,
    Storage_Type,

    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number,
    Customer_Email_Address,

    Sales_Person_Name,
    Sales_Person_Department,

    TRY_CAST(Cost_Price AS DECIMAL(10,2)) AS Cost_Price,
    TRY_CAST(Sale_Price AS DECIMAL(10,2)) AS Sale_Price,

    Payment_Method,

    TRY_CAST(Discount_Amount AS DECIMAL(10,2)) AS Discount_Amount,

    TRY_CONVERT(DATE, Purchase_Date,103) AS Purchase_Date,
    coalesce(try_cast(ship_date as date), '9999-12-31') as Ship_date
    ,
    

    TRY_CAST(Finance_Amount AS DECIMAL(10,2)) AS Finance_Amount,

    RAM,

    TRY_CAST(Credit_Score AS INT) AS Credit_Score,

    Channel,
    Priority,

    TRY_CAST(Cost_of_Repairs AS DECIMAL(10,2)) AS Cost_of_Repairs,

    TRY_CAST(Total_Sales_per_Employee AS DECIMAL(10,2)) AS Total_Sales_per_Employee,

    TRY_CAST(PC_Market_Price AS DECIMAL(10,2)) AS PC_Market_Price,

    Storage_Capacity

INTO [computer_std].[dbo].[pc_dataset_clean]

FROM [computer_std].[dbo].[pc_dataset];
GO