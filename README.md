# Spotify Data Analysis Using MySQL

## Project Overview

This project focuses on analyzing Spotify music streaming data using MySQL. The dataset was imported from Kaggle and explored using SQL queries ranging from basic filtering to advanced analytical techniques such as Common Table Expressions (CTEs) and Window Functions.

The objective of this project is to extract meaningful insights related to song popularity, artist performance, album trends, streaming behavior, and engagement metrics.

---

## Tools & Technologies

* MySQL
* MySQL Workbench
* SQL
* Git
* GitHub

---

## Dataset

* Source: Kaggle Spotify Dataset
* Records include information about:

  * Artist
  * Track
  * Album
  * Album Type
  * Streams
  * Views
  * Likes
  * Comments
  * Danceability
  * Energy
  * Liveness
  * Tempo
  * Acousticness
  * Official Video Status
  * Platform Information

---

## Database Schema

Table Used:

```sql
spotify_dataset
```

Important Columns:

* Artist
* Track
* Album
* Album_type
* Stream
* Views
* Likes
* Comments
* Danceability
* Energy
* Liveness
* Tempo
* official_video
* Licensed
* most_playedon

---

## SQL Concepts Applied

### Basic SQL

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* LIMIT

### Aggregate Functions

* COUNT()
* SUM()
* AVG()
* MAX()
* MIN()

### Grouping & Filtering

* GROUP BY
* HAVING

### Advanced SQL

* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* ROW_NUMBER()
* SUM() OVER()

---

## Analysis Performed

1. Tracks with more than 1 billion streams
2. Albums and their respective artists
3. Total comments on licensed tracks
4. Tracks belonging to album type "single"
5. Total tracks released by each artist

6. Average danceability of tracks in each album
7. Top 5 tracks with highest energy
8. Official videos with views and likes
9. Album-wise total views
10. Tracks streamed more on Spotify than YouTube

11. Top 3 most-viewed tracks for each artist using Window Functions
12. Tracks with above-average liveness score
13. Energy variation across albums using CTEs
14. Energy-to-Liveness ratio analysis
15. Cumulative likes analysis using Window Functions

---

## Key Insights

* Several tracks have exceeded 1 billion Spotify streams.
* Certain artists dominate both streaming and engagement metrics.
* Albums show significant variation in danceability and energy levels.
* Official videos generally receive higher engagement through likes and views.
* Window Functions provide efficient ranking and cumulative analysis.

---

## Project Structure

```text
spotify-data-analysis/
│
├── dataset/
│   └── spotify_dataset.csv
│
├── sql_queries/
│   └── spotify_analysis.sql
│
├── screenshots/
│   ├── q1_stream_analysis.png
│   ├── q7_energy_analysis.png
│   ├── q11_window_function.png
│   └── q13_cte_analysis.png
│
└── README.md
```

---

## Learning Outcomes

Through this project, I gained hands-on experience in:

* Database creation and management
* Data import and preprocessing
* SQL query writing and optimization
* Exploratory data analysis using SQL
* Advanced analytical techniques using CTEs and Window Functions
* Version control using Git and GitHub

---

## Author

Prachi Sharma 

SQL | MySQL | Data Analysis | GitHub Projects
