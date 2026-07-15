Create Database Virat_Kohli_Analysis;
USE Virat_Kohli_Analysis;

SELECT * FROM virat_kohli_stats;

#1. Retrieve Virat Kohli's complete career statistics:
CREATE VIEW Complete_Career_Statistics AS
SELECT *
FROM virat_kohli_stats;

#1. Retrieve Virat Kohli's complete career statistics:
SELECT * FROM Complete_Career_Statistics;


#2. Calculate the total runs scored in each format:
CREATE VIEW Total_Runs_By_Format AS
SELECT Format,
       SUM(Runs) AS Total_Runs
FROM virat_kohli_stats
GROUP BY Format;

#2. Calculate the total runs scored in each format:
SELECT * FROM Total_Runs_By_Format;


#3. Find the average batting average for each format:
CREATE VIEW Average_By_Format AS
SELECT Format,
       ROUND(AVG(Avg),2) AS Average_Batting_Average
FROM virat_kohli_stats
GROUP BY Format;

#3. Find the average batting average for each format:
SELECT * FROM Average_By_Format;


#4. Find the year with the highest runs scored:
CREATE VIEW Highest_Run_Year AS
SELECT Year,
       Format,
       Runs
FROM virat_kohli_stats
ORDER BY Runs DESC
LIMIT 1;

#4. Find the year with the highest runs scored:
SELECT * FROM Highest_Run_Year;


#5. Calculate total centuries and half-centuries in each format:
CREATE VIEW Hundreds_And_Fifties AS
SELECT Format,
       SUM(`100`) AS Total_Centuries,
       SUM(`50`) AS Total_Half_Centuries
FROM virat_kohli_stats
GROUP BY Format;

#5. Calculate total centuries and half-centuries in each format:
SELECT * FROM Hundreds_And_Fifties;


#6. Find the highest individual score in each format:
CREATE VIEW Highest_Score_By_Format AS
SELECT Format,
       MAX(HS) AS Highest_Score
FROM virat_kohli_stats
GROUP BY Format;

#6. Find the highest individual score in each format:
SELECT * FROM Highest_Score_By_Format;


#7. Calculate total boundaries (4s and 6s) in each format:
CREATE VIEW Total_Boundaries AS
SELECT Format,
       SUM(`4s`) AS Total_Fours,
       SUM(`6s`) AS Total_Sixes
FROM virat_kohli_stats
GROUP BY Format;

#7. Calculate total boundaries (4s and 6s) in each format:
SELECT * FROM Total_Boundaries;


#8. Find the top five innings with the highest strike rate:
CREATE VIEW Highest_Strike_Rate AS
SELECT Year,
       Format,
       Runs,
       SR
FROM virat_kohli_stats
ORDER BY SR DESC
LIMIT 5;

#8. Find the top five innings with the highest strike rate:
SELECT * FROM Highest_Strike_Rate;


#9. Calculate Virat Kohli's overall career statistics:
CREATE VIEW Overall_Career_Statistics AS
SELECT
SUM(Innings) AS Total_Innings,
SUM(Runs) AS Total_Runs,
ROUND(AVG(Avg),2) AS Career_Average,
ROUND(AVG(SR),2) AS Career_Strike_Rate,
SUM(`100`) AS Total_Centuries,
SUM(`50`) AS Total_Half_Centuries,
SUM(`4s`) AS Total_Fours,
SUM(`6s`) AS Total_Sixes
FROM virat_kohli_stats;

#9. Calculate Virat Kohli's overall career statistics:
SELECT * FROM Overall_Career_Statistics;


#10. Retrieve all records where Virat Kohli scored more than 100 runs:
CREATE VIEW Centurion_Innings AS
SELECT Year,
       Format,
       Runs,
       HS
FROM virat_kohli_stats
WHERE Runs > 100
ORDER BY Runs DESC;

#10. Retrieve all records where Virat Kohli scored more than 100 runs:
SELECT * FROM Centurion_Innings;