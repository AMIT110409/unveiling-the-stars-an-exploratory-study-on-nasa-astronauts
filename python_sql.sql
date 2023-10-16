create database b3e69994;

use b3e69994;

select * from astronauts;

-- 1. the status of the astronaut
As we execute this query, we're driven by the desire to inspire, inform, and honor their journeys. Each row of data represents a chapter in the grand story of space exploration, and by querying it, we're paying homage to their remarkable endeavors. We're doing this query to shed light on the heroes of the cosmic frontier and to share their awe-inspiring narratives with the world.

%%sql
SELECT * FROM astronauts;

-- 2. the Military Branch of the astronaut.
%%sql
SELECT Status, COUNT(*) as Number
FROM astronauts
GROUP BY Status;


-- 3. the top 5 military ranks among astronauts.
Our previous queries have illuminated the dynamic careers and diverse backgrounds of these space heroes. Now, we turn our attention to their military branches, a vital chapter in their incredible journeys.

%%sql
SELECT Military_Rank, COUNT(*) as Number
FROM astronauts
GROUP BY Military_Rank
ORDER BY Number DESC
LIMIT 5;

  
-- 4.the number of male and female astronauts
Our cosmic journey through the astronaut dataset takes another captivating turn. Building upon our exploration of their military backgrounds and ranks, we now shift our focus to a crucial aspect of their diverse profiles: gender.

%%sql
SELECT Gender, COUNT(*) as Number
FROM astronauts
GROUP BY Gender;


  
-- 5.the average life expectancy of astronauts
In this exploration, we pay tribute to the resilience and courage of these cosmic pioneers. Each astronaut's life expectancy, whether achieved or anticipated, is a testament to the unwavering spirit that propels humanity beyond Earth's bounds.

%%sql 
SELECT ROUND(AVG(subquery.life_Expectancy)) AS Average_Life_Expectancy
FROM (
    SELECT
        CASE
            WHEN Status = 'Deceased' THEN YEAR(Death_Date) - YEAR(Birth_Date)
            ELSE 2023 - YEAR(Birth_Date)
        END AS life_Expectancy
    FROM astronauts
) AS subquery;

-- 6.he average life expectancy of female astronauts
In our ongoing journey through the astronaut dataset, we now shine a spotlight on a remarkable group of cosmic trailblazers—female astronauts. Their life expectancies, both achieved and anticipated, represent a testament to their extraordinary dedication and contribution to space exploration.

%%sql
SELECT ROUND(AVG(subquery.Female_life_Expectancy)) AS Female_Average_Life_Expectancy
FROM (
    SELECT
        CASE
            WHEN Status = 'Deceased' AND Gender = 'Female' THEN YEAR(Death_Date) - YEAR(Birth_Date)
            WHEN Status != 'Deceased' AND Gender = 'Female' THEN 2023 - YEAR(Birth_Date)
        END AS Female_life_Expectancy
    FROM astronauts
) AS subquery;

-- 7.the average life expectancy of male astronauts
In our ongoing odyssey through the astronaut dataset, we now turn our attention to the remarkable group of male astronauts, who have left an indelible mark on the cosmos. The focus of our inquiry? Their life expectancies, a testament to their unyielding commitment and dedication to the exploration of space.

%%sql
SELECT ROUND(AVG(subquery.Male_life_Expectancy)) AS Male_Average_Life_Expectancy
FROM (
    SELECT
        CASE
            WHEN Status = 'Deceased' AND Gender = 'Male' THEN YEAR(Death_Date) - YEAR(Birth_Date)
            WHEN Status != 'Deceased' AND Gender = 'Male' THEN 2023 - YEAR(Birth_Date)
        END AS Male_life_Expectancy
    FROM astronauts
) AS subquery;
​
-- 8. top 10 graduate majors among astronauts
This forthcoming query, though a mere compilation of data, is a portal to a world of knowledge. It reveals the top ten graduate majors, offering a glimpse into the educational tapestry that makes up the astronaut corps.

%%sql
SELECT Graduate_Major, COUNT(*) AS Number
FROM astronauts
GROUP BY Graduate_Major
ORDER BY Number DESC
LIMIT 10;

-- 9.the count of astronauts with undergraduate and graduate degrees
As we meticulously examine these numbers, we are not merely dealing with data points; we are delving into the very essence of these space heroes. The "Number_of_Astronauts" figure serves as a testament to the exclusive fellowship of cosmic explorers, those who have boldly transcended the boundaries of Earth.

