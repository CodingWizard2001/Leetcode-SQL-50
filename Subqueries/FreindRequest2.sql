-- Table: RequestAccepted

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+

-- (requester_id, accepter_id) is the primary key. (combination of columns with unique values) for this table. This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

-- Write a solution to find the people who have the most friends and the most friends number. The test cases are generated so that only one person has the most friends.





WITH
    FUNC AS(
        SELECT requester_id AS id 
        FROM RequestAccepted 
        UNION ALL
        SELECT accepter_id 
        FROM RequestAccepted 
    )
SELECT id,COUNT(*) AS num 
FROM FUNC
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;