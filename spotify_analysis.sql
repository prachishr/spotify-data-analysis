-- Advance SQL project --
CREATE DATABASE spotify_db;
USE spotify_db; 

SELECT * 
FROM spotify_dataset 
Limit 10;

DESCRIBE spotify_dataset;

SELECT COUNT(*) AS total_songs
FROM spotify_dataset;
DESCRIBE spotify_dataset;

-- QUESTION 1 : Retrieve the names of all tracks that have more than 1 billion streams.
SELECT Track, Stream
FROM spotify_dataset
WHERE Stream > 1000000000;

-- QUESTION 2 : List all albums along with their respective artists.
SELECT DISTINCT Album , Artist
FROM spotify_dataset ;

-- QUESTION 3 : Get the total number of comments for tracks where Licensed = TRUE.

SELECT SUM(Comments) AS total_comments
FROM spotify_dataset
WHERE Licensed = 'TRUE';

-- Question 4 : Find all tracks that belong to the album type single

SELECT Track, Album_type
FROM spotify_dataset
WHERE Album_type = 'single';

-- Question 5 : Count the total number of tracks by each artist

SELECT Artist,
       COUNT(*) AS total_tracks
FROM spotify_dataset
GROUP BY Artist
ORDER BY total_tracks DESC;

-- Question 6 : Calculate the average danceability of tracks in each album

SELECT Album,
       ROUND(AVG(Danceability),2) AS avg_danceability
FROM spotify_dataset
GROUP BY Album
ORDER BY avg_danceability DESC;

-- Question 7: Find the top 5 tracks with the highest energy values

SELECT Track, Energy
FROM spotify_dataset
ORDER BY Energy DESC
LIMIT 5;

-- Question 8 : List all tracks along with their views and likes where official_video = TRUE

SELECT Track, Views, Likes
FROM spotify_dataset
WHERE official_video = 'TRUE'
ORDER BY Views DESC;

-- Question 9 : For each album, calculate the total views of all associated tracks

SELECT Album,
       SUM(Views) AS total_views
FROM spotify_dataset
GROUP BY Album
ORDER BY total_views DESC;

-- Question 10 : Retrieve the track names that have been streamed on Spotify more than YouTube

SELECT Track,
       Stream,
       Views
FROM spotify_dataset
WHERE Stream > Views
ORDER BY Stream DESC;

-- Question 11 : Find the top 3 most-viewed tracks for each artist using window functions

WITH ranked_tracks AS
(
    SELECT
        Artist,
        Track,
        Views,
        ROW_NUMBER() OVER(
            PARTITION BY Artist
            ORDER BY Views DESC
        ) AS rn
    FROM spotify_dataset
)
SELECT
    Artist,
    Track,
    Views
FROM ranked_tracks
WHERE rn <= 3;

-- Question 12 : Find tracks where the liveness score is above the average

SELECT
    Track,
    Artist,
    Liveness
FROM spotify_dataset
WHERE Liveness >
(
    SELECT AVG(Liveness)
    FROM spotify_dataset
);

-- Question 13 : Calculate difference between highest and lowest energy values for each album using CTE
WITH cte AS
(
    SELECT
        Album,
        MAX(Energy) AS highest_energy,
        MIN(Energy) AS lowest_energy
    FROM spotify_dataset
    GROUP BY Album
)
SELECT
    Album,
    highest_energy - lowest_energy AS energy_diff
FROM cte
ORDER BY energy_diff DESC;

-- Question 14 : Find tracks where the energy-to-liveness ratio is greater than 1.2

SELECT
    Track,
    Artist,
    Energy,
    Liveness,
    ROUND(Energy / Liveness,2) AS energy_liveness_ratio
FROM spotify_dataset
WHERE Energy / Liveness > 1.2
ORDER BY energy_liveness_ratio DESC;

-- Question 15 : Calculate cumulative sum of likes ordered by views using window functions

SELECT
    Track,
    Views,
    Likes,
    SUM(Likes) OVER(
        ORDER BY Views
    ) AS cumulative_likes
FROM spotify_dataset
ORDER BY Views;