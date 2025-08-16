use musicapp;

Drop TABLE if EXISTS user;
-- Create the User table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    pincode VARCHAR(10)
);

-- Insert data into the User table
INSERT INTO User (user_id, user_name, age, gender, pincode) VALUES
(1, 'Ajay Maheshwari', 20, 'Male', '323001'),
(2, 'Kayleigh Hardin', 37, 'Female', '978957'),
(3, 'Mahek Jain', 19, 'Female', '225001'),
(4, 'Libby Benton', 24, 'Male', '359995'),
(5, 'Camren Escobar', 31, 'Female', '449539'),
(6, 'Emelia Fritz', 20, 'Male', '857767'),
(7, 'Brogan Beasley', 18, 'Male', '434695'),
(8, 'Mikayla Dodson', 25, 'Female', '576394'),
(9, 'Taniya Rojas', 26, 'Male', '343793'),
(10, 'Taniya Rojas', 18, 'Male', '358779'),
(11, 'Erika Harris', 30, 'Male', '583436'),
(12, 'Jermaine Jarvis', 29, 'Female', '393838'),
(13, 'Salvatore Sweeney', 25, 'Female', '443356'),
(14, 'Mara Costa', 27, 'Female', '989343'),
(15, 'Dominique Cohen', 17, 'Female', '989633'),
(16, 'Madilynn Mccoy', 22, 'Male', '676667'),
(17, 'Skylar Pham', 28, 'Male', '758998'),
(18, 'Tamara Li', 31, 'Female', '683769'),
(19, 'Alex Pineda', 31, 'Female', '768955'),
(20, 'Vivian Phelps', 34, 'Male', '769565');


Drop TABLE if EXISTS SONG;
-- Create the SONG table
CREATE TABLE SONG (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(50),
    singer_id INT,
    release_date INT
);

-- Insert data into the SONG table
INSERT INTO SONG (song_id, song_name, singer_id, release_date) VALUES
(1, 'On My Way', 3, 2019),
(2, 'Forget About Your Peace', 6, 2019),
(3, 'Pure Lines', 8, 2008),
(4, 'Afraid Of Soul', 10, 2000),
(5, 'Social Wave', 14, 2004),
(6, 'Metal Commission', 19, 2019),
(7, 'Feel Good Garden', 11, 2011),
(8, 'Bun Up The Winter', 13, 2013),
(9, 'Infinite', 5, 2015),
(10, 'Exultant Slow Down', 19, 2019),
(11, 'Powerful Hero', 4, 2004),
(12, 'New School Of Commission', 10, 2000),
(13, 'Breath Of Broken Dreams', 1, 2011),
(14, 'Different Light', 6, 2006),
(15, 'Quiet Cocktail', 13, 2013),
(16, 'Interstellar Fusion', 3, 2013),
(17, 'Exultant Slow Down', 8, 2008),
(18, 'Torpor Of Mozart', 4, 2004),
(19, 'Regretful Nature', 8, 2008),
(20, 'Discover Cold Hand', 10, 2000);

Drop TABLE if EXISTS SINGER;
-- Create the SINGER table
CREATE TABLE SINGER (
    singer_id INT PRIMARY KEY,
    singer_name VARCHAR(50),
    user_id INT
);

-- Insert data into the SINGER table
INSERT INTO SINGER (singer_id, singer_name, user_id) VALUES
(1, 'Phoebe Bradford', NULL),
(2, 'Jean Paul', NULL),
(3, 'Ajay Maheshwari', 1),
(4, 'Yadiel Knox', NULL),
(5, 'Gary Huerta', NULL),
(6, 'Grace Norman', NULL),
(7, 'Aaron Freeman', NULL),
(8, 'Jazmine Moyer', NULL),
(9, 'Harley Hayes', NULL),
(10, 'Liana Mcknight', NULL),
(11, 'Maximo Preston', NULL),
(12, 'Taniya Rojas', 10),
(13, 'Siena Gamble', NULL),
(14, 'Cassandra Morales', NULL),
(15, 'Aubrey Trujillo', NULL),
(16, 'Emery Ibarra', NULL),
(17, 'Britney Carlson', NULL),
(18, 'Raegan Kerr', NULL),
(19, 'Juliet Cabrera', NULL),
(20, 'Clara Braun', NULL);


