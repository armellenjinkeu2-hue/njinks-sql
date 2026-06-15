-- Query 1: Pattern matching with LIKE
SELECT name FROM world
WHERE name LIKE '%United%'

-- Query 2: Range filter with BETWEEN
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

-- Query 3: Filter by list with IN
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- Query 4: Math with ROUND
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000

-- Query 5: CONCAT and pattern matching
SELECT name, capital FROM world
WHERE capital LIKE CONCAT(name, '%')
AND capital <> name