%%sql
SELECT
    COUNT(*) AS Number_of_Astronauts,
    SUM(CASE WHEN Undergraduate_Major IS NOT NULL THEN 1 ELSE 0 END) AS Astronauts_with_Undergraduate_Degrees,
    SUM(CASE WHEN Graduate_Major IS NOT NULL  THEN 1 ELSE 0 END) AS Astronauts_with_Graduate_Degrees
FROM astronauts;
​
-- 10. top 5 states of birth for astronauts
Each city represents a unique chapter in the story of these cosmic pioneers. From bustling metropolises to quiet towns, these diverse origins reflect the universal aspiration to reach for the stars.

%%sql
SELECT SUBSTRING_INDEX(Birth_Place, ',', -1) AS STATE, COUNT(*) AS Number_of_Astronauts
FROM astronauts
GROUP BY STATE
ORDER BY Number_of_Astronauts DESC
LIMIT 5;
​

-- 11. the average number of space flights and spacewalks for astronauts
These averages tell the story of dedication, training, and the relentless pursuit of scientific discovery and exploration. The numbers, though abstract, are a reflection of the countless hours of preparation and the courage required to journey beyond our planet.

%%sql
SELECT
    ROUND(AVG(Space_Flights), 2) AS Average_Number_Of_Space_Flight,
    ROUND(AVG(Space_Walks), 2) AS Average_Number_Of_Space_Walks
FROM astronauts;
​

-- 12. the top 10 alma maters (universities or institutions) of astronauts
SELECT Top 10
    Alma_Mater,
    COUNT(*) AS Astronauts_Count
FROM astro
GROUP BY Alma_Mater
ORDER BY Astronauts_Count DESC;

-- 13.he top 10 undergraduate majors among astronauts
SELECT Top 10
    Undergraduate_Major,
    COUNT(*) AS Astronauts_Count
FROM astro
GROUP BY Undergraduate_Major
ORDER BY Astronauts_Count DESC;

-- 14.the count of astronauts who didn't change their major (i.e., they pursued the same major for both undergraduate and graduate studies)
SELECT COUNT(*) AS Astronauts_Count_No_Major_Change
FROM astro
WHERE Undergraduate_Major IS NOT NULL AND Graduate_Major IS NOT NULL AND Undergraduate_Major = Graduate_Major;

-- 15.the youngest astronaut until today
SELECT TOP 1 Name, Birth_Date
FROM astro
ORDER BY Birth_Date DESC;
-- 16. astronauts who passed away without being on a mission and to determine their death dates
SELECT Name, Death_Date, Death_Mission
FROM astro
WHERE Status = 'Deceased' AND Death_Mission IS NOT NULL;

-- 17.the top 5 astronauts who have taken the most space flights
SELECT 
Top 10
Name, Space_Flights
FROM astro
ORDER BY Space_Flights DESC;

-- 18.the top 3 astronauts who spent the longest time in space
SELECT TOP 10
    Name,
    "Space_Flight_(hr)"
FROM astro
ORDER BY "Space_Flight_(hr)" DESC;

-- 19.the top 10 astronauts who have conducted the most spacewalks
SELECT 
Top 10
Name, Space_Walks
FROM astro
ORDER BY Space_Walks DESC;

-- 20.the top 10 astronauts with the longest total spacewalk hours and their names
SELECT
Top 10
Name, "Space_Walks_(hr)"
FROM astro
ORDER BY "Space_Walks_(hr)" DESC;

-- 21.astronauts who have no alma mater (no information about their undergraduate institution)
SELECT *
FROM astro
WHERE Alma_Mater IS NULL and Undergraduate_Major is null;

-- 22.the astronaut who most recently joined the astronaut program
SELECT 
Top 1 *
FROM astro
ORDER BY Year DESC;

-- 23.the names of astronauts who were part of the Apollo missions
SELECT DISTINCT Name, Missions
FROM astro
WHERE Missions LIKE '%Apollo%';

-- 24.astronauts who did not take any space flights
SELECT *
FROM astro
WHERE Space_Flights = 0;

-- 25.the oldest active astronaut as of today,
SELECT 
Top 1
*
FROM astro
WHERE Status = 'Active'
ORDER BY Birth_Date ASC;