Drop TABLE if EXISTS LIKED_BY;
-- Create the LIKED_BY table
CREATE TABLE LIKED_BY (
    song_id INT,
    user_id INT,
    PRIMARY KEY (song_id, user_id)
);



-- Insert unique data into the LIKED_BY table
INSERT INTO LIKED_BY (song_id, user_id) VALUES
(12, 10),
(11, 6),
(5, 3),
(11, 7),
(12, 6),
(8, 3),
(6, 10),
(10, 12),
(6, 3),
(11, 12),
(8, 9),
(9, 10),
(10, 5),
(4, 12),
(16, 10),
(14, 19),
(19, 13),
(1, 19),
(20, 10),
(1, 6),
(1, 3),
(7, 4),
(13, 13),
(7, 10),
(18, 18),
(13, 14),
(7, 19),
(17, 16);



Drop TABLE if EXISTS Follower;
-- Create the Follower table
CREATE TABLE Follower (
    user_id INT,
    singer_id INT
);

-- Insert the data into the Follower table
INSERT INTO Follower (user_id, singer_id) VALUES
(10, 12),
(6, 11),
(3, 5),
(7, 11),
(6, 12),
(3, 8),
(10, 6),
(10, 12),
(3, 5),
(6, 12),
(12, 10),
(3, 6),
(12, 11),
(9, 8),
(10, 9),
(5, 10),
(3, 6),
(12, 4),
(15, 10),
(13, 19),
(18, 13),
(1, 19),
(19, 10),
(1, 6),
(1, 3),
(8, 4),
(15, 10),
(11, 13),
(8, 10),
(17, 18),
(11, 14),
(8, 19),
(16, 16);

-- Create the Belongs_to table

Drop TABLE if EXISTS Belongs_to;
-- Create the Belongs_to table
CREATE TABLE Belongs_to (
    song_id INT,
    playlist_id INT
);

-- Insert data with IGNORE to skip duplicates
INSERT IGNORE INTO Belongs_to (song_id, playlist_id) VALUES
(8, 5),
(11, 3),
(10, 9),
(9, 5),
(1, 6),
(13, 3),
(13, 9),
(8, 5),  -- This duplicate will be skipped
(11, 8),
(4, 5),
(10, 3),
(11, 4),
(10, 4),
(12, 11),
(8, 12),
(3, 8),
(6, 4),
(10, 7),
(15, 2),
(15, 3),
(16, 2),
(17, 5),
(15, 4),
(16, 3),
(5, 10),
(19, 19),
(18, 13),
(2, 19),
(19, 10),
(2, 6),
(2, 3),
(14, 4),
(5, 10),  -- Duplicate of row 26 (will be skipped)
(18, 13),  -- Duplicate of row 28 (will be skipped)
(14, 10),
(14, 18),
(18, 14),
(14, 19),
(7, 16);



Drop TABLE if EXISTS playlist;

-- Create the Playlist table
CREATE TABLE Playlist (
    playlist_id INT PRIMARY KEY,
    playlist_name VARCHAR(255) NOT NULL
);

-- Insert data into the Playlist table
INSERT INTO Playlist (playlist_id, playlist_name) VALUES
(1, 'Romantic Songs'),
(2, 'Awkward Conversations'),
(3, 'Fly Away'),
(4, 'Sounds Of Silence'),
(5, 'Stuck On The Puzzle'),
(6, 'Action Manga'),
(7, 'Night Drive'),
(8, 'Action Action Action'),
(9, 'Warm Up 2022'),
(10, 'African Praise'),
(11, 'Breathe In Breathe Out'),
(12, 'Brave Mans Death'),
(13, 'Diamonds Dancing'),
(14, 'Argyle Stranger Things'),
(15, 'Lose My Mind'),
(16, 'Basketball Warmup'),
(17, 'Sound Of Silence'),
(18, 'Only For The Brave'),
(19, 'Breathe Breathe Breathe'),
(20, 'Awesome Mixtape');

