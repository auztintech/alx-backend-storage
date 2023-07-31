-- Create a temporary table to calculate the total number of non-unique fans for each country
CREATE TEMPORARY TABLE temp_country_fans AS
SELECT origin, SUM(nb_fans) AS total_fans
FROM metal_bands
GROUP BY origin;

-- Rank the countries based on the total number of fans in descending order
SELECT origin, total_fans
FROM temp_country_fans
ORDER BY total_fans DESC;

-- Drop the temporary table
DROP TEMPORARY TABLE IF EXISTS temp_country_fans;