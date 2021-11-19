-- DROP TABLE livingwage;

-- CREATE TABLE livingwage(
-- 	"Class" INTEGER
-- 	,"Level" VARCHAR
-- 	,_1A0C MONEY
-- 	,_1A1C MONEY
-- 	,_1A2C MONEY
-- 	,_1A3C MONEY
-- 	,_2A1W0C MONEY
-- 	,_2A1W1C MONEY
-- 	,_2A1W2C MONEY
-- 	,_2A1W3C MONEY
-- 	,_2A2W0C MONEY
-- 	,_2A2W1C MONEY
-- 	,_2A2W2C MONEY
-- 	,_2A2W3C MONEY
-- 	,"County" VARCHAR
-- 	,"State" VARCHAR
-- 	);
SELECT *
FROM livingwage;

-- DROP TABLE livingwage2;
-- CREATE TABLE livingwage2 AS
-- (SELECT 
-- 	 livingwage."Class"
-- 	,livingwage."Level"
-- 	,_1A0C
-- 	,_1A1C
-- 	,_1A2C
-- 	,_1A3C
-- 	,_2A1W0C
-- 	,_2A1W1C
-- 	,_2A1W2C
-- 	,_2A1W3C
-- 	,_2A2W0C
-- 	,_2A2W1C
-- 	,_2A2W2C
-- 	,_2A2W3C
-- 	,TRIM(TRAILING 'County' FROM livingwage."County") as COUNTY
-- 	,"State"

-- FROM livingwage);

-- SELECT *
-- FROM livingwage2;

-- CREATE TABLE fips(
-- 	"County" VARCHAR
-- 	,"State" VARCHAR
-- 	,"FIPS" VARCHAR);
SELECT *
FROM fips;

DROP TABLE main_living_wage;
CREATE TABLE main_living_wage AS
(SELECT a."Class"
	,a."Level"
	,_1A0C
	,_1A1C
	,_1A2C
	,_1A3C
	,_2A1W0C
	,_2A1W1C
	,_2A1W2C
	,_2A1W3C
	,_2A2W0C
	,_2A2W1C
	,_2A2W2C
	,_2A2W3C
	,a."County"
	,a."State"
 	,b."FIPS"

FROM livingwage a
INNER JOIN fips b
	ON a."County" = b."County"
	);

SELECT *
FROM main_living_wage

SELECT *
FROM
(
	SELECT )

