--  Table: Movies

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+

-- movie_id is the primary key (column with unique values) for this table. title is the name of the movie.
 

-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+

-- user_id is the primary key (column with unique values) for this table.
 

-- Table: MovieRating

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+

-- (movie_id, user_id) is the primary key (column with unique values) for this table. This table contains the rating of a movie by a user in their review. created_at is the user's review date. 
 

-- Write a solution to:

-- 1.  Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.

-- 2.  Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.





(
    SELECT U.name AS results
    FROM Users U
    JOIN MovieRating MR
    ON U.user_id = MR.user_id
    GROUP BY U.name
    ORDER BY COUNT(*) DESC,U.name
    LIMIT 1
)

UNION ALL

(
    SELECT M.title AS results
    FROM Movies M
    JOIN MovieRating MR
    ON M.movie_id = MR.movie_id
    WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
    GROUP BY M.title
    ORDER BY AVG(MR.rating) DESC,M.title
    LIMIT 1
);