-- Suppose we want to implement the feature of premium subscriptions on our platform. Then we will need a column to differentiate between regular users and Premium Users. For that, we
--  need to add a new column named user_type (VARCHAR (10)) in the User table with a default value of 'regular.

Alter Table user add column user_type varchar(10) default 'regular'; 

-- analyzing
SELECT * FROM singer WHERE singer_name LIKE 'a%' OR singer_name LIKE 'b%';

--  find the percentage (rounded to 2 decimal places) of likes every song has with respect to the total number of likes. Rename that column to Likes_Percentage.

select song.song_name,
round(100*count(Liked_By.user_id)/
(select count(*) from Liked_By ),2) as Likes_Percentage
from song join Liked_By on Song.song_id = Liked_By.song_id
group by song.song_id;

--  which outputs song_name along with its category. The category of a song is defined as "Super Hit" if it has
--   more than 3 likes, "Popular" if it has likes between 2 and 3, and "average" if it has less than 2 likes.

select song_name , case
when count(Liked_By.user_id) > 3 then "Super Hit"
when count(Liked_By.user_id) between 2 and 3 then "popular"
else "average" end as category
from Song join Liked_By On Song.song_id = Liked_By.song_id
group by Song.Song_id;

-- the query to print name of singers along with count of their followers ( aliased as follower_count )

select singer_name,count(Follower.user_id)
as follower_count
from singer join Follower
on singer.singer_id = Follower.singer_id
group by Follower.singer_id;

-- the query to print name of users whose age is less than average age of Females among all users ;

select user_name from User
where user_id in (
select user_id from User where age < (
select AVG(age) from User where gender =
'Female' ));


-- Write a query to output the table 'User'. Limit your results to 3 rows.
Select 
  * 
from 
  user 
limit 
  3; 

-- Write a query to print all the names of singers which starts with ‘a’

select 
  singer_name 
from 
  singer 
where 
  singer_name like 'a%';

-- Write a query to Print singer_name which are also users;


select 
  SG.singer_name 
from 
  user U 
  join Singer SG on U.user_id = SG.user_id;

--or
-- Approach 1: Using INNER JOIN

SELECT s.singer_name
FROM singer s
INNER JOIN User u ON s.user_id = u.user_id;

-- Approach 2: Using the IN Clause

SELECT singer_name
FROM singer
WHERE user_id IN (SELECT user_id FROM User);

-- Write a query to Output the singer_name's and Count of Followers as Count which have more than 2 followers

Select 
  SG.singer_name, 
  count(F.user_id) as Count 
from 
  singer SG 
  join Follower F on SG.singer_id = F.singer_id 
group by 
  SG.singer_id 
HAVING 
  count(F.user_id) > 2;

-- Write a query to Return the total number of follower for singer named ‘Taniya Rojas’ , RENAME that column as Follower_count

SELECT 
  Count(SG.user_id) as Follower_count 
from 
  Singer SG 
  join Follower F on SG.singer_id = F.singer_id 
where 
  SG.singer_name = "Taniya Rojas";

-- Write a query to Retrieve the name of user’s along with the count of singers they are following as Total_count

select 
  U.user_name, 
  count(F.singer_id) as Total_count 
from 
  user U 
  join Follower F on U.user_id = F.user_id 
group by 
  F.user_id;

-- Approach 1: Using INNER JOIN with GROUP BY

SELECT u.user_name AS user_name,
       COUNT(f.singer_id) AS Total_count
FROM User u
JOIN Follower f ON u.user_id = f.user_id
GROUP BY u.user_id, u.user_name;

