-- http://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
-- Table world: name, continent, area, population, gdp

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area: 
SELECT x.continent, x.name, x.area FROM world AS x
WHERE area >= ALL(SELECT area FROM world AS y
                    WHERE x.continent = y.continent)

-- 8. List each continent and the name of the country that comes first alphabetically.
-- ALL也可以用于字母排序
SELECT x.continent, x.name FROM world AS x
WHERE x.name <= ALL(SELECT y.name FROM world AS y 
        WHERE y.continent = x.continent) 

/* 9. Find the continents where all countries have a population <= 25000000. 
Then find the names of the countries associated with these continents. 
Show name, continent and population. */
SELECT x.name, x.continent, x.population FROM world AS x 
WHERE 25000000 >= ALL(SELECT y.population FROM world AS y
                        WHERE x.continent = y.continent)

/* 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). 
Give the countries and continents.*/
-- 读题哈，是任何一个
SELECT x.name, x.continent FROM world AS x 
WHERE x.population > ALL(SELECT 3*y.population FROM world AS y 
                            WHERE x.continent = y.continent AND x.name <> y.name)