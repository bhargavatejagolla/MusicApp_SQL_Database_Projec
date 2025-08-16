# Music Streaming App Database Project 🎵


A comprehensive SQL database project for a music streaming application, featuring user management, song tracking, playlist organization, and analytics capabilities.

## Project Overview

**Project Title**: Music App Database System  
**Level**: Intermediate  
**Database**: `musicapp`  
**Tables**: 6 (User, Song, Singer, Liked_By, Follower, Belongs_to, Playlist)

This project demonstrates advanced SQL techniques for managing a music streaming platform's data infrastructure, including complex queries, joins, aggregations, and analytical functions.

## Database Schema Design

### Entity-Relationship Diagram
```
USER ────┬─── SINGER
│
├─── LIKED_BY ─── SONG
│ │
└─── FOLLOWER ─── SINGER
│
PLAYLIST ─── BELONGS_TO ─── SONG
```

### Tables Structure
- **User**: 20 records with demographics (age, gender, location)
- **Song**: 20 tracks with release years and artist mappings
- **Singer**: 20 artists including user-artists
- **Liked_By**: 28 user-song interactions
- **Follower**: 33 user-artist relationships
- **Playlist**: 20 curated collections
- **Belongs_To**: 39 song-playlist mappings

## Key SQL Features Demonstrated

### Advanced Query Techniques
```sql
-- CTE for song popularity analysis
WITH LikeCounts AS (
    SELECT song_id, COUNT(*) AS likes
    FROM Liked_By GROUP BY song_id
)
SELECT song_name, 
       DENSE_RANK() OVER(ORDER BY likes DESC) AS popularity_rank
FROM Song JOIN LikeCounts USING(song_id);
```
## Business Logic Implementations
### User Segmentation:
  ```sql
  ALTER TABLE user ADD COLUMN user_type VARCHAR(10) DEFAULT 'regular';
  ```
### Content Categorization:
  ```sql
  SELECT song_name, 
         CASE WHEN likes > 3 THEN 'Super Hit'
              WHEN likes BETWEEN 2 AND 3 THEN 'Popular'
              ELSE 'Average' END AS category
  FROM Song JOIN (
      SELECT song_id, COUNT(*) AS likes 
      FROM Liked_By GROUP BY song_id
  ) AS likes USING(song_id);
  ```
## Analytical Insights:
  ### Top Performances:
  - Most Popular Song:
      ```sql
      SELECT song_name FROM Song
      JOIN Liked_By USING(song_id)
      GROUP BY song_id ORDER BY COUNT(*) DESC LIMIT 1;
      ```
  - Artist Follower Analysis:
      ```sql
      SELECT singer_name, 
       COUNT(*) AS followers,
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM Follower),1) AS percentage
       FROM Singer LEFT JOIN Follower USING(singer_id)
      GROUP BY singer_id;    
  ### Playlist Analytics:
  ```sql
      -- Songs in multiple playlists
      SELECT song_id, song_name 
      FROM Song JOIN Belongs_to USING(song_id)
      GROUP BY song_id HAVING COUNT(DISTINCT playlist_id) >= 2;
  ```
---
## Installation & Setup
1. Database Initialization  
   ```sql
   CREATE DATABASE musicapp;
   USE musicapp;
   ```
2. Table Creation
   ```sql
   CREATE TABLE User (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    pincode VARCHAR(10)
    );
   ```
3.Data Import:

-  Execute provided INSERT statements
-   Verify with SELECT COUNT(*) FROM User; (should return 20)
-   Execute the INSERT INTO statements for Users, Songs, Singers, etc.
  
4.Verify Data Load:
```sql
    SELECT COUNT(*) FROM User;   -- should return 20
    SELECT COUNT(*) FROM Song;   -- should return 20
```
## 📊 Business Use Cases Solved  

- ✔ **Track most popular songs** and categorize them.  
- ✔ **Identify top-performing artists** based on followers.  
- ✔ **Segment users** (regular vs premium).  
- ✔ **Playlist analytics** (songs in multiple playlists, top songs per playlist).  
- ✔ **Demographic insights** (age-based, gender-based).  

---

## 🚀 Why This Project is Helpful  

This project is useful for:  

- 🎓 **Students**: Practicing SQL joins, subqueries, CTEs, and window functions.  
- 📊 **Data Analysts**: Understanding how to structure and query relational data.  
- 💼 **Interview Prep**: Covers many real-world SQL scenarios frequently asked in technical interviews.  
- 👨‍💻 **Developers**: Can be used as a base schema for building the backend of a music streaming app.  
---
## 👨‍💻 Author

*Golla Bhargava Teja*  

- 🌐 [Portfolio / Projects](https://github.com/bhargavatejagolla)  
- 💼 [LinkedIn](https://www.linkedin.com/in/golla-bhargava-teja/)  


  
