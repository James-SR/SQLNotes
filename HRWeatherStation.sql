# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

Use a Regex statement:
  SELECT DISTINCT CITY
  FROM STATION
  WHERE CITY LIKE '[aeiou]%[aeiou]'

# Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates

  SELECT DISTINCT CITY
  FROM STATION
  WHERE CITY NOT LIKE '[aeiou]%' # or if ending in a vowel WHERE CITY NOT LIKE '%[aeiou]'

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
# Note to handle upper and lower case letters, you may need to use these in the pattern

  SELECT DISTINCT CITY
  FROM STATION
  WHERE CITY NOT LIKE '[aeiouAEIOU]%' AND CITY NOT LIKE '%[aeiouAEIOU]'
 
# Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

  SELECT Name
  FROM STUDENTS
  WHERE Marks >75
  ORDER BY RIGHT(Name, 3), ID

