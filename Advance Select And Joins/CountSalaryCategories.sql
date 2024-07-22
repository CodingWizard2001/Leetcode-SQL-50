-- Table: Accounts

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+

-- account_id is the primary key (column with unique values) for this table. Each row contains information about the monthly income for one bank account.
 

-- Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

-- 1.  "Low Salary": All the salaries strictly less than $20000.

-- 2.  "Average Salary": All the salaries in the inclusive range [$20000, $50000].

-- 3.  "High Salary": All the salaries strictly greater than $50000.

-- The result table must contain all three categories. If there are no accounts in a category, return 0. Return the result table in any order.





SELECT
    'Low Salary' AS category,
    SUM(income < 20000) AS accounts_count  
FROM Accounts
UNION ALL
SELECT
    'Average Salary' AS category,
    SUM(income >= 20000 AND income <= 50000) AS accounts_count  
FROM Accounts
UNION ALL
SELECT
    'High Salary' AS category,
    SUM(income > 50000) AS accounts_count  
FROM Accounts;