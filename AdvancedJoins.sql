  SELECT hackers.name, submissions.submission_id
  FROM Hackers
  LEFT JOIN Submissions ON Hackers.hacker_id = Hackers.hacker_ID
  GROUP BY Hackers.name, submissions.submission_id
  ORDER BY name

  SELECT s.submission_date, COUNT (DISTINCT s.hacker_ID), h.name, h.hacker_ID
  FROM submissions s
  LEFT JOIN hackers h ON h.hacker_id = s.hacker_ID
  GROUP BY h.name,  h.hacker_ID, s.submission_date
  ORDER BY s.submission_date ASC

# submissions by day
SELECT s.submission_date, COUNT(h.name)
  FROM submissions s
  LEFT JOIN hackers h ON h.hacker_id = s.hacker_ID
  GROUP BY s.submission_date
  ORDER BY s.submission_date ASC

# counts submsisions by hacker and by date
    SELECT submission_date, hacker_id, COUNT(hacker_id) AS mycount
    FROM submissions 
    GROUP BY hacker_id, submission_date
    ORDER BY submission_date ASC, mycount DESC

# counts submissions by hacker and by date as a subquery

SELECT  sub.*
FROM (
    SELECT submission_date,  s.hacker_id,  h.name, COUNT(s.hacker_id) AS mycount
    FROM submissions s
    LEFT JOIN hackers h ON h.hacker_id = s.hacker_ID
    GROUP BY h.name, s.hacker_id, submission_date
            ) sub
ORDER BY submission_date ASC, mycount DESC

-- Starting simple one column at a time

SELECT
    submission_date,
    COUNT(DISTINCT hacker_ID)
FROM submissions
GROUP BY submission_date
ORDER BY submission_date

-- Next we have the number of submissions per day with the top (most) submissions by hacker    
-- Row Number will allow selecting just the top instance i.e. the hacker with the most submissions
-- on a date.  The partition says when to start counting again, in this case each day
--  creates temporary data set whose output is available to be referenced in subsequent queries

WITH max_hacker AS (
    SELECT 
        ROW_NUMBER() OVER(PARTITION BY submission_date ORDER BY COUNT(s.hacker_id) DESC, s.hacker_ID ASC) AS Row#,
        s.hacker_id, 
        submission_date,
        name
    FROM submissions s
    JOIN hackers h ON h.hacker_id = s.hacker_ID
    GROUP BY submission_date, s.hacker_id, name
)
SELECT
    s.submission_date,
    COUNT(DISTINCT s.hacker_ID),
    mh.hacker_id,
    mh.name
FROM submissions s
JOIN max_hacker mh ON mh.submission_date = s.submission_date AND Row# = 1
GROUP BY s.submission_date, mh.hacker_id, mh.name
ORDER BY s.submission_date
