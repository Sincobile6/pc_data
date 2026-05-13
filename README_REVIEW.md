# PC Data Engineering Review

## Overview

This document summarizes the findings from reviewing the PC data engineering project. It highlights the current implementation, identifies gaps, and suggests dashboards and next steps.

## Key Findings

- The project is implemented as a SQL-only ETL pipeline.
- The raw source data exists in `csv_files/1772542271737_pc_data (2).csv` with ~10,001 rows.
- The current pipeline has the following logical stages:
  1. Database creation
  2. Raw data selection from an existing `pc_dataset` table
  3. Data cleaning into `pc_dataset_clean`
  4. Dimensional table creation and loading
  5. Fact table creation and insertion
  6. Deduplication and join validation checks
- Documentation was missing initially; a README was added with project review and improvement guidance.

## What Works Well

- Good folder structure for SQL files, separated by ETL stage.
- Dimension tables are built using `SELECT DISTINCT` to reduce duplicates.
- Fact table is constructed from joined dimension keys.
- There are dedicated validation scripts for duplicates and join consistency.
- The project has a star schema file to document the warehouse design.

## Issues and Missing Improvements

- No automation or orchestration layer exists:
  - There is no script to run the pipeline end-to-end.
  - No scheduling or workflow management is present.
- Raw ingestion is incomplete:
  - The CSV is not automatically loaded into the raw table.
  - The raw import step only selects from an existing database table.
- Data quality is not fully managed:
  - No explicit null checks or invalid-value handling.
  - Bad rows are not captured separately.
  - There is inconsistent use of data types (e.g. string columns for numeric values).
- Dimension loading is destructive:
  - Stored procedures drop and recreate dimensions.
  - This approach is not suitable for incremental or production loads.
- Schema consistency could be improved:
  - The project uses a single schema (`dbo`) rather than separate `raw`, `staging`, and `warehouse` areas.

## Dashboard Ideas Based on Findings

### 1. Sales Geography Dashboard
- Metrics:
  - Total sales
  - Total cost
  - Average discount
  - Number of orders
- Dimensions:
  - Continent
  - Country or State
  - Province or City

### 2. Channel and Priority Performance Dashboard
- Metrics:
  - Revenue by channel
  - Order count by priority
  - Average credit score
  - Finance amount by channel
- Dimensions:
  - Channel
  - Priority

### 3. Product and PC Specification Dashboard
- Metrics:
  - Revenue by PC make/model
  - Average sale price
  - Total sales per RAM/storage configuration
- Dimensions:
  - PC Make
  - PC Model
  - RAM
  - Storage Type
  - Storage Capacity

### 4. Shop and Salesperson Performance Dashboard
- Metrics:
  - Sales volume by shop
  - Average order value by shop
  - Salesperson revenue and conversion performance
- Dimensions:
  - Shop Name
  - Shop Age
  - Sales Person Name
  - Sales Person Department

### 5. Payment and Risk Dashboard
- Metrics:
  - Financing share vs cash sales
  - Average credit score by payment type
  - Finance amount and margins
- Dimensions:
  - Payment Method
  - Credit Score categories

### 6. Data Quality Dashboard
- Metrics:
  - Row count at each ETL stage
  - Duplicate counts per dimension
  - Null/missing values for key columns
  - Valid/invalid date ratios
- Dimensions:
  - ETL stage
  - Table name
  - Error type

## Tech Stack

- SQL Server / T-SQL
- Raw data stored as CSV files in `csv_files/`
- SQL scripts stored in `sql_scripts/`
- Star schema documented in `star_schema/star_schema.sql`

## Recommended Next Steps

1. Add an ingestion step that loads the CSV into the raw table.
2. Introduce automation to run the SQL pipeline end-to-end.
3. Add schema separation for raw, staging, and warehouse.
4. Refine data types and convert string-based numbers to numeric columns.
5. Implement data quality checks and bad-row handling.
6. Create dashboard-ready views or materialized tables for analytics.

## Suggested File for Reference

- `README.md` — contains the full project review, pipeline step guide, dashboard recommendations, and next steps.
- `README_REVIEW.md` — this targeted summary highlighting findings and dashboards.

---

This review is intentionally concise and focused on the highest-impact improvements for the current SQL-based project.