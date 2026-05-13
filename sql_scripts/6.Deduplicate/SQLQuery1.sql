--Basic Check (Identify duplicate values and their counts):
SELECT Column1, Column2, COUNT(*)
FROM TableName
GROUP BY Column1, Column2
HAVING COUNT(*) > 1;



--Detailed Check (View all columns for each duplicate record)
SELECT *
FROM TableName
WHERE Column1 IN (
    SELECT Column1
    FROM TableName
    GROUP BY Column1
    HAVING COUNT(*) > 1
)
ORDER BY Column1;

--Delete duplicates (keeping the one with the lowest ID):
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Column1, Column2 -- Columns that define a duplicate
               ORDER BY (SELECT 0) -- Or ORDER BY ID to keep specific row
           ) AS RowNum
    FROM TableName
)
DELETE FROM CTE
WHERE RowNum > 1;

