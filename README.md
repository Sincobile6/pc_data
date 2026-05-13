# PC Data Warehouse Project Review

## Project Summary

This repository contains a SQL-based PC sales data engineering project. It is currently implemented as a prototype pipeline that builds a star schema from cleaned transactional data, but it is missing automation, CSV ingestion from the raw source file, and production-grade data quality controls.

## Source Data

- Main raw data file: `csv_files/1772542271737_pc_data (2).csv`
- Row count: ~10,001 rows
- Key source fields:
  - Continent, Country or State, Province or City
  - Shop Name, Shop Age
  - PC Make, PC Model, Storage Type, RAM, Storage Capacity
  - Customer Name, Customer Surname, Customer Contact Number, Customer Email Address
  - Sales Person Name, Sales Person Department
  - Cost Price, Sale Price, Payment Method, Discount Amount
  - Purchase Date, Ship Date, Finance Amount, Credit Score, Channel, Priority
  - Cost of Repairs, Total Sales per Employee, PC Market Price

There is also a smaller sample file `csv_files/pc_dataset.csv`, but the main dataset is the larger CSV.

## Pipeline Structure

The current SQL pipeline is organized into these stages:

1. `sql_scripts/1.creating_databases/creating_databases.sql` — creates the two target databases `computer_std` and `computer_dhw`.
2. `sql_scripts/2.raw_data_import/raw_pc_data.sql` — selects from an existing raw table (`pc_dataset`) but does not currently ingest the CSV automatically.
3. `sql_scripts/3.clean_data/cleaned_pc_data.sql` — converts types and produces `pc_dataset_clean` in `computer_std`.
4. `sql_scripts/4.creating_tables/creating_tables.sql` — creates dimension tables and loads them from the cleaned staging table.
5. `sql_scripts/5.dimensions/*.sql` — individual dimension definition scripts, matching the same `dim_*` objects.
6. `sql_scripts/6.deduplicate/dim_dup_check.sql` — duplicates checks for each dimension.
7. `sql_scripts/7.fact/orders_fact.sql` — builds the fact table and inserts records from the dimension joins.
8. `sql_scripts/8.stored_procedures/*.sql` — stored procedures to rebuild dimension tables.
9. `sql_scripts/9.joins_check/SQLQuery1.sql` — join validation queries that verify row counts across join chains.

There is also `star_schema/star_schema.sql` documenting the current star schema DDL.

## Current Strengths

- Clear folder organization by ETL stage.
- Dedicated clean staging table (`pc_dataset_clean`).
- Dimension tables use `SELECT DISTINCT` to avoid duplicate dimension rows.
- Fact table is built from joined dimension keys.
- There are deduplication and join-validation scripts.
- The star schema design is present and consistent with the project intent.

## Key Issues and Missing Steps

### Missing automation
- No orchestration or workflow exists to run the pipeline end-to-end.
- There is no script or scheduler to sequence database creation, ingestion, cleaning, dimension loading, and fact loading.

### Raw ingestion gap
- The raw import step only selects from `[computer_std].[dbo].[pc_dataset]`.
- There is no ingestion script to load the CSV from `csv_files/1772542271737_pc_data (2).csv` into the raw table.

### Data quality and validation
- Cleaning currently only uses type conversions and default values.
- Missing validation for mandatory fields, date consistency, and invalid values.
- No explicit rejection or staging of bad rows.
- The join-validation script references a different schema (`pc_staging`) than the rest of the project.

### Data model issues
- Some numeric fields are stored as text in the fact table (`Finance_Amount`, `Cost_of_Repairs`).
- The fact table uses `INT` for prices while cleaned data casts decimals.
- `dim_date` stores `Ship_Date` as `nvarchar(50)` instead of a proper date.
- Stored procedures drop and recreate dimensions, which works for prototypes but is not ideal for incremental loads.
- Current implementation uses `dbo` only; a more mature design would separate `raw`, `staging`, and `warehouse` schemas.

## Recommended Dashboards and Analysis

The dataset is well suited for the following dashboards:

1. Sales by geography
   - Metrics: total sales, cost, margin, discount amount
   - Dimensions: Continent, Country or State, Province or City

2. Channel and priority analysis
   - Metrics: revenue, units sold, average discount, average credit score
   - Dimensions: Channel, Priority

3. Product performance
   - Metrics: average sale price, margin, return rate
   - Dimensions: PC Make, PC Model, RAM, Storage Type, Storage Capacity

4. Shop performance
   - Metrics: sales volume, average order value, total sales per employee
   - Dimensions: Shop Name, Shop Age

5. Salesperson performance
   - Metrics: total revenue, average discount, finance amount, customer count
   - Dimensions: Sales Person Name, Sales Person Department

6. Payment and finance risk
   - Metrics: cash vs financed sales, credit score distribution, finance amount
   - Dimensions: Payment Method, Credit Score

7. Data quality dashboard
   - Row counts by stage: raw, cleaned, dimensional, fact
   - Duplicate counts by dimension
   - Null and invalid-value counts for key fields

## Improvements Based on the Review

- Add a README like this one to document the pipeline and usage.
- Create an ingestion script for the raw CSV.
- Introduce a staging layer and separate schema naming for raw/staging/dwh.
- Standardize numeric and date data types across staging and warehouse.
- Add load metadata columns such as `Load_Date`, `Source_File`, `Row_Status`.
- Convert destructive dimension rebuilds into incremental loading or SCD logic.
- Align `SQLQuery1.sql` with the actual schema and build it into a validation step.
- Add test scripts or analytics checks for row counts, duplicates, and referential integrity.

## Recommended Execution Order

1. `sql_scripts/1.creating_databases/creating_databases.sql`
2. Load raw CSV into `computer_std.dbo.pc_dataset` (missing step)
3. `sql_scripts/3.clean_data/cleaned_pc_data.sql`
4. `sql_scripts/4.creating_tables/creating_tables.sql`
5. `sql_scripts/7.fact/orders_fact.sql`
6. `sql_scripts/6.deduplicate/dim_dup_check.sql`
7. `sql_scripts/9.joins_check/SQLQuery1.sql`

## Next Steps

- Build automation around this order with a script, SQL Agent job, or workflow manager.
- Add a dashboarding layer using Power BI, Tableau, or another BI tool.
- Implement data quality checks and alerts for the cleaning stage.
- Refine the dimensional model so the fact table uses consistent numeric types and the date dimension uses proper date fields.

---

This review follows the structure of the pipeline: documentation, ingestion, cleaning, dimension loading, deduplication, fact loading, validation, dashboarding, and automation. Feel free to ask if you want me to also create a pipeline orchestration script or a dashboard design document.