-- Approach 2: Using a Correlated Subquery

SELECT u.user_name AS user_name,
       (SELECT COUNT(*) FROM Follower f WHERE f.user_id = u.user_id) AS Total_count
FROM User u
WHERE (SELECT COUNT(*) FROM Follower f WHERE f.user_id = u.user_id) > 0;


-- Write a query to output song_id's of songs which has more likes than the average number of likes.

select 
  song_id 
from 
  Liked_By 
group by 
  song_id 
having 
  count(user_id) > (
    select 
      AVG(like_count) 
    from 
      (
        select 
          count(user_id) as like_count 
        from 
          Liked_By 
        group by 
          song_id
      ) as counts
  );

  --OR 

-- Approach 2: Using Nested Subqueries

SELECT song_id 
FROM (
  SELECT s.song_id, COUNT(l.user_id) AS like_count
  FROM Song s 
  LEFT JOIN Liked_By l ON s.song_id = l.song_id
  GROUP BY s.song_id
) AS SongCounts
WHERE like_count > (
  SELECT AVG(like_count) 
  FROM (
    SELECT COUNT(l.user_id) AS like_count
    FROM Song s 
    LEFT JOIN Liked_By l ON s.song_id = l.song_id
    GROUP BY s.song_id
  ) AS AvgCounts
);

-- Approach 1: Using Common Table Expressions (CTEs)

WITH SongLikes AS (
  SELECT s.song_id, COUNT(l.user_id) AS like_count
  FROM Song s 
  LEFT JOIN Liked_By l ON s.song_id = l.song_id
  GROUP BY s.song_id
),
AvgLikes AS (
  SELECT AVG(like_count) AS avg_likes FROM SongLikes
)
SELECT song_id 
FROM SongLikes
WHERE like_count > (SELECT avg_likes FROM AvgLikes);

-- Write a query to Output the name of song with maximum number of likes among all songs.

-- Approach 1: Subquery with Aggregation and Maximum Comparison

SELECT s.song_name
FROM Song s
JOIN (
    SELECT song_id, COUNT(*) AS likes
    FROM Liked_By
    GROUP BY song_id
) lb ON s.song_id = lb.song_id
WHERE lb.likes = (
    SELECT MAX(like_count)
    FROM (
        SELECT COUNT(*) AS like_count
        FROM Liked_By
        GROUP BY song_id
    )
);

-- Approach 2: Using ORDER BY and LIMIT
SELECT s.song_name
FROM Song s
JOIN Liked_By lb ON s.song_id = lb.song_id
GROUP BY s.song_id
ORDER BY COUNT(lb.user_id) DESC
LIMIT 1;

--OR

SELECT 
  SO.song_name 
FROM 
  Song SO 
  jOIN Liked_by LB ON SO.song_id = LB.song_id 
GROUP BY 
  SO.song_id 
ORDER BY 
  COUNT(LB.song_id) DESC 
Limit 
  1;


-- Write a query to Return song_id of songs which are not in any playlist
-- Approach 1: Using LEFT JOIN

SELECT s.song_id
FROM Song s
LEFT JOIN Belongs_To b ON s.song_id = b.song_id
WHERE b.song_id IS NULL;

-- Approach 2: Using NOT EXISTS Subquery

SELECT s.song_id
FROM Song s
WHERE NOT EXISTS (
  SELECT 1
  FROM Belongs_To b
  WHERE b.song_id = s.song_id
);

-- OR

select 
  song_id 
from 
  Song 
except 
select 
  song_id 
from 
  Belongs_To;

-- Write a query to Return the list of songs which are present in at least two playlist.

-- Approach 1: Using Self Join
-- Select distinct songs which appear in at least two different playlists.
SELECT DISTINCT s.song_id, s.song_name
FROM Song s
JOIN Belongs_To b1 ON s.song_id = b1.song_id
JOIN Belongs_To b2 ON s.song_id = b2.song_id AND b1.playlist_id < b2.playlist_id;

