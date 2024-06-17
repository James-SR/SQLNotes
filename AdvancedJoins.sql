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
