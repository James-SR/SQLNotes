  SELECT hackers.name, submissions.submission_id
  FROM Hackers
  LEFT JOIN Submissions ON Hackers.hacker_id = Hackers.hacker_ID
  GROUP BY Hackers.name, submissions.submission_id
  ORDER BY name