-- Approach 2: Using Aggregation
-- Group by song_id and filter songs that appear in at least two distinct playlists.
SELECT s.song_id, s.song_name
FROM Song s
JOIN (
    SELECT song_id
    FROM Belongs_To
    GROUP BY song_id
    HAVING COUNT(DISTINCT playlist_id) >= 2
) AS multi_mood ON s.song_id = multi_mood.song_id;

--OR
/* Solution as Follows */

SELECT 
  BT1.song_id, 
  SO.song_name 
FROM 
  Belongs_to BT1 
  JOIN Belongs_to BT2 ON BT1.song_id = BT2.song_id 
  AND BT1.playlist_id <> BT2.playlist_id 
  JOIN Song SO ON BT1.song_id = SO.song_id 
GROUP BY 
  BT1.song_id, 
  SO.song_name 
HAVING 
  COUNT(DISTINCT BT1.playlist_id) >= 2;
  

-- Write a query to Determine the song which has highest number of likes in every 
-- playlist. Output 4 columns namely playlist_id , song_id , song_name and maximum like count as max_likes

-- Step 1: Count the number of likes for each song
WITH LikeCounts AS (
    SELECT 
        lb.song_id, 
        s.song_name, 
        COUNT(lb.user_id) AS like_count  -- Counting how many users liked each song
    FROM Liked_By lb
    JOIN Song s ON lb.song_id = s.song_id  -- Joining with the Song table to get song names
    GROUP BY lb.song_id, s.song_name  -- Grouping by song_id and song_name to get likes per song
), 

-- Step 2: Rank songs within each playlist based on like count
RankedSongs AS (
    SELECT 
        bt.playlist_id,  -- Get the playlist_id
        lc.song_id,  -- Get the song_id
        lc.song_name,  -- Get the song name
        lc.like_count,  -- Get the like count for the song
        ROW_NUMBER() OVER (
            PARTITION BY bt.playlist_id  -- Reset ranking for each playlist
            ORDER BY lc.like_count DESC, lc.song_id ASC  -- Order songs by highest likes, breaking ties by lowest song_id
        ) AS rnk  -- Assign a unique rank to each song in a playlist
    FROM Belongs_To bt
    JOIN LikeCounts lc ON bt.song_id = lc.song_id  -- Join to get like counts for songs in each playlist
)

-- Step 3: Select the song with the highest likes for each playlist
SELECT 
    playlist_id, 
    song_id, 
    song_name, 
    like_count AS max_likes  -- Rename like_count to max_likes for clarity
FROM RankedSongs
WHERE rnk = 1;  -- Select only the top-ranked song for each playlist


-- Write a query which returns Singer_id, Singer_name , Count of Followers as follower_count and percentage of followers ( as follower_percentage rounded to ONE decimal place ) for every singer with respect to total number of followers of all singers.

-- Note : Entry should be there for all singers even if they have 0% followers;

-- Approach 1: Direct subquery for total follower count
SELECT 
    s.singer_id,
    s.singer_name,
    COUNT(f.singer_id) AS follower_count,
    ROUND(COUNT(f.singer_id) * 100.0 / (SELECT COUNT(*) FROM Follower), 1) AS follower_percentage
FROM singer s
LEFT JOIN Follower f ON s.singer_id = f.singer_id
GROUP BY s.singer_id, s.singer_name
ORDER BY s.singer_id;

--OR

SELECT 
  SG.singer_id, 
  SG.singer_name, 
  COUNT(F.user_id) AS follower_count, 
  ROUND(
    COUNT(F.user_id) * 100.0 / (
      SELECT 
        COUNT(*) 
      FROM 
        Follower
    ), 
    1
  ) AS follower_percentage 
FROM 
  Singer SG 
  LEFT JOIN Follower F ON SG.singer_id = F.singer_id 
GROUP BY 
  SG.singer_id;